var grid_selector = "#grid-table";
var pager_selector = "#grid-pager";
var $grid = jQuery(grid_selector);
	jQuery(function($) {
		var page = 1;
		$grid.jqGrid({
			url: WEB_PATH + '/com/tsp/getTsp',
			datatype: "json",
			height: 340,
			colNames:['ID ','鉴权订单Id', '免费年限','服务类型'],
			colModel:[
				{name:'id',index:'id', width:100},
				{name:'auth_order_id',index:'auth_order_id',width:100},
				{name:'free_upg_duration',index:'free_upg_duration', width:100},
				{name:'service_type',index:'service_type', width:100}
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
		);   
	
		
	
		function openModel(e){
			$(e).modal({backdrop: 'static', keyboard: false});;
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
function searchTsp() {
	var auth_order_id = $("#auth_order_id_search").val();
	var PostData={auth_order_id:auth_order_id};
	$grid.jqGrid('setGridParam',{page:1,postData:PostData,url: WEB_PATH + '/com/tsp/getTsp'}).trigger("reloadGrid");
}
