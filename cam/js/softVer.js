var grid_selector = "#grid-table";
var pager_selector = "#grid-pager";
var softVerGrid = jQuery(grid_selector);
	jQuery(function($) {
		var page = 1;
		softVerGrid.jqGrid({
			url: WEB_PATH + '/mazda/ver/getSoftVerList',
			datatype: "json",
			height: 340,
			colNames:['软件版本号','软件版本名'],
			colModel:[
				{name:'soft_ver',index:'soft_ver', width:150},
				{name:'soft_name',index:'soft_name',width:150}
			], 

			viewrecords : true,//是否显示总条数
			rowNum:10,
			rowList:[10,20,30,50,100],
			pager : pager_selector,
			jsonReader: {
	            root: function (obj) {
	            	for (var i = 0; i < obj.rows.length; i++) {
	            		obj.rows[i].id=obj.rows[i]['soft_ver'];
					}
	                return obj.rows;
	            },
	            total: function (obj) {
	            	var rowNum = softVerGrid.jqGrid('getGridParam','rowNum');
	                var total = Math.ceil(obj.total/rowNum);
	                return total;
	            },
	            records: function (obj) {
	                return obj.total;
	            },
	            repeatitems: false 
	        },
			altRows: true,
			//toppager: true,
			
			multiselect: true,
			//multikey: "ctrlKey",
	        multiboxonly: true,

			loadComplete : function() {
				var table = this;
				setTimeout(function(){
					styleCheckbox(table);
					
					
					updatePagerIcons(table);
					enableTooltips(table);
				}, 0);
			},
	     caption: "",
	     autowidth: true

		});
		//navButtons
		jQuery(grid_selector).jqGrid('navGrid',pager_selector,
			{ 	//navbar options
				edit: false,
				editicon : 'icon-pencil blue',
				edittext:'编辑',
				add: false,
				addicon : 'icon-plus-sign purple',
				del: false,
				delicon : 'icon-trash red',
				search: false,
				searchicon : 'icon-search orange',
				refresh: true,
				refreshicon : 'icon-refresh green',
				view: false,
				viewicon : 'icon-zoom-in grey',
			},
			{
				
			},
			{
				
			},
			
			{
				//delete record form
				recreateForm: true,
				beforeShowForm : function(e) {
					var form = $(e[0]);
					if(form.data('styled')) return false;
					
					form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar').wrapInner('<div class="widget-header" />')
					style_delete_form(form);
					
					form.data('styled', true);
				},
				onClick : function(e) {
					alert(1);
				}
			},
			{
				//search form
				recreateForm: true,
				afterShowSearch: function(e){
					var form = $(e[0]);
					form.closest('.ui-jqdialog').find('.ui-jqdialog-title').wrap('<div class="widget-header" />')
					style_search_form(form);
				},
				afterRedraw: function(){
					style_search_filters($(this));
				}
				,
				multipleSearch: true,
				
			},
			{
				recreateForm: true,
				beforeShowForm: function(e){
					var form = $(e[0]);
					form.closest('.ui-jqdialog').find('.ui-jqdialog-title').wrap('<div class="widget-header" />')
				}
			}
		).jqGrid('navButtonAdd',pager_selector,{caption:"", buttonicon:"icon-trash red", onClickButton:function(){checkDelSoftVerInfo();}, position: "first", title:"删除所选记录", cursor: "pointer"}
		).jqGrid('navButtonAdd',pager_selector,{caption:"", buttonicon:"icon-pencil blue", onClickButton:function(){setUpdateSoftVerInfo();}, position: "first", title:"修改记录", cursor: "pointer"}
		).jqGrid('navButtonAdd',pager_selector,{caption:"", buttonicon:"icon-plus-sign purple", onClickButton:function(){openModel("#add");}, position: "first", title:"添加记录", cursor: "pointer"});   
	
		
	
		function openModel(e){
			$(e).modal({backdrop: 'static', keyboard: false});
			$("#addSoftVerForm input[type='text']").val('');
			}
		
	
		function style_delete_form(form) {
			var buttons = form.next().find('.EditButton .fm-button');
			buttons.addClass('btn btn-sm').find('[class*="-icon"]').remove();//ui-icon, s-icon
			buttons.eq(0).addClass('btn-danger').prepend('<i class="icon-trash"></i>');
			buttons.eq(1).prepend('<i class="icon-remove"></i>')
		}
		
		function style_search_filters(form) {
			form.find('.delete-rule').val('X');
			form.find('.add-rule').addClass('btn btn-xs btn-primary');
			form.find('.add-group').addClass('btn btn-xs btn-success');
			form.find('.delete-group').addClass('btn btn-xs btn-danger');
		}
		function style_search_form(form) {
			var dialog = form.closest('.ui-jqdialog');
			var buttons = dialog.find('.EditTable')
			buttons.find('.EditButton a[id*="_reset"]').addClass('btn btn-sm btn-info').find('.ui-icon').attr('class', 'icon-retweet');
			buttons.find('.EditButton a[id*="_query"]').addClass('btn btn-sm btn-inverse').find('.ui-icon').attr('class', 'icon-comment-alt');
			buttons.find('.EditButton a[id*="_search"]').addClass('btn btn-sm btn-purple').find('.ui-icon').attr('class', 'icon-search');
		}
		
		function beforeDeleteCallback(e) {
			var form = $(e[0]);
			if(form.data('styled')) return false;
			
			form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar').wrapInner('<div class="widget-header" />')
			style_delete_form(form);
			
			form.data('styled', true);
		}
		
		function beforeEditCallback(e) {
			var form = $(e[0]);
			form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar').wrapInner('<div class="widget-header" />')
			style_edit_form(form);
		}
	
		function styleCheckbox(table) {
		
			$(table).find('input:checkbox').addClass('ace')
			.wrap('<label />')
			.after('<span class="lbl align-top" />')
	
	
			$('.ui-jqgrid-labels th[id*="_cb"]:first-child')
			.find('input.cbox[type=checkbox]').addClass('ace')
			.wrap('<label />').after('<span class="lbl align-top" />');
		
		}
		function updatePagerIcons(table) {
			var replacement = 
			{
				'ui-icon-seek-first' : 'icon-double-angle-left bigger-140',
				'ui-icon-seek-prev' : 'icon-angle-left bigger-140',
				'ui-icon-seek-next' : 'icon-angle-right bigger-140',
				'ui-icon-seek-end' : 'icon-double-angle-right bigger-140'
			};
			$('.ui-pg-table:not(.navtable) > tbody > tr > .ui-pg-button > .ui-icon').each(function(){
				var icon = $(this);
				var $class = $.trim(icon.attr('class').replace('ui-icon', ''));
				
				if($class in replacement) icon.attr('class', 'ui-icon '+replacement[$class]);
			})
		}
	
		function enableTooltips(table) {
			$('.navtable .ui-pg-button').tooltip({container:'body'});
			$(table).find('.ui-pg-div').tooltip({container:'body'});
		}
		$('.date-picker').datepicker({autoclose:true}).next().on(ace.click_event, function(){
			$(this).prev().focus();
		});
	    $('input, textarea').placeholder();
   });

	
