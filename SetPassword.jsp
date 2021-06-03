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
		 function sp() {
		  		if(!SetPasswordFormCheck())
		        {
		        return false;
		        }
		        var url=window.location.href;//获取本页面的链接地址
		        var argsIndex = url .split("?ids=");//进行参数拆分
			    var arg = argsIndex[1];//获取到第一个参数
                var ids = decodeURI(arg, "utf-8");//将转码的参数转码
			    var passWord = $('#Password').val();
			    if (! $("#registerForm").valid()) {
			        return;
			     }
			    $.ajax({ 
			    type : "post",
			    url : "${pageContext.request.contextPath}/modifyPasswordaction",
			    data : {
			    	ids : ids,
			    	passWord : passWord,
			    	
			    },
			    dataType:"json",

			    success : function(data) {
			    	if(data=="密码重置成功")
			    		{
			        parent.location.href = '/System/Login.html';
                    Dialog.closeSelf();
			    		}
			    	else
			    		{
			    		alert(data);
				    	document.getElementById('Password').value=password;
                        document.getElementById('RePassword').value=$('#RePassword').val();
			    		}
			    },
			    error:function(){
			            document.getElementById('Password').value=password;
                        document.getElementById('RePassword').value=$('#RePassword').val();	    
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
        <form class="ForgetForm" action="" method="post" id="registerForm" >
            <span><i><b class="Necessary">*</b>新密码<b class="fa fa-lock"></b></i><input type="password" class="Password" name="Password" id="Password" placeholder="长度:8-20位" onkeyup="PasswordCheck('Forget')"><b class="fa fa-eye-slash" id="Eye-SP" onmousedown="LookPassword('Password','Eye-SP')" onmouseup="CoverPassword('Password','Eye-SP')" onclick="MobilePassword('Password','Eye-SP')"></b><i class="Tips" id="PasswordTips">请设置新密码并妥善保管。</i></span>
            <span><i><b class="Necessary">*</b>密码确认<b class="fa fa-lock"></b></i><input type="password" class="RePassword" name="RePassword" id="RePassword" placeholder="长度:11位" onkeyup="PasswordSame()"><b class="fa fa-eye-slash" id="SecondEye-SP" onmousedown="LookPassword('RePassword','SecondEye-SP')" onmouseup="CoverPassword('RePassword','SecondEye-SP')" onclick="MobilePassword('RePassword','SecondEye-SP')"></b><i class="Tips" id="RePasswordTips">请再次核对新密码，确保密码设置正确。</i></span>
            <span class="SafeLevel"><i>安全系数<b class="fa fa-shield"></b></i>
                <div class="Low"></div>
                <div class="Middle"></div>
                <div class="High"></div>
                <b id="SafeLevel">无</b>
            </span>
            <span><i><b class="Necessary">*</b>验证码<b class="fa fa-barcode"></b></i><input type="text" id="Verification" placeholder="请输入验证码中的数字" onkeyup="VeriCheck()"><i class="Tips" id="VerificationTips">请认真查看验证码，输入其中的数字。</i></span>
            <span><div style="width: 110px;height:40px;float: left;"></div><input type="text" class="VerificationCode" readonly="readonly" id="VerificationCode" title="点击更换验证码" onclick="Refresh()" style="height: 40px;background-color: #8DEEEE;color: black;text-indent: 0em;"><i class="Tips" id="VerificationCodeTips" onclick="Refresh()">点击更换验证码</i></span>
            <input type="button" id="Submit" class="Submit" name="Submit" value="重置密码" style="margin: 20px auto;width:300px;height: 70px;background-color:#0096E6;text-indent: 0em;" onclick="sp()" >
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