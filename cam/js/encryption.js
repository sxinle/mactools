var grid_selector = "#grid-table";
var pager_selector = "#grid-pager";
var $grid= jQuery(grid_selector);
	jQuery(function($) {
		var page = 1;
		$grid.jqGrid({
			type:"POST",
			url: WEB_PATH + '/com/encryption/getEncryption',
			datatype: "json",
			height: 340,
			colNames:['软件版本号','产品系列ID（加密库模型号）', '加密库名称', '文件路径', '加密库版本','产品系列名称','激活方式'],
			colModel:[
				{name:'soft_ver',index:'soft_ver', width:230},
				{name:'product_id',index:'product_id', width:100},
				{name:'encryption_name',index:'encryption_name',width:50},
				{name:'encryption_path',index:'encryption_path', width:150},
				{name:'encryption_ver',index:'encryption_ver', width:50},
				{name:'product_name',index:'product_name', width:70},
				{name:'act_way',index:'act_way',width:50}
			], 

			viewrecords : true,//是否显示总条数
			rowNum:10,
			rowList:[10,20,30,50,100],
			pager : pager_selector,
			jsonReader: {
	            root: function (obj) {
	                return obj.rows;
	            },
	            total: function (obj) {
	            	var rowNum = $grid.jqGrid('getGridParam','rowNum');
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
		)/*.jqGrid('navButtonAdd',pager_selector,{caption:"", buttonicon:"icon-pencil blue", onClickButton:function(){
				var ids=$grid.jqGrid("getGridParam","selarrrow");
				if(ids.length==1){
				    var rowid=$grid.jqGrid("getGridParam","selrow");
				    $("#encryption_idEdit").val(rowid);
				    openModel("#edit");
				}else{
				    alert("你没有选取或者选取为多行数据，不允许进入下一级");
				}
			}, position: "first", title:"修改记录", cursor: "pointer"}).jqGrid('navButtonAdd',pager_selector,{caption:"", buttonicon:"icon-plus-sign purple", onClickButton:function(){openModel("#add");}, position: "first", title:"添加记录", cursor: "pointer"});   
			*/
		
		.jqGrid('navButtonAdd',pager_selector,{caption:"", buttonicon:"icon-pencil blue", onClickButton:function(){setUpdateEncryption();}, position: "first", title:"修改记录", cursor: "pointer"}
		)
		
	
		function openModel(e){
			$(e).modal();
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
function searchEncryption() {
	var encryption_name = $("#encryption_name_search").val();
	$grid.jqGrid('setGridParam',{page:1,url: WEB_PATH + '/encryptionPath/getEncryptionPathManage?encryption_name=' + encryption_name}).trigger("reloadGrid");
}




//修改页面
function setUpdateEncryption() {
	var gr = $grid.jqGrid('getGridParam', 'selarrrow');
	if (gr==null || gr.length!=1){
		alert("请选择一条数据进行修改！");
	}else{
		$("#edit").modal();
		var rowData = $grid.jqGrid('getRowData', gr);
		$("#soft_ver").val(rowData.soft_ver);
		$("#product_id").val(rowData.product_id);
    	$("#encryption_name").val(rowData.encryption_name),
    	$("#encryption_path").val(rowData.encryption_path),
    	$("#encryption_ver").val(rowData.encryption_ver),
    	$("#product_name").val(rowData.product_name),
    	$("#act_way").val(rowData.act_way)
	}
}


//修改
function updateEncryption() {
	var data= {
        	soft_ver:$("#soft_ver").val(),
        	product_id:$("#product_id").val(),
        	encryption_name:$("#encryption_name").val(),
        	encryption_path:$("#encryption_path").val(),
        	encryption_ver:$("#encryption_ver").val(),
        	product_name:$("#product_name").val(),
        	act_way:$("#act_way").val()
        	
		}
	$.ajax({
		type: 'POST',  
		contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
        data:data,
        url:WEB_PATH+'/com/encryption/updateEncryption',
        dataType : "json",  
		success : function(json){
			if(json.respCode==100){
				
				$("#edit").modal('hide');
				$grid.trigger("reloadGrid");
			}
			
			
		},
		error:function(){
			
		}
	});
	
}

