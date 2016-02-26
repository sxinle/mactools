
//登录
function loginform(){

       if($("#user_name").val()==''){
         $("#login_info").css("visibility", "visible");
        $("#login_info").html("请输入用户名！");  
         return;
       }
        if($("#user_pwd").val()==''){
         $("#login_info").css("visibility", "visible");
        $("#login_info").html("请输入密码！");  
         return;
       }
       if($("#vaild_code").val()==''){
         $("#login_info").css("visibility", "visible");
        $("#login_info").html("请输入验证码！");  
         return;
       }
       var name =$("#user_name").val();
       var password =$("#user_pwd").val();
       
       var data={"user_name":name,"user_pwd":password};
       
       $.ajax({
        type:'POST',
        url:'/mx_device_shop/login/login',
        data:data,
        dataType:'json',
        success:function(data){
           if(data.respCode==100){
        	 //地址栏传入中文加密方式
        	 name=encodeURI(name);
             window.location.href="main.html?name="+name;
             $('#vaild_code').removeAttr("readonly");
             $("#vaild_code").val('');
          }else if(data.respCode==-100){
             $("#login_info").css("visibility", "visible");
             $("#login_info").html("用户名或密码错误！");            
             $('#vaild_code').removeAttr("readonly");
             $("#login-code-img").click();
             $("#vaild_code").val('');
          }                
        },  
        error:function(){              
        }  
      }); 
       
    }


//退出

function loginOutForm(){
    $.ajax({
     type:'POST',
     url:'/mx_device_shop/login/loginOut',
     dataType:'json',
     success:function(data){
        if(data.respCode==100){
          window.location.reload();
          window.location.href="index.html";
        }else {
    	   alert("操作提示：退出失败！")
       }                
     },  
     error:function(){              
     }  
   }); 
    
 }

	
//查询菜单

function queryUserMenuTree(){
	$.ajax({
	     type:'POST',
	     url:'/mx_device_shop/login/queryUserMenu',
	     dataType:'json',
	     success:function(json){
	      if(json.respCode==100){
	    	    var data = {
	    	    		list:json.result
	  	        };
	  			var html = template('nav-list-tpl', data);
	  			document.getElementById('sidebar').innerHTML = html;
	          $('#sidebar').on('click', '.open', function() {
	        	  if(!$(this).hasClass('subli')) {
	        		  $(this).siblings().removeClass('active');
		        	  $(this).addClass('active');
	        	  }
	          });
	          $('#sidebar').on('click', '.submenu-lick', function() {
		        	  $('.icon-double-angle-right').removeClass('icon-double-angle-right');
		        	  $(this).find('i').addClass('icon-double-angle-right');
		        	  $(this).closest('ul').siblings().each(function() {
		        	  $(this).find('li').removeClass('active');
	        	 });
	        	 
	        	  $(this).closest('li').addClass('active');
	          })
	       }else {
	    	   alert("操作提示：查询菜单异常！")
	       }             
	     },  
	     error:function(){              
	     }  
	   }); 
}



//登录页面回车方法
document.onkeydown=function keyDown(event){
	if(event.keyCode==13){// Enter 有效
		loginform();
	}
}; 