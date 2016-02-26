//工程路径
var WEB_PATH='/mx_device_shop';

$(function(){ 
	//页面初始化加载页面如果没登录，返回登录页面
	loading();
})

function loading(){
		
		$.ajax({
		  	//type: 'POST', 
			url: WEB_PATH+"/user/isAlive",
			dataType: "json",
			success : function(json){
				if(json.respCode == 100){
					
				}
				else if(json.respCode == 2000){
					window.top.location.reload();
					window.top.location.href="index.html";
				}
				else{
					alert("操作提示，操作失败");
				}
			},
			error:function(){
				//alert('fail');
			}
		});
	}


//表单验证
//验证文本框，不能为空也不能有特殊字符
var input_flag=false;
function checkInput(input,inputError){
	input_flag=false;
	 var inputValue=$("#"+input+"").val();
	 var inputValueError=$("#"+inputError+"");
	 //var reg = new RegExp("[`~!！@%#$^&*()=|{}':;',　\\[\\]? \\；：%……+￥（）【】‘”“'，、？\"]");
	 if(inputValue!=null&&inputValue!="null"&&inputValue!=""&&inputValue!="undefined"){
		 input_flag=true;
		 inputValueError.html('<span class="help-inline inline text-success" ><i class="icon-ok bigger-150"></i></span>');
		/* if (!reg.test(inputValue)){   
			 input_flag=true;
			 inputValueError.html('<span class="help-inline inline text-success" ><i class="icon-ok bigger-150"></i></span>');
	     }else {
	    	 input_flag=false;
	    	 inputValueError.html('<span class="help-inline inline text-danger" ><i class="icon-remove bigger-150"></i>含有非法字符，请重新输入。</span>');
	     }*/
   }else{
  	 input_flag=false;
  	 inputValueError.html('<span class="help-inline inline text-danger" ><i class="icon-remove bigger-150"></i>不能为空，请重新输入。</span>');
   }
}


//验证文本框，验证邮箱
var inputEmail_flag=false;
function checkInputEmail(inputEmail,inputEmailError){
	inputEmail_flag=false;
	 var inputEmailValue=$("#"+inputEmail+"").val();
	 var inputEmailValueError=$("#"+inputEmailError+"");
	 var reg = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9_\-])+\.)+([a-zA-Z]{2,5}$)/;
	 if(inputEmailValue!=null&&inputEmailValue!="null"&&inputEmailValue!=""&&inputEmailValue!="undefined"){
		 if (reg.test(inputEmailValue)){
			 inputEmail_flag=true;
			 inputEmailValueError.html('<span class="help-inline inline text-success" ><i class="icon-ok bigger-150"></i></span>');
	     }else {
	    	 inputEmail_flag=false;
	    	 inputEmailValueError.html('<span class="help-inline inline text-danger" ><i class="icon-remove bigger-150"></i>请输入有效的电子邮件地址。</span>');
	     }
   }else{
	   inputEmail_flag=true;
	   inputEmailValueError.html('<span class="help-inline inline text-success" ></span>');
		
   }
}


//验证文本框，验证邮箱
var inputPhone_flag=false;
function checkInputPhone(inputPhone,inputPhoneError){
	inputPhone_flag=false;
	 var inputPhoneValue=$("#"+inputPhone+"").val();
	 var inputPhoneValueError=$("#"+inputPhoneError+"");
	 var reg = /(^((\(\d{2,3}\))|(\d{3}\-))?(\(0\d{2,3}\)|0\d{2,3}-)?[1-9]\d{6,7}(\-\d{1,4})?$)|^(1[0-9]{10}$)|^([4,8]00[0-9]{7}$)/;
	 if(inputPhoneValue!=null&&inputPhoneValue!="null"&&inputPhoneValue!=""&&inputPhoneValue!="undefined"){
		 if (reg.test(inputPhoneValue)){
			 inputPhone_flag=true;
			 inputPhoneValueError.html('<span class="help-inline inline text-success" ><i class="icon-ok bigger-150"></i></span>');
	     }else {
	    	 inputPhone_flag=false;
	    	 inputPhoneValueError.html('<span class="help-inline inline text-danger" ><i class="icon-remove bigger-150"></i>请输入正确的电话号码。</span>');
	     }
   }else{
	   inputPhone_flag=true;
	   inputPhoneValueError.html('<span class="help-inline inline text-success" ></span>');
		
   }
}

//表单验证
//验证文本框，不能为空也不能有特殊字符
var select_flag=false;
function checkSelect(input,inputError){
	 select_flag=false;
	 $("#"+input+"").find('option').prop("selected","selected");
	 var inputValue= $("#"+input+"").find("option:selected").val();
	 var inputValueError=$("#"+inputError+"");
	 if(inputValue!=null&&inputValue!="null"&&inputValue!=""&&inputValue!="undefined"){
		 select_flag=true;
		 inputValueError.html('<span class="help-inline inline text-success" ><i class="icon-ok bigger-150"></i></span>');
	 }else{
		 select_flag=false;
		 inputValueError.html('<span class="help-inline inline text-danger" ><i class="icon-remove bigger-150"></i>请选择左侧信息。</span>');
	 }
}

var selectRight_flag=false;
function checkSelectRight(input,inputError){
	selectRight_flag=false;
	 $("#"+input+"").find('option').prop("selected","selected");
	 var inputValue= $("#"+input+"").find("option:selected").val();
	 var inputValueError=$("#"+inputError+"");
	 if(inputValue!=null&&inputValue!="null"&&inputValue!=""&&inputValue!="undefined"){
		 selectRight_flag=true;
		 inputValueError.html('<span class="help-inline inline text-success" ><i class="icon-ok bigger-150"></i></span>');
	 }else{
		 selectRight_flag=false;
		 inputValueError.html('<span class="help-inline inline text-danger" ><i class="icon-remove bigger-150"></i>请选择左侧信息。</span>');
	 }
}


//验证正准数价格
var inputPrice_flag=false;
function checkPriceInput(element,elementError){
	inputPrice_flag=false;
	 var inputNumValue=$("#"+element+"").val();
 var inputNumValueError=$("#"+inputNumValue+"");
	 var reg = /^[0-9]*[1-9][0-9]*$/;
	 if(inputNumValue!=null&&inputNumValue!="null"&&inputNumValue!=""&&inputNumValue!="undefined")
     {
		 if (reg.test(inputNumValue)){   
			 inputPrice_flag=true;
			 inputNumValueError.html('');
	     }else {     
	    	 inputPrice_flag=false;
	    	 inputNumValueError.html('该输入项只能输入正整数。');
	     }
     }
     else{
    	 inputPrice_flag=false;
    	 inputNumValueError.html('该输入项只能输入正整数。');
     }
}