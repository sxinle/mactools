//配置树
var setting = {  
	isSimpleData : true,              //数据是否采用简单 Array 格式，默认false  
    treeNodeKey : "children",               //在isSimpleData格式下，当前节点id属性  
    treeNodeParentKey : "id" ,   //在isSimpleData格式下，当前节点的父节点id属性  
    showLine : true           //是否显示节点间的连线  
};  


$(function(){  
    
	loadTree();

});  	

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
            $.fn.zTree.init($("#treeId"), setting, zNodes);
    		$('.date-picker').datepicker({autoclose:true}).next().on(ace.click_event, function(){$(this).prev().focus();});
    		/*$(".sel-icon").chosen({no_results_text : "未找到此图标：", width:"66.66666%" }); */
    	    $('input, textarea').placeholder();
        }  
    });  
}
			

//添加页面
$("#addMenu").on("click",function(){
	//选取菜单节点
	var treeObj = $.fn.zTree.getZTreeObj("treeId");
	var nodes = treeObj.getSelectedNodes();
	$("#add").modal({backdrop: 'static', keyboard: false});
	$("#menuName").val('');
	$("#urlName").val('');
	if(nodes[0]==undefined){
		$('#pMenuName').val("MX_ERP");
 		$('#pMenuId').val(0);
	}else{
		var nodesId=nodes[0].id;
		$("#pMenuName").val(nodes[0].name);
		$("#pMenuId").val(nodes[0].id);
		
	}
})

//添加保存
 $("#saveMenu").on("click",function(){
	 $("#addForm input[type='text']").trigger('blur');
		if(input_flag){
			var tap=0;
			$.ajax({
	            type : "POST",
	            dataType : "json",  
	            url : WEB_PATH+'/menu/saveMenuManage',
	            data: {id:tap,
	                	name:$("#menuName").val(),
	                	url:$("#urlName").val(),
	                	parentid:$("#pMenuId").val()},
	            success : function(data) {
	                if (data.respCode==100) {
	                	$("#add").modal('hide');
	                    destroyLoadTree();
	                }else if(data==-100){
	                	 alert('消息提示,菜单名称已存在！ ');
	                
	                }else {
	                    alert('消息提示,没有找到记录！ ');
	                }
	            },
	            error : function() {
	                alert('消息提示,网络错误，请稍后重试！ ');
	            }
	        });
			
        }
 });




//修改页面
$("#editMenu").on("click",function(){
	//选取菜单节点
	var treeObj = $.fn.zTree.getZTreeObj("treeId");
	var nodes = treeObj.getSelectedNodes();
	if(nodes[0]==undefined){
		alert('操作提示, 请选择菜单节点！');
		return;
	}else{
		var nodesId=nodes[0].id;
		$("#edit").modal({backdrop: 'static', keyboard: false});
		$("#menuNameEdit").val(nodes[0].name);
		$("#urlNameEdit").val(nodes[0].attributes.url);
		$("#tapEdit").val(nodes[0].id);
		 //执行ajax请求去获取父节点和子节点
		 $.ajax({
             type : "POST",
             url : WEB_PATH+'/menu/getFatherName',
             data: {id: nodesId},
             dataType:'json',
             success : function(json) {
             	if(json.respCode==100){
             		if(json.result!=null && json.result!="null"){
                 		$('#pMenuNameEdit').val(json.result.name);
                        $('#pMenuIdEdit').val(json.result.id);
             		}else{
             			$('#pMenuNameEdit').val("MX_ERP");
                 		$('#pMenuIdEdit').val(0);
             		}
                     
             	}
             },
             error : function() {
                alert('操作提示, 网络错误，请稍后重试！');
             }
         });
	}
})


//修改保存
$("#editMenuInfo").on("click",function(){
	 $("#editForm input[type='text']").trigger('blur');
		if(input_flag){
			 var tap =$("#tapEdit").val();
			$.ajax({
		           type : "POST",
		           dateType:"json",
		           url : WEB_PATH+'/menu/saveMenuManage',
		           data: {id:tap,
		               	name:$("#menuNameEdit").val(),
		               	url:$("#urlNameEdit").val(),
		               	parentid:$("#pMenuIdEdit").val()},
		           success : function(data) {
		               if (data.respCode==100) {
		               	$("#edit").modal('hide');
		                   destroyLoadTree();
		               }else if(data==-100){
		            	   alert('消息提示,菜单名称已存在！ ');
		               }
		            	else {
		                   alert('消息提示,没有找到记录！ ');
		               }
		           },
		           error : function() {
		               alert('消息提示,网络错误，请稍后重试！ ');
		           }
		       });
       }
});




//删除
$("#deleMenu").on("click",function(){
	var treeObj = $.fn.zTree.getZTreeObj("treeId");
	var nodes = treeObj.getSelectedNodes();
    if(nodes[0] != undefined){
    	 var msg=confirm('操作提示, 是否要删除所选择的数据？');
         if (msg==true) {
             if(nodes[0].children == ""){
            	 delMenu(nodes[0].id);
	         }else{
	        	 alert("操作提示, 该菜单下有子菜单 无法删除 请删除完子菜单后 再执行删除操作");
	         }
         }
    }else{
    	alert("操作提示, 请选择要删除的数据。");
    }
});

//删除菜单
function delMenu(id){
    $.ajax({
        type : "POST",
        url : WEB_PATH+'/menu/deleteMenuManage',
        data: {id: id},
        dataType:"json",
        success : function(data) {
            if (data!=""&&data!=null) {
            	
            	destroyLoadTree();
           
            } else {  
                alert("操作提示，数据库没这个数据了！");  
            }
        },
        error : function() {
        	alert("操作提示，网络错误，请稍后重试！");  
        }
    });
}


function destroyLoadTree(){
	//销毁 id 为 "treeId" 的 zTree
	var zTreeObj = $.fn.zTree.getZTreeObj("treeId");
	zTreeObj.destroy();
	//重新加载
	loadTree();
}