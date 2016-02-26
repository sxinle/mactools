
$(function(){ 
	//页面初始化加载页面如果没登录，返回登录页面
	getAllRolesSelectForSearch();
})

var grid_selector = "#grid-table";
var pager_selector = "#grid-pager";
var camUserGrid = jQuery(grid_selector);
	jQuery(function($) {
		var page = 1;
		var PostData={enable:0};
		camUserGrid.jqGrid({
			url: WEB_PATH + '/user/getUserManage',
			postData: PostData,
			datatype: "json",
			height: 340,
			colNames:['ID','密码','用户名','真实姓名','是否可用','邮箱','手机','性别','地址','角色ID组','角色名称组','用户ID组','用户组名称','创建时间','更新时间'],
			colModel:[
				{name:'user_id',index:'user_id', width:150,hidden:true},
				{name:'user_pwd',index:'user_pwd', width:150,hidden:true},
				{name:'user_name',index:'user_name',width:150},
				{name:'user_fullname',index:'user_fullname', width:150},
				{name:'enable',index:'enable', width:150},
				{name:'mail',index:'mail', width:150},
				{name:'phone',index:'phone', width:150},
				{name:'gender',index:'gender', width:150},
				{name:'address',index:'gender', width:150},
				{name:'roleIDs',index:'roleIDs', width:150,hidden:true},
				{name:'roleNames',index:'roleNames', width:150},
				{name:'groupIDs',index:'roleIDs', width:150,hidden:true},
				{name:'groupNames',index:'roleNames', width:150},
				{name:'start_time',index:'start_time', width:150},
				{name:'update_time',index:'update_time', width:150}
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
	            	var rowNum = camUserGrid.jqGrid('getGridParam','rowNum');
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
		camUserGrid.jqGrid('navGrid',pager_selector,
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
		
		).jqGrid('navButtonAdd',pager_selector,{caption:"", buttonicon:"icon-pencil blue", onClickButton:function(){setCamUserInfo();}, position: "first", title:"修改记录", cursor: "pointer"}
	)
		
	
		function openModel(e){
			$("#upd_success").hide();
			$("#add_success").hide();
			$("#upd_error").hide();
			$("#add_error").hide();
			$("#del_error").hide();
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

//初始化查询角色
	
	function getAllRolesSelectForSearch(){
	    $.ajax({
			type: 'POST', 
			dataType:'json',
			url: WEB_PATH+"/role/getRoleCombobox",
			success : function(json){
				$("#role_id_search").html('');
				var str= [];
				str.push('<option value="">'+"全部"+'</option>');
				for(var i=0; i<json.result.length;i++){
					str.push('<option value="'+json.result[i].role_id+'">'+json.result[i].role_name+'</option>');
		        }
				str = str.join('');
				$("#role_id_search").append(str);
			},
			error:function(){
				//alert('fail');
			}
		});
	}
	
	//查询
	function searchCamUser() {
		var user_name = $("#user_name_search").val();
		var role_id = $("#role_id_search").val();
		var PostData={user_name:user_name,roleIDs:role_id};
		camUserGrid.jqGrid('setGridParam',{page:1,postData:PostData,url: WEB_PATH + '/user/getUserManage'}).trigger("reloadGrid");
	}


	
	//角色组切换样式
	function changeELeftRight(){
		$("#elButton").click(function(){
			$("#eroleIDs").find(":selected").appendTo("#erightRoleIDs");
			$("#erightRoleIDs").val('');
		})
		
		$("#erButton").click(function(){
			$("#erightRoleIDs").find(":selected").appendTo("#eroleIDs");
			$("#eroleIDs").val('');
		})
	}
	
	//用户组切换样式
	function changeELeftRightGroups(){
		$("#elgButton").click(function(){
			$("#egroupIDs").find(":selected").appendTo("#erightGroupIDs");
			$("#erightGroupIDs").val('');
		})
		
		$("#ergButton").click(function(){
			$("#erightGroupIDs").find(":selected").appendTo("#egroupIDs");
			$("#egroupIDs").val('');
		})
	}
	
	
	//全局变量
	var roleIdSEdit;
	var groupIdSEdit;
	
	//修改弹出层
	function setCamUserInfo(){
		var gr = camUserGrid.jqGrid('getGridParam', 'selarrrow');
		if (gr==null || gr.length!=1){
			alert("请选择一条数据进行修改！");
		}else{
			$("#edit").modal({backdrop: 'static', keyboard: false});
			var rowData = camUserGrid.jqGrid('getRowData', gr);
			$("#user_idEdit").val(rowData.user_id);
			$("#user_nameEdit").val(rowData.user_name);
	    	$("#user_pwdEdit").val(rowData.user_pwd);
	    	$("#user_fullnameEdit").val(rowData.user_fullname);
	    	$("#enableEdit").val(rowData.enable);
	    	$("#mailEdit").val(rowData.mail);
	    	$("#phoneEdit").val(rowData.phone);
	    	$("#addressEdit").val(rowData.address);
	    	$("#genderEdit").val(rowData.gender);
	    	
	    	roleIdSEdit=rowData.roleIDs;
	    	groupIdSEdit=rowData.groupIDs;
	    	getAllERolesSelect();
	    	getAllEGroupSelect();
	    	changeELeftRight();
	    	changeELeftRightGroups();
		}
	}
	
	//查询编辑页面角色
	function getAllERolesSelect(){
	    $.ajax({
			type: 'POST', 
			async:false,
			url: WEB_PATH+"/role/getRoleCombobox",
			success : function(json){
				$("#eroleIDs").html('');
				$('#erightRoleIDs').html('');
				for(var i=0; i<json.result.length;i++){
		    		 var  str ='<option value="'+json.result[i].role_id+'">'+json.result[i].role_name+'</option>';
		             $("#eroleIDs").append(str);
		        }
				
				if(roleIdSEdit){
		    		for(var f=0; f<roleIdSEdit.length;f++){
		        		var role_id=roleIdSEdit.split(',')
		        		$('#eroleIDs').find('option[value="'+role_id[f]+'"]').appendTo('#erightRoleIDs');
		        	}
				}
				
			},
			error:function(){
				//alert('fail');
			}
		});
	}
	//查询编辑页面数组
	function getAllEGroupSelect(){
		$.ajax({
			type: 'POST', 
			async:false,
			dataType:'json',
			url: WEB_PATH+"/group/getGroupCombobox",
			success : function(json){
				$("#egroupIDs").html('');
				$('#erightGroupIDs').html('');
				for(var i=0; i<json.result.length;i++){
		    		 var  str ='<option value="'+json.result[i].group_id+'">'+json.result[i].group_name+'</option>';
		             $("#egroupIDs").append(str);
		        }
				if(groupIdSEdit){
		    		for(var k=0; k<groupIdSEdit.length;k++){
		    			var group_id=groupIdSEdit.split(',')
		        		$('#egroupIDs').find('option[value="'+group_id[k]+'"]').appendTo('#erightGroupIDs');
		        	}
		    	}
			},
			error:function(){
				//alert('fail');
			}
		});
	}
	
	

	//修改
	function updateCamUser() {
		
		$("#editCamUserForm input[id='user_nameEdit']").trigger('blur');
		$("#editCamUserForm input[id='user_pwdEdit']").trigger('blur');
		$("#editCamUserForm input[id='user_fullnameEdit']").trigger('blur');
		/*checkSelect('erightRoleIDs','erightRoleIDsError');
		checkSelectRight('erightGroupIDs','erightGroupIDsError');*/
		if(input_flag){
		/*if(input_flag && select_flag && selectRight_flag ){*/
			//取角色ID组
			$("#erightRoleIDs").find('option').prop("selected","selected");
			var roleIDs=eval($("#erightRoleIDs").val());
			if(roleIDs!=null && roleIDs!=null){	
				roleIDs=roleIDs.join(',');
			}else{
				roleIDs="";
			}
			
			
			
			//取人员数组
			$("#erightGroupIDs").find('option').prop("selected","selected");
			var groupIDs=eval($("#erightGroupIDs").val());
			if(groupIDs!=null && groupIDs!=null){
				groupIDs=groupIDs.join(',');
			}else{
				groupIDs="";
			}
			
			var data= {
		        	user_id:$("#user_idEdit").val(),
		        	user_name:$("#user_nameEdit").val(),
		        	/*user_pwd:$("#user_pwdEdit").val(),*/
		        	user_fullname:$("#user_fullnameEdit").val(),
		        	enable:$("#editCamUserForm select[role='enableEdit']").val(),
		        	mail:$("#mailEdit").val(),
		        	phone:$("#phoneEdit").val(),
		        	address:$("#addressEdit").val(),
		        	gender:$("#genderEdit").val(),
		        	roleIDs:roleIDs,
		        	groupIDs:groupIDs
			};
			
			$.ajax({
				type: 'POST',  
		        data:data,
		        url:WEB_PATH+'/user/saveUser',
		        dataType : "json",  
				success : function(json){
					if(json.respCode==100){
						$("#edit").modal('hide');
						camUserGrid.trigger("reloadGrid");
					}else if(json.respCode==-110){
						alert("操作提示：用户名称已存在，请重新录入。");
					}
					
				},
				error:function(){
					
				}
			});
		}
	}

	