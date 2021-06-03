<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
<head>
    <meta name="renderer" content="webkit"/>
    <meta http-equiv="X-UA-COMPATIBLE" content="IE=edge,chrome=1"/>
    <meta content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=0" name="viewport"/>
    <meta http-equiv="Content-Type" content="text/html;" charset="utf-8"/>
    <link rel="stylesheet" type="text/css" href="//netdna.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"><!--引入font-awesome图标样式-->
    <link rel="stylesheet" type="text/css" href="StyleSheet/Reset.css">
    <link rel="stylesheet" type="text/css" href="StyleSheet/Public.css">
    <link rel="stylesheet" type="text/css" href="StyleSheet/RLF.css">
    <link rel="shortcut icon" type="image/x-icon" href="Source/favicon.ico"/>
    <link rel="icon" type="image/x-icon" href="Source/favicon.ico"/>
    <script type="text/javascript" src="JavaScript/ProgressLine.js"></script>
    <script type="text/javascript" src="JavaScript/Mobile.js"></script>
    <script type="text/javascript" src="JavaScript/Form.js"></script>
    <script type="text/javascript" src="JavaScript/Verification.js"></script>
    <script type="text/javascript" src="js/1.9.1/jquery.min.js"></script> 
    <script type="text/javascript" src="jquery.validation/1.14.0/jquery.validate.js"></script> 
    <script type="text/javascript" src="jquery.validation/1.14.0/validate-methods.js"></script> 
    <script type="text/javascript" src="jquery.validation/1.14.0/messages_zh.js"></script>
    <title>学历学位认证系统 - 重置密码</title>
    <script type="text/javascript">
		 $().ready(function() {
			  $("#registerForm").validate();
			 });
		 function forgets() {
		        if(!ForgetFormCheck())
		        {
		        return false;
		        }
			    var userName = $('#Username').val();
			    var tel = $('#PhoneNumber').val();
			    var suffix = $('#Suffix').val();
			    var mailbox = $('#EmailText').val()+suffix;
			    if (! $("#registerForm").valid()) {
			        return;
			     }
			    $.ajax({ 
			    type : "post",
			    url : "${pageContext.request.contextPath}/forgetaction",
			    data : {
			    	userName : userName,
			    	tel : tel,
			    	mailbox : mailbox,
			    	
			    },
			    dataType:"json",

			    success : function(data) {
			         if(data=="用户名不存在，请重新输入"||data=="手机号不存在，请重新输入"||data=="邮箱不存在，请重新输入"||data=="账号、手机号或邮箱有误，请核对后重新输入")
			    		{
			       		alert(data);
			    		document.getElementById('Username').value=userName;
				    	document.getElementById('PhoneNumber').value=tel;
				    	document.getElementById('EmailText').value=$('#EmailText').val();
			    		}
			    	else
			    		{
			    		window.location.href ="/System/SetPassword.jsp?ids="+  encodeURI(encodeURI(data))+""; 
                        Dialog.closeSelf();
			    		}
			    	
			    },
			    error:function(){
			            document.getElementById('Username').value=userName;
				    	document.getElementById('PhoneNumber').value=tel;
				    	document.getElementById('EmailText').value=$('#EmailText').val();   
			    alert('出错了');},
			});
			}
</script>
</head>
<body onload="Refresh()">
<div class="Public-Line" id="Line">
</div>
<div class="Menu-Mobile" id="Menu-Mobile" onclick="MobileNavigator()">≡</div>
<div class="Public-Header" id="Public-Header">
    <div class="Menu">
        <div class="Logo"></div>
        <div class="FirstNavigator">
            <ul>
                <li class="First"><a href="Index.jsp"><i class="fa fa-home"></i><i>首页</i></a></li>
                <li class="First"><a href="Search.jsp"><i class="fa fa-search"></i><i>证书查询</i></a></li>
                <li class="First"><a href="Verification.jsp"><i class="fa fa-chain"></i><i>证书核验</i></a></li>
                <li class="First"><a href="About.jsp"><i class="fa fa-diamond"></i><i>关于</i></a></li>
                <li class="First"><a href="Login.html"><i class="fa fa-user-circle"></i><i>登录</i></a></li>
                <li class="First"><a href="Register.html"><i class="fa fa-registered"></i><i>注册</i></a></li>
            </ul>
        </div>
    </div>