//查询
function searchSoftVer() {
	var soft_ver = $("#soft_ver_search").val();
	var soft_name = $("#soft_name_search").val();
	softVerGrid.jqGrid('setGridParam',{page:1,url: WEB_PATH + '/mazda/ver/getSoftVerList?soft_ver=' + soft_ver+'&soft_name='+soft_name}).trigger("reloadGrid");
}

//添加
function saveSoftVer() {
	$("#addSoftVerForm input[type='text']").trigger('blur');
	if(input_flag){
	$.ajax({
		type: 'POST',  
        data: {
        	id:"",
        	soft_ver:$("#soft_ver").val(),
        	soft_name:$("#soft_name").val()
        	},
        url:WEB_PATH+'/mazda/ver/saveSoftVerManage',
        dataType : "json",  
		success : function(json){
			//刷新娿， 
			$("#add").modal('hide');
			softVerGrid.trigger("reloadGrid");
			window.location.reload();
		},
		error:function(){
			
		}
	});
	
	}
}

function setUpdateSoftVerInfo(){
	var gr = softVerGrid.jqGrid('getGridParam', 'selarrrow');
	if (gr==null || gr.length!=1){
		alert("请选择一条数据进行修改！");
	}else{
		$("#edit").modal({backdrop: 'static', keyboard: false});
		var rowData = softVerGrid.jqGrid('getRowData', gr);
		$("#soft_verOldEdit").val(rowData.soft_ver);
		$("#soft_verEdit").val(rowData.soft_ver);
		$("#soft_nameEdit").val(rowData.soft_name);
	}
}

//修改
function updateSoftVer() {
	$("#editSoftVerForm input[type='text']").trigger('blur');
	if(input_flag){
	$.ajax({
		type: 'POST',  
        data: {
        	id:$("#soft_verOldEdit").val(),
        	soft_ver:$("#soft_verEdit").val(),
        	soft_name:$("#soft_nameEdit").val()
        	},
        url:WEB_PATH+'/mazda/ver/saveSoftVerManage',
        dataType : "json",  
		success : function(json){
			
			$("#edit").modal('hide');
			softVerGrid.trigger("reloadGrid");
		},
		error:function(){
			
		}
	});
	
	}
}

function checkDelSoftVerInfo(){
	var gr = softVerGrid.jqGrid('getGridParam', 'selarrrow');
	if (gr==null || gr.length==0){
		alert("请选择数据进行删除！");
	}else{
		$("#del").modal({backdrop: 'static', keyboard: false});
	}
}


//删除
function delSoftVerInfo() {
	var gr = softVerGrid.jqGrid('getGridParam', 'selarrrow');
	var softVer_ids = [];
	var ids = "";
	
	for(var i=0;i<gr.length;i++){
		var rowData = softVerGrid.jqGrid('getRowData', gr[i]);
		softVer_ids[i] = rowData.soft_ver;
		if(ids==""){
			ids = rowData.soft_ver;
		}else{
			ids = ids + "," + rowData.soft_ver;
		}
	 }
	
	$.ajax({
		type : "get",
		async:false,
		url: WEB_PATH+"/mazda/ver/deleteSoftVerManage?ids=" + ids,
		success : function(json){
			if(json.respCode == 100){
				$("#del").modal('hide');
				softVerGrid.trigger("reloadGrid");
			}else{
				alert("操作提示，操作失败");
			}
		},
		error:function(){
			//alert('fail');
		}
	});
	
}


function style_delete_form(form) {
	var buttons = form.next().find('.EditButton .fm-button');
	buttons.addClass('btn btn-sm').find('[class*="-icon"]').remove();//ui-icon, s-icon
	buttons.eq(0).addClass('btn-danger').prepend('<i class="icon-trash"></i>');
	buttons.eq(1).prepend('<i class="icon-remove"></i>')
}
