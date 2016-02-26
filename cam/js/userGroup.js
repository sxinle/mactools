var grid_selector = "#grid-table";
var pager_selector = "#grid-pager";
var userGroupGrid = jQuery(grid_selector);
	jQuery(function($) {
		var page = 1;
		userGroupGrid.jqGrid({
			//direction: "rtl",
			url: WEB_PATH + '/group/getGroupManage',
			data: {},
			datatype: "json",
			height: 340,
			colNames:['ID','用户组名称', '描述','角色组ID','角色组名称', '是否内建'],
			colModel:[
				{name:'group_id',index:'group_id', width:30, hidden:true},
				{name:'group_name',index:'group_name',width:90},
				{name:'description',index:'description', width:150},
				{name:'roleIDs',index:'roleIDs', width:150,hidden:true},
				{name:'roleNames',index:'roleNames', width:150},
				{name:'buildin',index:'buildin', width:150}
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
	            	var rowNum = userGroupGrid.jqGrid('getGridParam','rowNum');
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
		userGroupGrid.jqGrid('navGrid',pager_selector,
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
		).jqGrid('navButtonAdd',pager_selector,{caption:"", buttonicon:"icon-trash red", onClickButton:function(){checkDelGroup();}, position: "first", title:"删除所选记录", cursor: "pointer"}
		).jqGrid('navButtonAdd',pager_selector,{caption:"", buttonicon:"icon-pencil blue", onClickButton:function(){setUpdateGroup();}, position: "first", title:"修改记录", cursor: "pointer"}
		).jqGrid('navButtonAdd',pager_selector,{caption:"", buttonicon:"icon-plus-sign purple", onClickButton:function(){openModel("#add");}, position: "first", title:"添加记录", cursor: "pointer"});
		
	
		function openModel(e){
			$("#upd_success").hide();
			$("#add_success").hide();
			$("#upd_error").hide();
			$("#add_error").hide();
			$("#del_error").hide();
			$(e).modal();
			$("#addUserGroupFormId input[type='text']").val("");
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

function searchGroup() {
	var group_name = $("#group_name").val();
	userGroupGrid.jqGrid('setGridParam',{page:1,url: WEB_PATH+ '/group/getGroupManage?group_name=' + group_name}).trigger("reloadGrid");
}
function checkGroup() {
	var group_name = $("#group_name_add").val();
	$.ajax({
		type : "POST",
		async:false,
		url : WEB_PATH+"/group/checkGroupName?group_name=" + group_name,
		success : function(json){
			if(json.respCode == 100){
				saveGroup(group_name);
			}
		},
		error:function(){
			//alert('fail');
		}
	});
}
function addGroup(group_name) {
	var group_name = $("#group_name_add").val();
	var description = $("#description_add").val();
	checkInput('group_name_add','group_name_addError');
	if(input_flag){
		saveGroup(null, group_name, description);
	}
	
}
function setUpdateGroup() {
	var gr = userGroupGrid.jqGrid('getGridParam', 'selarrrow');
	if (gr==null || gr.length!=1){
		alert("请选择一条数据进行修改！");
	}else{
		$("#edit").modal({backdrop: 'static', keyboard: false});
		var rowData = userGroupGrid.jqGrid('getRowData', gr);
		$("#group_name_upd").val(rowData.group_name);
		$("#description_upd").val(rowData.description);
	}
}

function updateGroup() {
	var gr = userGroupGrid.jqGrid('getGridParam', 'selarrrow');
	var rowData = userGroupGrid.jqGrid('getRowData', gr);
	var group_id = rowData.group_id;
	var group_name = $("#group_name_upd").val();
	var description = $("#description_upd").val();
	checkInput('group_name_upd','group_name_updError');
	if(input_flag){
		saveGroup(group_id, group_name, description);
	}
}
function saveGroup(group_id, group_name, description) {
	var param = {
		group_id: group_id,
		group_name: group_name,
		description: description,
		buildin: 0
	};
	var paramData = [];
	for (var p in param) {
		paramData.push(p);
		paramData.push('=');
		paramData.push(param[p]);
		paramData.push('&');
	}
	paramData.pop();
	paramData = paramData.join('');
	$.ajax({
		type : "POST",
		data:paramData,
		async:false,
		url : WEB_PATH+"/group/saveGroupManage",
		success : function(response){
			var success_info = null;
			var error_info = null;
			if(group_id){
				success_info = $("#upd_success");
				error_info = $("#upd_error");
			}else{
				success_info = $("#add_success");
				error_info = $("#add_error");
			}
			error_info.hide();
			success_info.hide();
			if(response.respCode==100){
				userGroupGrid.trigger("reloadGrid");
				window.location.reload();
				if(group_id){
					//alert("修改成功！");
					$("#upd_close_btn").click();
				}else{
					//alert("添加成功！");
					$("#add_close_btn").click();
					//success_info.show();
				}
			}else if(response=="FAILURE"){
				error_info.empty();
				error_info.append('<i class="icon-warning-sign"></i>用户组名称重复！<button type="button" class="close" data-dismiss="alert"><i class="icon-remove"></i></button>');
				error_info.show();
			}else{
				error_info.empty();
				error_info.append('<i class="icon-warning-sign"></i>通信错误！<button type="button" class="close" data-dismiss="alert"><i class="icon-remove"></i></button>');
				error_info.show();
			}
		},
		error:function(){
			//alert('fail');
		}
	});
}

function checkDelGroup() {
	var gr = userGroupGrid.jqGrid('getGridParam', 'selarrrow');
	if (gr==null || gr.length==0){
		alert("请选择一条数据进行删除！");
	}else{
		$("#del_error").hide();
		$("#del").modal({backdrop: 'static', keyboard: false});
	}
}
function delGroup() {
	var gr = userGroupGrid.jqGrid('getGridParam', 'selarrrow');
	var sel_group_info = {};
	var group_ids = [];
	var group_names = [];
	var ids = "";
	for(var i=0;i<gr.length;i++){
		var rowData = userGroupGrid.jqGrid('getRowData', gr[i]);
		group_ids[i] = rowData.group_id;
		group_names[i] = rowData.group_name;
		if(ids==""){
			ids = rowData.group_id;
		}else{
			ids = ids + "," + rowData.group_id;
		}
	}
	$.ajax({
		type : "POST",
		async:false,
		url : WEB_PATH+"/group/deleteGroupManage?ids=" + ids,
		success : function(response){
			if(response.respCode == 100){
				userGroupGrid.trigger("reloadGrid");
				//alert("删除成功");
				$("#del_close_btn").click();
			}else if(response.length){
				var noDelNames = "";
				for(var i=0;i<response.length;i++){
					if(noDelNames==""){
						noDelNames = response[i];
					}else{
						noDelNames = noDelNames + "," + response[i];
					}
				}
				for(var i=0;i<response.length;i++){
					for(var j=0;j<group_names.length;j++){
						if(response[i] == group_names[j]){
							userGroupGrid.setSelection(gr[j]);
						}
					}
				}
				var errorMsg = "用户组名称为"+noDelNames+"的已被使用，不能删除！现已将不可删除的用户组取消，再次点击删除即可将可以删除的用户组删除！"
				$("#del_error").empty();
				$("#del_error").append('<i class="icon-warning-sign"></i>' + errorMsg + '！<button type="button" class="close" data-dismiss="alert"><i class="icon-remove"></i></button>');
				$("#del_error").show();
				//alert("用户组名称为"+response+"的已被使用，不能删除！");
				
			}else{
			
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
function checkKey(e) {
	var e = e || window.event; // 兼容IE
	var keyCode = e.which ? e.which: e.keyCode; // 兼容ff
	if (keyCode == 13) {
		$("#search_group_btn").click();
	}
}

//权限设定
function updateUserGroupForMenu(){
	var gr = userGroupGrid.jqGrid('getGridParam', 'selarrrow');
	if (gr==null || gr.length==0){
		alert("请选择一条数据进行设置权限！");
	}else{
		$("#updateUserGroupId").modal({backdrop: 'static', keyboard: false});
		var rowData = userGroupGrid.jqGrid('getRowData', gr);
		$("#group_id_old").val(rowData.group_id);
		loadTree();
		//查询用户组对应的菜单
		loadRuleTree(rowData.group_id);
	}
}


//配置树
var setting = {  
	isSimpleData : true,              //数据是否采用简单 Array 格式，默认false  
    treeNodeKey : "children",               //在isSimpleData格式下，当前节点id属性  
    treeNodeParentKey : "id" ,   //在isSimpleData格式下，当前节点的父节点id属性  
    showLine : true   ,        //是否显示节点间的连线  
    check: {
		enable: true,
		autoCheckTrigger: true
	}  
    
};  
	

//加载tree
function loadTree() {
	$.ajax({  
        async : false,  
        cache:false,  
        type: 'POST',  
        dataType : "json",  
        url:WEB_PATH+'/menu/getMenuManage',
        error: function () {//请求失败处理函数  
        	alert('操作提示, 加载菜单失败！');
        },  
        success:function(data){ //请求成功后处理函数。    
           
            var zNodes = data.result;   //把后台封装好的简单Json格式赋给treeNodes
            $.fn.zTree.init($("#userTreeId"), setting, zNodes);
    		$('.date-picker').datepicker({autoclose:true}).next().on(ace.click_event, function(){$(this).prev().focus();});
    		/*$(".sel-icon").chosen({no_results_text : "未找到此图标：", width:"66.66666%" }); */
    	    $('input, textarea').placeholder();
    	    $.fn.zTree.init($("#userTreeId"), setting, zNodes).expandAll(true);
        }  
    });  
}


//保存用户组权限
function saveUserGroup111(){
	 var treeObj=$.fn.zTree.getZTreeObj("userTreeId"),
     nodes=treeObj.getCheckedNodes(true);
     var menuIds="";
     for(var i=0;i<nodes.length;i++){
    	//获取选中节点的值
    	 if(i==0) {
    		 menuIds = nodes[i].id;

    		  }else {
    		     	 menuIds = menuIds + "," +nodes[i].id;
    		 }
     }
     var data={
    		 groupId:$("#group_id_old").val(),
    		 menuIds:menuIds
     }
     $.ajax({
 		type : "POST",
 		cache:false,  
 		async:false,
 		data:data,
 		dataType:"json",
 		url: WEB_PATH+"/group/saveGroupMenu",
 		success : function(json){
 			if(json.respCode == 100){
 				
 				alert("操作提示，设置权限成功");
 				
 				$("#updateUserGroupId").modal('hide');
 				
 			}else{
 				alert("操作提示，设置权限失败");
 			}
 		},
 		error:function(){
 			//alert('fail');
 		}
 	});
 	
}



//加载用户组已分配的菜单
function loadRuleTree(){
	var gr = userGroupGrid.jqGrid('getGridParam', 'selarrrow');
	var rowData = userGroupGrid.jqGrid('getRowData', gr);
	
	var data={
			groupId:rowData.group_id
	}
	$.ajax({
 		type : "POST",
 		 cache:false,  
 		async:false,
 		data:data,
 		url: WEB_PATH+"/group/getMenuByGroup",
 		success : function(json){
 			if(json.respCode==100){
	 			var node;
				var treeObj = $.fn.zTree.getZTreeObj("userTreeId");
		 			for(var i=0;i<json.result.length;i++){
		 				//调用父级选中方法的时候不触发子集选中的方法
						node = treeObj.getNodeByParam("id", json.result[i].id, null);
						treeObj.checkNode(node, true, false);
		 			}
	 		}

 		},
 		error:function(){
 			//alert('fail');
 		}
 	});
}

var roleIdSEdit;

//权限设定
function updateUserGroup(){
	var gr = userGroupGrid.jqGrid('getGridParam', 'selarrrow');
	if (gr==null || gr.length==0){
		alert("请选择一条数据进行设置权限！");
	}else{
		$("#updateUserGroupId").modal({backdrop: 'static', keyboard: false});
		var rowData = userGroupGrid.jqGrid('getRowData', gr);
		$("#group_id_old").val(rowData.group_id);
		getAllRolesSelect();
		roleIdSEdit=rowData.roleIDs;
	}
}


//查询所有角色
function getAllRolesSelect(){
    $.ajax({
		type: 'POST', 
		dataType:'json',
		url: WEB_PATH+"/role/getRoleCombobox",
		success : function(json){
			$("#roleIDs").html('');
			$("#rightRoleIDs").html('');
			for(var i=0; i<json.result.length;i++){
	    		 var  str ='<option value="'+json.result[i].role_id+'">'+json.result[i].role_name+'</option>';
	             $("#roleIDs").append(str);
	        }
			
			if(roleIdSEdit){
	    		for(var f=0; f<roleIdSEdit.length;f++){
	        		var role_id=roleIdSEdit.split(',')
	        		$('#roleIDs').find('option[value="'+role_id[f]+'"]').appendTo('#rightRoleIDs');
	        	}
			}
			
			changeLeftRight();
		}
	});
}

//角色组切换样式
function changeLeftRight(){
	$("#lButton").click(function(){
		$("#roleIDs").find(":selected").appendTo("#rightRoleIDs");
		$("#rightRoleIDs").val();
	})
	
	$("#rButton").click(function(){
		$("#rightRoleIDs").find(":selected").appendTo("#roleIDs");
		$("#roleIDs").val();
	})
}



//保存用户组权限
function saveUserGroup(){
	 
	//取角色ID组
	$("#rightRoleIDs").find('option').prop("selected","selected");
	
	var roleIds =eval($("#rightRoleIDs").val());
	if(roleIds !=null && roleIds !=null){	
		roleIds =roleIds .join(',');
	}else{
		var roleIDs="";
	}
     var data={
    		 groupId:$("#group_id_old").val(),
    		 roleIds :roleIds 
     }
     $.ajax({
 		type : "POST",
 		cache:false,  
 		async:false,
 		data:data,
 		dataType:"json",
 		url: WEB_PATH+"/group/saveGroupRole",
 		success : function(json){
 			if(json.respCode == 100){
 				
 				alert("操作提示，设置角色权限成功");
 				
 				$("#updateUserGroupId").modal('hide');
 				
 				userGroupGrid.trigger("reloadGrid");
 				
 			}else{
 				alert("操作提示，设置权限失败");
 			}
 		},
 		error:function(){
 			//alert('fail');
 		}
 	});
 	
}
