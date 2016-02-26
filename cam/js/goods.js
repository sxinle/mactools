var grid_selector = "#grid-table";
var pager_selector = "#grid-pager";
var goodsGrid = jQuery(grid_selector);
	jQuery(function($) {
		getCatagoryInfoForSearch("#catagory_name");
		var page = 1;
		goodsGrid.jqGrid({
			//direction: "rtl",
			url: WEB_PATH + '/mazda/goods/getGoodsManage',
			data: {},
			//postData: PostData,
			datatype: "json",
			height: 340,
			colNames:['商品ID','商品类别ID', '商品类别', '商品名称', '区域名称', '有效期（天）', '次数', '刮刮卡类型', '商品价格（分）', '商品描述'],
			colModel:[
				{name:'goods_id',index:'goods_id', width:40},
				{name:'catagory_id',index:'catagory_id', width:40,hidden:true},
				{name:'catagory_name',index:'catagory_name',width:40},
				{name:'goods_name',index:'goods_name', width:60},
				{name:'region_name',index:'region_name', width:60},
				{name:'valid',index:'valid', width:40},
				{name:'nums',index:'nums',width:40},
				{name:'card_type',index:'card_type', width:40},
				{name:'price',index:'price', width:40},
				{name:'description',index:'description', width:150},
			], 
			contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
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
	            	var rowNum = goodsGrid.jqGrid('getGridParam','rowNum');
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
			mtype : "post",
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
		goodsGrid.jqGrid('navGrid',pager_selector,
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
		).jqGrid('navButtonAdd',pager_selector,{caption:"", buttonicon:"icon-trash red", onClickButton:function(){checkDelGoods();}, position: "first", title:"删除所选记录", cursor: "pointer"}
		).jqGrid('navButtonAdd',pager_selector,{caption:"", buttonicon:"icon-pencil blue", onClickButton:function(){setUpdateGoods();}, position: "first", title:"修改记录", cursor: "pointer"}
		).jqGrid('navButtonAdd',pager_selector,{caption:"", buttonicon:"icon-plus-sign purple", onClickButton:function(){setAddGoods();}, position: "first", title:"添加记录", cursor: "pointer"});
		
	
		
		
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
function getCatagoryInfoForSearch(sel_id) {
	$.ajax({
		type : "POST",
		async:true,
		url : WEB_PATH + '/mazda/catagory/getCatagoryManage',
		success : function(json){
			if(json.rows.length>0){
				$("#catagory_name").html('');
				$("#catagory_name").append("<option value='0'>全部</option>");
				for(var i=0;i<json.rows.length;i++){
					$("#catagory_name").append("<option value='" + json.rows[i].catagory_id + "'>" + json.rows[i].catagory_name + "</option>");
				}
			}
		},
		error:function(){
			//alert('fail');
		}
	});
}	


//条件查询   
function searchGoods() {
	var catagory_id = $("#catagory_name").find("option:selected").val();
	var catagory_name = $("#catagory_name").find("option:selected").text();
	if(catagory_id==0){
		catagory_id = null;
		catagory_name = null;
	}
	var data = {
		goods_id: $("#goods_id").val(),
		goods_name: $("#goods_name").val(),
		catagory_id : catagory_id,
		catagory_name : catagory_name
	};
	goodsGrid.jqGrid('setGridParam', {page:1, postData: data, url: WEB_PATH + '/mazda/goods/getGoodsManage'}).trigger("reloadGrid");
}



//打开添加页面
function setAddGoods(){
	$("#upd_success").hide();
	$("#add_success").hide();
	$("#upd_error").hide();
	$("#add_error").hide();
	$("#del_error").hide();
	getCatagoryInfo("#catagory_name_add");
	$("#add").modal({backdrop: 'static', keyboard: false});
	$("#addGoodsFormId input[type='text']").val("");
}


//添加
function getCatagoryInfo(sel_id) {
	$.ajax({
		type : "POST",
		async:true,
		url : WEB_PATH + '/mazda/catagory/getCatagoryManage',
		success : function(json){
			if(json.rows.length>0){
				
				$(sel_id).html('');
				for(var i=0;i<json.rows.length;i++){
					$(sel_id).append("<option value='" + json.rows[i].catagory_id + "'>" + json.rows[i].catagory_name + "</option>");
				}
				
				$(sel_id).change(function(){
					 var productSeries= $(sel_id).val();
					 getPrefixInfoForInput(productSeries,"#card_type_add");
		        });
				
				var productSeries= $(sel_id).val();
				getPrefixInfoForInput(productSeries,"#card_type_add");
			
			}
		},
		error:function(){
			//alert('fail');
		}
	});
}



//添加
function addGoods() {
	checkInput('goods_id_add','goods_id_addError');
	checkInput('goods_name_add','goods_name_addError');
	if(input_flag && inputPrice_flag ){
		var param = {
				id : "",
				goods_id : $("#goods_id_add").val(),
				catagory_id : $("#catagory_name_add").find("option:selected").val(),
				catagory_name : $("#catagory_name_add").find("option:selected").text(),
				goods_name : $("#goods_name_add").val(),
				region_name : $("#region_name_add").val(),
				valid : $("#valid_add").val(),
				nums : $("#nums_add").val(),
				price : $("#price_add").val(),
				description : $("#description_add").val(),
				card_type:$("#card_type_add").val()
			}
			saveGoods(param);
	}
	
}
 


//设置修改页面信息
function setUpdateGoods() {
	var gr = goodsGrid.jqGrid('getGridParam', 'selarrrow');
	if (gr==null || gr.length!=1){
		alert("请选择一条数据进行修改！");
	}else{
		$("#edit").modal({backdrop: 'static', keyboard: false});
		var rowData = goodsGrid.jqGrid('getRowData', gr);
		$("#goods_id_upd").val(rowData.goods_id);
		$("#goods_name_upd").val(rowData.goods_name);
		$("#region_name_upd").val(rowData.region_name);
		$("#valid_upd").val(rowData.valid);
		$("#nums_upd").val(rowData.nums);
		$("#price_upd").val(rowData.price);
		$("#description_upd").val(rowData.description);
		//商品类别
		$("#catagory_name_upd").val(rowData.catagory_id);
		getCatagoryInfoUpdate("#catagory_name_upd",rowData.catagory_id);
	}
}

//修改
function getCatagoryInfoUpdate(sel_id,catagory_id) {
	$.ajax({
		type : "POST",
		async:true,
		url : WEB_PATH + '/mazda/catagory/getCatagoryManage',
		success : function(json){
			if(json.rows.length>0){
				$(sel_id).html('');
				for(var i=0;i<json.rows.length;i++){
					
					if(json.rows[i].catagory_id==catagory_id){
						$(sel_id).append("<option value='" + json.rows[i].catagory_id + "' selected='selected'>" + json.rows[i].catagory_name + "</option>");
					}else{
						$(sel_id).append("<option value='" + json.rows[i].catagory_id + "'>" + json.rows[i].catagory_name + "</option>");
					}
					
				}
				$(sel_id).change(function(){
					 var productSeries= $(sel_id).val();
					 getPrefixInfoForInput(productSeries,"#card_type_edit")
		        });
				
				var productSeries= $(sel_id).val();
				getPrefixInfoForInput(productSeries,"#card_type_edit");
			}
		},
		error:function(){
			//alert('fail');
		}
	});
}

//修改
function updateGoods() {
	var gr = goodsGrid.jqGrid('getGridParam', 'selarrrow');
	var rowData = goodsGrid.jqGrid('getRowData', gr);
	var id = rowData.goods_id;
	checkInput('goods_id_upd','goods_id_updError');
	checkInput('goods_name_upd','goods_name_updError');
	if(input_flag ){
		var param = {
			id : id,
			goods_id : $("#goods_id_upd").val(),
			catagory_id : $("#catagory_name_upd").find("option:selected").val(),
			catagory_name : $("#catagory_name_upd").find("option:selected").text(),
			goods_name : $("#goods_name_upd").val(),
			region_name : $("#region_name_upd").val(),
			valid : $("#valid_upd").val(),
			nums : $("#nums_upd").val(),
			price : $("#price_upd").val(),
			description : $("#description_upd").val(),
			card_type:$("#card_type_edit").val()
		}
		saveGoods(param);
	}
}

//保存
function saveGoods(param) {
	$.ajax({
		type : "POST",
		async:false,
		url : WEB_PATH+"/mazda/goods/saveGoodsManage",
		data: param,
		success : function(json){
			if(json.respCode==100){
				goodsGrid.trigger("reloadGrid");
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
//判断删除时所选数据条数
function checkDelGoods() {
	var gr = goodsGrid.jqGrid('getGridParam', 'selarrrow');
	if (gr==null || gr.length==0){
		alert("请选择一条数据进行删除！");
	}else{
		$("#del_error").hide();
		$("#del").modal({backdrop: 'static', keyboard: false});
	}
}
//删除
function delGoods() {
	var gr = goodsGrid.jqGrid('getGridParam', 'selarrrow');
	var sel_goods_info = {};
	var goods_ids = [];
	var goods_names = [];
	var ids = "";
	for(var i=0;i<gr.length;i++){
		var rowData = goodsGrid.jqGrid('getRowData', gr[i]);
		goods_ids[i] = rowData.goods_id;
		goods_names[i] = rowData.goods_name;
		if(ids==""){
			ids = rowData.goods_id;
		}else{
			ids = ids + "," + rowData.goods_id;
		}
	}
	$.ajax({
		type : "get",
		async:false,
		url : WEB_PATH+"/mazda/goods/deleteGoodsManage?ids=" + ids,
		success : function(json){
			if(json.respCode==100){
				goodsGrid.trigger("reloadGrid");
				$("#del").modal('hide');
			}else{
				alert("网络错误，请刷新重试！");
			}
		},
		error:function(){
			//alert('fail');
		}
	});
}


//查刮刮卡类型
function getPrefixInfoForInput(productSeries,select_id){
    $.ajax({
		type: 'POST', 
		data:{productSeries:productSeries},
		dataType:'json',
		url: WEB_PATH+"/com/prefixInfo/getPrefixInfo",
		success : function(json){
			$(select_id).html('');
			var str= [];
			for(var i=0; i<json.rows.length;i++){
				str.push('<option value="'+json.rows[i].prefixData+'">'+json.rows[i].prefixName+'</option>');
	        }
			str = str.join('');
			$(select_id).append(str);
		},
		error:function(){
			//alert('fail');
		}
	});
}