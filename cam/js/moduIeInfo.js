var grid_selector = "#grid-table";
var pager_selector = "#grid-pager";
var $grid = jQuery(grid_selector);
	jQuery(function($) {
		var page = 1;
		$grid.jqGrid({
			type:"POST",
			url: WEB_PATH + '/com/product/getProduct',
			datatype: "json",
			height: 340,
			colNames:['产品系列ID','产品系列名称', 'customerKey对应秘钥', '权限 ', '激活方式 '],
			colModel:[
				{name:'product_id',index:'product_id', width:100},
				{name:'product_name',index:'product_name',width:90},
				{name:'secret_key',index:'secret_key', width:150},
				{name:'permission',index:'permission', width:150},
				{name:'act_way',index:'act_way', width:150}
			], 

			viewrecords : true,//是否显示总条数
			rowNum:10,
			rowList:[10,20,30,50,100],
			pager : pager_selector,
			jsonReader: {
	            root: function (obj) {
	            	for (var i = 0; i < obj.rows.length; i++) {
	            		obj.rows[i].id=obj.rows[i]['product_id'];
					}
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
		).jqGrid('navButtonAdd',pager_selector,{caption:"", buttonicon:"icon-pencil blue", onClickButton:function(){setUpdateModuleInfo();}, position: "first", title:"修改记录", cursor: "pointer"}
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
/*function searchmoduleInfo() {
	var module_name = $("#module_name_search").val();
	$grid.jqGrid('setGridParam',{page:1,url: WEB_PATH + '/moduleInfo/getModuleInfoManage?module_name=' + module_name}).trigger("reloadGrid");
}
*/

//修改页面
function setUpdateModuleInfo() {
	var gr = $grid.jqGrid('getGridParam', 'selarrrow');
	if (gr==null || gr.length!=1){
		alert("请选择一条数据进行修改！");
	}else{
		$("#edit").modal();
		var rowData = $grid.jqGrid('getRowData', gr);
		$("#product_id").val(rowData.product_id);
		$("#product_name").val(rowData.product_name);
    	$("#secret_key").val(rowData.secret_key);
    	$("#permission").val(rowData.permission);
    	$("#act_way").val(rowData.act_way);
	}
}


//修改
function updateModuleInfo() {
	$("#editModuleInfoForm input[type='text']").trigger('blur');
	if(input_flag){
	$.ajax({
		type: 'POST',  
		contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
        data: {
        	product_id:$("#product_id").val(),
        	product_name:$("#product_name").val(),
        	secret_key:$("#secret_key").val(),
        	permission:$("#permission").val(),
        	act_way:$("#act_way").val()
        	},
        url:WEB_PATH+'/com/product/updateProduct',
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
}


