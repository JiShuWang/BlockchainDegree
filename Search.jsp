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
    <link rel="stylesheet" type="text/css" href="StyleSheet/Search.css">
    <link rel="shortcut icon" type="image/x-icon" href="Source/favicon.ico"/>
    <link rel="icon" type="image/x-icon" href="Source/favicon.ico"/>
    <script type="text/javascript" src="JavaScript/Form.js"></script>
    <script type="text/javascript" src="JavaScript/ProgressLine.js"></script>
    <script type="text/javascript" src="JavaScript/Mobile.js"></script>
    <script type="text/javascript" src="js/1.9.1/jquery.min.js"></script> 
    <script type="text/javascript" src="jquery.validation/1.14.0/jquery.validate.js"></script> 
    <script type="text/javascript" src="jquery.validation/1.14.0/validate-methods.js"></script> 
    <script type="text/javascript" src="jquery.validation/1.14.0/messages_zh.js"></script>
    <title>学历学位认证系统 - 证书查询</title>
    <script type="text/javascript">
		 $().ready(function() {
			  $("#registerForm").validate();
			 });
		 function xlcx() {
		        if(!SearchCheck('Education'))
		        {
		        return false;
		        }
			    var educationId = $('#EducationID').val();
			    var name = $('#EducationName').val();
			    if (! $("#registerForm").valid()) {
			        return;
			     }
			    $.ajax({ 
			    type : "post",
			    url : "${pageContext.request.contextPath}/seducationaction",
			    data : {
			    	educationId : educationId,
			    	name : name,
			    	
			    },
			    dataType:"json",

			    success : function(data) {
			        if(data=="学历证书编号不存在"||data=="学历证书所属姓名有误")
			    		{
			       		alert(data);
			    		document.getElementById('EducationID').value=educationId;
				    	document.getElementById('EducationName').value=name;
			       		}
			       		else{
			       		    window.location.href ="/System/SearchResult.jsp";
			       		}
			    	
			    },
			    error:function(){
			            document.getElementById('Username').value=userName;
				    	document.getElementById('Password').value=password;	    
			    alert('出错了');},
			});
			}
</script>
<script type="text/javascript">
		 $().ready(function() {
			  $("#registerForms").validate();
			 });
		 function xwcx() {
		        if(!SearchCheck('Degree'))
		        {
		        return false;
		        }
			    var degreeId = $('#DegreeID').val();
			    var name = $('#DegreeName').val();
			    if (! $("#registerForm").valid()) {
			        return;
			     }
			    $.ajax({ 
			    type : "post",
			    url : "${pageContext.request.contextPath}/sdegreeaction",
			    data : {
			    	degreeId : degreeId,
			    	name : name,
			    	
			    },
			    dataType:"json",

			    success : function(data) {
			        if(data=="学位证书编号不存在"||data=="学位证书所属姓名有误")
			    		{
			       		alert(data);
			    		document.getElementById('DegreeID').value=degreeId;
				    	document.getElementById('DegreeName').value=name;
			       		}
			       		else{
			       		    window.location.href ="/System/SearchResult1.jsp";
			       		}
			    	
			    },
			    error:function(){
			            document.getElementById('Username').value=userName;
				    	document.getElementById('Password').value=password;	    
			    alert('出错了');},
			});
			}
</script>
</head>
<body>
<div class="Public-Line" id="Line">
</div>
<div class="Menu-Mobile" id="Menu-Mobile" onclick="MobileNavigator()">≡</div>
<div class="Public-Header" id="Public-Header">
    <div class="Menu">
        <div class="Logo"></div>
        <div class="FirstNavigator">
            <ul>
                <li class="First"><a href="Index.jsp"><i class="fa fa-home"></i><i>首页</i></a></li>
                <li class="First"><a href="Search.jsp"><i class="fa fa-search" style="color: orange;"></i><i style="color: orange;">证书查询</i></a></li>
                <li class="First"><a href="Verification.jsp"><i class="fa fa-chain"></i><i>证书核验</i></a></li>
                <li class="First"><a href="About.jsp"><i class="fa fa-diamond"></i><i>关于</i></a></li>
                <li class="First-UserManage" onclick="UserNavigator()">
                    <%if (session.getAttribute("userName")==null){%>
                <li class="First"><a href="Login.html"><i class="fa fa-user-circle"></i><i>登录</i></a></li>
                <li class="First"><a href="Register.html"><i class="fa fa-registered"></i><i>注册</i></a></li>
                <%}else {%>
                  <a><i class="fa fa-user-circle"></i><i><%= session.getAttribute("userName")%></i></a>
                  <script language="javascript">     
  
					var myTime = setTimeout("Timeout()", 600000);     
  
					function resetTime() {     
  
    				clearTimeout(myTime);     
  
    				myTime = setTimeout('Timeout()', 600000);     
  
					}    
  
					function Timeout() {     
  
    				alert("您的登录已超时, 请点确定后重新登录!");     
  
    				document.location.href='logout.jsp';     
  
					}     
				</script>
                <%}%>
                    <div class="SecondNavigator" id="UserManage">
                        <ul>
                            <li class="Second"><a href="Certificate.jsp"><i class="fa fa-certificate"></i><i>实名认证</i></a></li>
                            <li class="Second"><a href="userMessagection!findAll?userName=<%= session.getAttribute("userName")%>"><i class="fa fa-info-circle"></i><i>个人信息</i></a></li>
                            <li class="Second"><a href="educationaction!findByUn?userName=<%= session.getAttribute("userName")%>"><i class="fa fa-map"></i><i>学历证书</i></a></li>
                            <li class="Second"><a href="degreeaction!findByUn?userName=<%= session.getAttribute("userName")%>"><i class="fa fa-mortar-board"></i><i>学位证书</i></a></li>
                            <li class="Second"><a href="logout.jsp"><i class="fa fa-window-close"></i><i>注销</i></a></li>
                        </ul>
                    </div>
                </li>
            </ul>
        </div>
    </div>
</div>
<div class="Search">
    <div class="Content" id="Education">
        <h1 class="Title">学历证书查询<i class="fa fa-toggle-off" title="点击切换为学位证书查询" onclick="CertificateSwap('Degree')"></i></h1>
        <form action="" method="post"  id="registerForm">
            <input id="EducationID" name="EducationID" value="" placeholder="请输入你需要查询的学历证书编号...">
            <input id="EducationName" name="EducationName" value="" placeholder="请输入该学历证书所属人的姓名...">
            <button type="button" id="EducationSearch" title="查询" onclick="xlcx()">查询</button>
        </form>
    </div>
    <div class="Content" id="Degree">
        <h1 class="Title">学位证书查询<i class="fa fa-toggle-on" title="点击切换为学历证书查询" onclick="CertificateSwap('Education')"></i></h1>
        <form action="" method="post"  id="registerForms">
            <input id="DegreeID" name="DegreeID" value="" placeholder="请输入你需要查询的学位证书编号...">
            <input id="DegreeName" name="DegreeName" value="" placeholder="请输入该学位证书所属人的姓名...">
            <button type="button" id="DegreeSearch" title="查询" onclick="xwcx()">查询</button>
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
<script type="text/javascript" src="JavaScript/Star.js" color="255,255,255" count="150"></script>
</html>