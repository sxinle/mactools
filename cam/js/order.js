var grid_selector = "#grid-table";
var pager_selector = "#grid-pager";
var orderGrid = jQuery(grid_selector);
	jQuery(function($) {
		getPaymentModeInfo();
		getOrderStateInfo();
		orderGrid.jqGrid({
			//direction: "rtl",
			url: WEB_PATH + '/mazda/order/getOrderInfo',
			data: {},
			datatype: "json",
			height: 340,
			colNames:['订单号', '车机原始系列号', '订单金额（分）', '实收金额（分）', '支付方式ID', '支付方式', '订单状态', '支付状态', '刮刮卡类型', '创建时间', '支付时间', '操作'],
			colModel:[
				{name:'order_id',index:'order_id', width:160},
				{name:'device_no',index:'device_no',width:60},
				{name:'total_fee',index:'total_fee', width:80},
				{name:'cash_fee',index:'cash_fee', width:80},
				{name:'payment_mode_id',index:'payment_mode_id', width:40, hidden:true},
				{name:'payment_mode',index:'payment_mode', width:40},
				{name:'order_state',index:'order_state',width:40},
				{name:'trade_state',index:'trade_state', width:40},
				{name:'card_type',index:'card_type', width:40},
				{name:'creat_time',index:'creat_time', width:80},
				{name:'payment_time',index:'payment_time', width:80},
				{name:'detailed',index:'detailed', width:20}
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
	            	var rowNum = orderGrid.jqGrid('getGridParam','rowNum');
	                var total = Math.ceil(obj.total/rowNum);
	                return total;
	            },
	            records: function (obj) {
	                return obj.total;
	            },
	            repeatitems: false 
	        },
			sortable: true,
			altRows: true,
			//toppager: true,
			
			multiselect: true,
			//multikey: "ctrlKey",
	        multiboxonly: true,
			gridComplete : function() {
				var ids = orderGrid.jqGrid('getDataIDs');
				  for ( var i = 0; i < ids.length; i++) {
					var cl = ids[i];
					detailedInfo = "<a href='javascript:void(0)' onclick='getDetailed(" + cl + ")'>详细</a>";
					orderGrid.jqGrid('setRowData', ids[i],
						{
						  detailed : detailedInfo 
						});
				  }
			},
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
		orderGrid.jqGrid('navGrid',pager_selector,
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
		).jqGrid('navButtonAdd',pager_selector,{caption:"", buttonicon:"icon-random green", onClickButton:function(){openModel("#syncAlipay");}, position: "first", title:"同步支付宝订单状态", cursor: "pointer"}
		).jqGrid('navButtonAdd',pager_selector,{caption:"", buttonicon:"icon-random green", onClickButton:function(){openModel("#sync");}, position: "first", title:"同步微信订单状态", cursor: "pointer"}
		).jqGrid('navButtonAdd',pager_selector,{caption:"", buttonicon:"icon-random green", onClickButton:function(){openModel("#syncCTradeState");}, position: "first", title:"同步刮刮卡支付订单状态", cursor: "pointer"});
		
	
		function openModel(e){
			$("#upd_success").hide();
			$("#add_success").hide();
			$("#upd_error").hide();
			$("#add_error").hide();
			$("#del_error").hide();
			var gr = orderGrid.jqGrid('getGridParam', 'selarrrow');
			if (gr==null || gr.length!=1){
				alert("请选择一条数据进行修改！");
			}else{	
				$(e).modal();
			}
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

//支付方式下拉列表取得
function getPaymentModeInfo() {
	$.ajax({
		type : "POST",
		async:true,
		url : WEB_PATH + '/mazda/paymentMode/getPaymentMode',
		success : function(json){
			if(json.rows.length>0){
				$("#payment_mode").empty();
				$("#payment_mode").append("<option value='0'>全部</option>");
				for(var i=0;i<json.rows.length;i++){
					$("#payment_mode").append("<option value='" + json.rows[i].mode_id + "'>" + json.rows[i].mode_name + "</option>");
				}
			}
		},
		error:function(){
			//alert('fail');
		}
	});
}

//订单状态下拉列表取得
function getOrderStateInfo() {
	$.ajax({
		type : "POST",
		async:true,
		url : WEB_PATH + '/mazda/orderState/getOrderState',
		success : function(json){
			if(json.rows.length>0){
				$("#order_state").empty();
				$("#order_state").append("<option value='0'>全部</option>");
				for(var i=0;i<json.rows.length;i++){
					$("#order_state").append("<option value='" + json.rows[i].id + "'>" + json.rows[i].state + "</option>");
				}
			}
		},
		error:function(){
			//alert('fail');
		}
	});
}

//条件查询   
function searchOrder() {
	var payment_mode_id = $("#payment_mode").find("option:selected").val();
	var	order_state_id = $("#order_state").find("option:selected").val();
	if(payment_mode_id==0){
		payment_mode_id = null;
	}
	if(order_state_id==0){
		order_state_id = null;
	}
	var data = {
		order_id: $("#order_id").val(),
		device_no: $("#device_no").val(),
		payment_mode_id : payment_mode_id,
		order_state_id : order_state_id,
	};
	orderGrid.jqGrid('setGridParam', {page:1, postData: data, url: WEB_PATH + '/mazda/order/getOrderInfo'}).trigger("reloadGrid");
}

//同步微信订单状态
function searchSync() {
	var gr = orderGrid.jqGrid('getGridParam', 'selarrrow');
	var rowData = orderGrid.jqGrid('getRowData', gr);
	if(rowData.payment_mode_id=='1'||rowData.payment_mode_id==''||rowData.payment_mode_id==null){
		var data = {
			order_id : rowData.order_id
		}
		$.ajax({
			type : "POST",
			async:true,
			url : WEB_PATH + '/mazda/order/syncWechatTradeState',
			data: data,
			success : function(json){
				if(json.respCode==100){
					alert("同步成功！");
				}else if(json.respCode==-111){
					alert("支付模式错误!");
				}else{
					alert("同步失败！");
				}
			},
			error:function(){
				//alert('fail');
			}
		});
	}else{
		alert("请选择支付宝支付的订单!");
	}
	
}
//同步支付宝订单状态
function searchSyncAlipay() {
	var gr = orderGrid.jqGrid('getGridParam', 'selarrrow');
	var rowData = orderGrid.jqGrid('getRowData', gr);
	if(rowData.payment_mode_id=='2'||rowData.payment_mode_id==''||rowData.payment_mode_id==null){
		var data = {
			order_id : rowData.order_id
		}
		$.ajax({
			type : "POST",
			async:true,
			url : WEB_PATH + '/mazda/order/syncAlipayTradeState',
			data: data,
			success : function(json){
				if(json.respCode==100){
					alert("同步成功！");
				}else if(json.respCode==-111){
					alert("支付模式错误!");
				}else{
					alert("同步失败！");
				}
			},
			error:function(){
				//alert('fail');
			}
		});
	}else{
		alert("请选择微信支付的订单!");
	}
}


//同步刮刮卡支付订单状态
function addSyncCardpayTradeState() {
	var gr = orderGrid.jqGrid('getGridParam', 'selarrrow');
	var rowData = orderGrid.jqGrid('getRowData', gr);
	if (gr==null || gr.length==0){
		alert("请选择数据进行删除！");
	}
	if(rowData.payment_mode_id=='3'){
		var data = {
			order_id : rowData.order_id
		}
		$.ajax({
			type : "POST",
			async:true,
			url : WEB_PATH + '/mazda/order/syncCardpayTradeState',
			data: data,
			success : function(json){
				if(json.respCode==100){
					alert("同步成功！");
				}else{
					alert("同步失败！");
				}
			},
			error:function(){
				//alert('fail');
			}
		});
	}else{
		alert("同步的支付方式不正确!");
	}
}



//详细
function getDetailed(num, page, page_id) {
	var rows = 10;
	if(page==null){
		page = 1;
	}
	var rowData = orderGrid.jqGrid('getRowData', num);
	$.ajax({
		type : "POST",
		async:true,
		url : WEB_PATH + '/mazda/orderItem/getOrderItem',
		data: {
			order_id : rowData.order_id,
			rows: rows,
			page: page
		},
		success : function(json){
			if(json.respCode==100){
				for(var i=0;i<json.rows.length;i++){
					var htmlArray = [];
					htmlArray.push("<tr>");
					htmlArray.push("<td>" + json.rows[i].id + "</td>");
					htmlArray.push("<td>" + json.rows[i].order_id + "</td>");
					htmlArray.push("<td>" + json.rows[i].device_no + "</td>");
					htmlArray.push("<td>" + json.rows[i].product_id + "</td>");
					htmlArray.push("<td>" + json.rows[i].goods_id + "</td>");
					htmlArray.push("<td>" + json.rows[i].goods_name + "</td>");
					htmlArray.push("<td>" + json.rows[i].region_name + "</td>");
					htmlArray.push("<td>" + json.rows[i].valid + "</td>");
					htmlArray.push("<td>" + json.rows[i].nums + "</td>");
					htmlArray.push("<td>" + json.rows[i].goods_price + "</td>");
					htmlArray.push("<td>" + json.rows[i].goods_num + "</td>");
					htmlArray.push("<td>" + json.rows[i].cash_fee + "</td>");
					htmlArray.push("<td>" + json.rows[i].data_ver + "</td>");
					htmlArray.push("</tr>");
				}
				var all_page = Math.ceil(json.total/rows);
				$("#detailed_info").html(htmlArray.join(''));
				$("#modal-table").modal();
				darwPage(num, all_page, page_id);
			}else{
			}
		},
		error:function(){
			//alert('fail');
		}
	});
}
var currentPage = 1;
function prePage(num, page, all_page, page_id) {
	if(page-1>0){
		currentPage = page-1;
		darwPage(num, all_page, page_id);
	}
}
function nextPage(num, page, all_page, page_id) {
	currentPage = page+1;
	darwPage(num, all_page, page_id);
}
function darwPage(num, all_page, page_id) {
	var pagerHtmlArray = [];
	//pagerHtmlArray.push("<li>共" + all_page + "页</li>");
	if(currentPage==1){
		pagerHtmlArray.push("<li class='prev disabled'>");
	}else{
		pagerHtmlArray.push("<li class='prev'>");
	}
	pagerHtmlArray.push("<a href='javascript:void(0)' onclick='prePage(" + num + "," + currentPage + "," + all_page + "," + page_id + ")'>");
	pagerHtmlArray.push("<i class='icon-double-angle-left'></i>");
	pagerHtmlArray.push("</a>");
	pagerHtmlArray.push("</li>");
	if(all_page==1){
		pagerHtmlArray.push("<li>");
		pagerHtmlArray.push("<a href='javascript:void(0)' onclick='getDetailed(" + num + "," + 1 + ", page1)'>" + 1 + "</a>");
		pagerHtmlArray.push("</li>");
	}else if(all_page==2){
		pagerHtmlArray.push("<li id='page1'>");
		pagerHtmlArray.push("<a href='javascript:void(0)' onclick='getDetailed(" + num + "," + 1 + ", page1)'>" + 1 + "</a>");
		pagerHtmlArray.push("</li>");
		pagerHtmlArray.push("<li id='page2'>");
		pagerHtmlArray.push("<a href='javascript:void(0)' onclick='getDetailed(" + num + "," + 2 + ", page2)'>" + 2 + "</a>");
		pagerHtmlArray.push("</li>");
	}else{
		pagerHtmlArray.push("<li id='" + currentPage + "'>");
		pagerHtmlArray.push("<a href='javascript:void(0)' onclick='getDetailed(" + num + "," + currentPage + ", page" + currentPage + ")'>" + currentPage + "</a>");
		pagerHtmlArray.push("</li>");
		pagerHtmlArray.push("<li id='" + (currentPage+1) + "'>");
		pagerHtmlArray.push("<a href='javascript:void(0)' onclick='getDetailed(" + num + "," + (currentPage+1) + ", page" + (currentPage+1) + ")'>" + (currentPage+1) + "</a>");
		pagerHtmlArray.push("</li>");
		pagerHtmlArray.push("<li id='" + (currentPage+2) + "'>");
		pagerHtmlArray.push("<a href='javascript:void(0)' onclick='getDetailed(" + num + "," + (currentPage+2) + ", page" + (currentPage+2) + ")'>" + (currentPage+2) + "</a>");
		pagerHtmlArray.push("</li>");
	}
	if(currentPage == all_page){
		pagerHtmlArray.push("<li class='next disabled'>");
	}else{
		pagerHtmlArray.push("<li class='next'>");
	}
	pagerHtmlArray.push("<a href='javascript:void(0)' onclick='nextPage(" + num + "," + currentPage + "," + all_page + "," + page_id + ")'>");
	pagerHtmlArray.push("<i class='icon-double-angle-right'></i>");
	pagerHtmlArray.push("</a>");
	pagerHtmlArray.push("</li>");
	$("#detailed_pager").html(pagerHtmlArray.join(''));
	$("#"+page_id).addClass("active");
}