</div>
<div class="Forget">
    <div class="Forget-Form">
        <div class="LeftLine"></div>
        <div class="Title">
            <h2>重置密码</h2>
        </div>
        <div class="RightLine"></div>
        <form class="ForgetForm" action="" method="post"  id="registerForm">
            <span><i><b class="Necessary">*</b>账号<b class="fa fa-user"></b></i><input type="text" class="Username" name="Username" id="Username" placeholder="长度:8-10位" onkeyup="UsernameCheck('Forget')"><i class="Tips" id="UsernameTips">请输入注册时的账号。</i></span>
            <span><i><b class="Necessary">*</b>手机号<b class="fa fa-phone"></b></i><input type="text" class="PhoneNumber" name="PhoneNumber" id="PhoneNumber" placeholder="长度:11位" onkeyup="PhoneNumberCheck()"><i class="Tips" id="PhoneNumberTips">请输入注册时的手机号码。</i></span>
            <span><i><b class="Necessary">*</b>邮箱<b class="fa fa-envelope"></b></i><input type="text" class="EmailText" name="EmailText" id="EmailText" placeholder="长度:5-20位" onkeyup="EmailCheck()">
                <select class="Suffix" id="Suffix">
                    <option value="@qq.com">@qq.com</option>
                    <option value="@126.com">@126.com</option>
                    <option value="@139.com">@139.com</option>
                    <option value="@163.com">@163.com</option>
                    <option value="@189.com">@189.com</option>
                    <option value="@sina.com">@sina.com</option>
                    <option value="@gmail.com">@gmail.com</option>
                    <option value="@hotmail.com">@hotmail.com</option>
                    <option value="@foxmail.com">@foxmail.com</option>
                    <option value="@yahoo.com">@yahoo.com</option>
                </select>
                <i class="Tips" id="EmailTips">请输入注册时的邮箱。</i>
                <input type="hidden" name="Email" id="Email">
            </span>
            <span><i><b class="Necessary">*</b>验证码<b class="fa fa-barcode"></b></i><input type="text" id="Verification" placeholder="请输入验证码中的数字" onkeyup="VeriCheck()"><i class="Tips" id="VerificationTips">请认真查看验证码，输入其中的数字。</i></span>
            <span><div class="FullBlock"></div><input type="text" class="VerificationCode" readonly="readonly" id="VerificationCode" title="点击更换验证码" onclick="Refresh()" style="height: 40px;background-color: #8DEEEE;color: black;text-indent: 0em;"><i class="Tips" id="VerificationCodeTips" onclick="Refresh()">点击更换验证码</i></span>
            <input type="button" id="Submit" class="Submit" name="Submit" value="重置密码" style="margin: 20px auto;width:300px;height: 70px;background-color:#0096E6;text-indent: 0em;" onclick="forgets()">
        </form>
    </div>
</div>
<div class="Public-Footer">
    <div class="Content">
        <p>友情链接 -----
            <select class="Link" onchange="window.open(this.value);">
                <option value="http://www.fwwb.org.cn/index.html">中国大学服务外包创新创业大赛官网</option>
                <option value="http://www.moe.gov.cn/">教育部</option>
                <option value="https://www.chsi.com.cn/">学信网</option>   
            </select>
        </p>
        <p>第十二届中国大学生服务外包创新创业大赛</p>
        <p><b>【A23】基于区块链的学位学历认证管理系统【云象网络】</b></p>
        <p>Copyright © 2021 <b>Apple idea</b></p>
    </div>
</div>
</body>
<script type="text/javascript" src="JavaScript/Star.js" color="255,255,255" count="100"></script>
</html>