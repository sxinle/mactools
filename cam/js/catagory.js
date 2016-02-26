var grid_selector = "#grid-table";
var pager_selector = "#grid-pager";
var catagoryGrid = jQuery(grid_selector);
	jQuery(function($) {
		catagoryGrid.jqGrid({
			//direction: "rtl",
			url: WEB_PATH + '/mazda/catagory/getCatagoryManage',
			data: {},
			datatype: "json",
			height: 340,
			colNames:['商品类别ID','商品类别名称'],
			colModel:[
				{name:'catagory_id',index:'catagory_id', width:30},
				{name:'catagory_name',index:'catagory_name',width:90}
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
	            	var rowNum = catagoryGrid.jqGrid('getGridParam','rowNum');
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
		catagoryGrid.jqGrid('navGrid',pager_selector,
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
				//view record form
				
				recreateForm: true,
				beforeShowForm: function(e){
					var form = $(e[0]);
					form.closest('.ui-jqdialog').find('.ui-jqdialog-title').wrap('<div class="widget-header" />')
				}
			}
		).jqGrid('navButtonAdd',pager_selector,{caption:"", buttonicon:"icon-trash red", onClickButton:function(){checkDelCatagory();}, position: "first", title:"删除所选记录", cursor: "pointer"}
		).jqGrid('navButtonAdd',pager_selector,{caption:"", buttonicon:"icon-pencil blue", onClickButton:function(){setUpdateCatagory();}, position: "first", title:"修改记录", cursor: "pointer"}
		).jqGrid('navButtonAdd',pager_selector,{caption:"", buttonicon:"icon-plus-sign purple", onClickButton:function(){openModel("#add");}, position: "first", title:"添加记录", cursor: "pointer"});
		
	
		function openModel(e){
			$("#upd_success").hide();
			$("#add_success").hide();
			$("#upd_error").hide();
			$("#add_error").hide();
			$("#del_error").hide();
			$(e).modal();
			$("#addCategoryFormId input[type='text']").val("");
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
   
function addCatagory() {
	var param = {
		id : "",
		catagory_id : $("#catagory_id_add").val(),
		catagory_name : $("#catagory_name_add").val()
	}
	saveCatagory(param);
}
function setUpdateCatagory() {
	var gr = catagoryGrid.jqGrid('getGridParam', 'selarrrow');
	if (gr==null || gr.length!=1){
		alert("请选择一条数据进行修改！");
	}else{
		$("#edit").modal();
		var rowData = catagoryGrid.jqGrid('getRowData', gr);
		$("#catagory_id_upd").val(rowData.catagory_id);
		$("#catagory_name_upd").val(rowData.catagory_name);
	}
}

function updateCatagory() {
	var gr = catagoryGrid.jqGrid('getGridParam', 'selarrrow');
	var rowData = catagoryGrid.jqGrid('getRowData', gr);
	var id = rowData.catagory_id;
	var param = {
		id : id,
		catagory_id : $("#catagory_id_upd").val(),
		catagory_name : $("#catagory_name_upd").val()
	}
	saveCatagory(param);
}

function saveCatagory(param) {
	$.ajax({
		type : "POST",
		async:false,
		url : WEB_PATH+"/mazda/catagory/saveCatagoryManage",
		data: param,
		success : function(json){
			if(json.respCode==100){
				catagoryGrid.trigger("reloadGrid");
				window.location.reload();
				if(param.id){
					$("#edit").modal('hide');
				}else{
					$("#add").modal('hide');
				}
			}else if(json.respCode==-210){
				alert("名称或ID重复！");
			}else{
				alert("网络错误，请刷新重试！");
			}
		},
		error:function(){
			//alert('fail');
		}
	});
}

function checkDelCatagory() {
	var gr = catagoryGrid.jqGrid('getGridParam', 'selarrrow');
	if (gr==null || gr.length==0){
		alert("请选择一条数据进行删除！");
	}else{
		$("#del_error").hide();
		$("#del").modal();
	}
}
function delCatagory() {
	var gr = catagoryGrid.jqGrid('getGridParam', 'selarrrow');
	var sel_catagory_info = {};
	var catagory_ids = [];
	var catagory_names = [];
	var ids = "";
	for(var i=0;i<gr.length;i++){
		var rowData = catagoryGrid.jqGrid('getRowData', gr[i]);
		catagory_ids[i] = rowData.catagory_id;
		catagory_names[i] = rowData.catagory_name;
		if(ids==""){
			ids = rowData.catagory_id;
		}else{
			ids = ids + "," + rowData.catagory_id;
		}
	}
	$.ajax({
		type : "POST",
		async:false,
		url : WEB_PATH+"/mazda/catagory/deleteCatagoryManage?ids=" + ids,
		success : function(json){
			if(json.respCode==100){
				catagoryGrid.trigger("reloadGrid");
				$("#del").modal('hide');
			}else if(json.respCode==-110){
				alert("删除选项中有被使用的商品类别，请重新选择");
			}else{
			
			}
		},
		error:function(){
			//alert('fail');
		}
	});
}