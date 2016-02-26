var grid_selector = "#grid-table";
var pager_selector = "#grid-pager";
var $grid = jQuery(grid_selector);
	jQuery(function($) {
		var page = 1;
		$grid.jqGrid({
			url: WEB_PATH + '/com/deviceInfo/getDeviceInfo',
			datatype: "json",
			height: 340,
			colNames:['产品系列Id','车架号','车机号', '车机类型', '用户名','卡号','移动手机','电话号','性别','地址','邮件','创建时间'],
			colModel:[
			          	{name:'product_id',index:'product_id',width:100},
			            {name:'vin',index:'device_no', width:100},
						{name:'device_no',index:'device_no', width:100},
						{name:'device_type',index:'device_type', width:100},
						{name:'user_name',index:'user_name', width:100},
						{name:'card_no',index:'card_no', width:100},
						{name:'mobile_phone',index:'mobile_phone', width:100},
						{name:'fixed_phone',index:'fixed_phone', width:100},
						{name:'gender',index:'gender', width:100},
						{name:'address',index:'address', width:100},
						{name:'mail',index:'mail', width:100},
						{name:'create_time',index:'create_time', width:100}
						
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
		$grid.jqGrid('navGrid',pager_selector,
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
		).jqGrid('navButtonAdd',pager_selector,{caption:"", buttonicon:"icon-pencil blue", onClickButton:function(){setDeviceInfo();}, position: "first", title:"修改记录", cursor: "pointer"});
	
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
/*function searchDeviceInfo() {
	var device_no = $("#device_no_search").val();
	var module_type= $("#module_type_search").val();
	$grid.jqGrid('setGridParam',{page:1,url: WEB_PATH + '/encryptionPath/getEncryptionPathManage?encryption_name=' + encryption_name+"&module_type="+module_type}).trigger("reloadGrid");
}*/

	
function setDeviceInfo(){
	var gr = $grid.jqGrid('getGridParam', 'selarrrow');
	if (gr==null || gr.length!=1){
		alert("请选择一条数据进行修改！");
	}else{
		$("#edit").modal();
		var rowData = $grid.jqGrid('getRowData', gr);
		$("#product_id").val(rowData.product_id);
		$("#vin").val(rowData.vin);
    	$("#device_no").val(rowData.device_no);
    	$("#user_name").val(rowData.user_name);
    	$("#card_no").val(rowData.card_no);
    	$("#mobile_phone").val(rowData.mobile_phone);
    	$("#fixed_phone").val(rowData.fixed_phone);
    	$("#gender").val(rowData.gender);
    	$("#address").val(rowData.address);
    	$("#mail").val(rowData.mail);
	}
}


function updateDeviceInfo() {
	
	var product_id=$("#product_id").val();
	var vin=$("#vin").val();
	var device_no=$("#device_no").val();
	var user_name=$("#user_name").val();
	var card_no=$("#card_no").val();
	var mobile_phone=$("#mobile_phone").val();
	var fixed_phone=$("#fixed_phone").val();
	var gender=$("#gender").val();
	var address=$("#address").val();
	var mail=$("mail").val();
	
	var data={
			product_id:product_id,
			vin:vin,
			device_no:device_no,
			user_name:user_name,
			card_no:card_no,
			mobile_phone:mobile_phone,
			fixed_phone:fixed_phone,
			gender:gender,
			address:address,
			mail:mail
	}
	
	$.ajax({
		type: 'POST',  
        data:data,
        url:WEB_PATH+'/com/deviceInfo/updateDeviceInfo',
        dataType : "json",  
		success : function(json){
			if(json.respCode==100){
				$("#edit").modal('hide');
				$grid.trigger("reloadGrid");
			}else if(json.respCode==-116){
				alert("操作提示：保存失败，vin号为空");
				$("#edit").modal('hide');
			}
		},
		error:function(){
			
		}
	});
	
	
}