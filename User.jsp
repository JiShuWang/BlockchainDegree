<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="factory.userMessage"%>
<%

userMessage userMessages=(userMessage)session.getAttribute("message");
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
    <link rel="stylesheet" type="text/css" href="StyleSheet/NonRLF.css">
    <link rel="shortcut icon" type="image/x-icon" href="Source/favicon.ico"/>
    <link rel="icon" type="image/x-icon" href="Source/favicon.ico"/>
    <script type="text/javascript" src="JavaScript/ProgressLine.js"></script>
    <script type="text/javascript" src="JavaScript/Mobile.js"></script>
    <script type="text/javascript" src="JavaScript/Form.js"></script>
    <script type="text/javascript" src="js/1.9.1/jquery.min.js"></script> 
    <script type="text/javascript" src="jquery.validation/1.14.0/jquery.validate.js"></script> 
    <script type="text/javascript" src="jquery.validation/1.14.0/validate-methods.js"></script> 
    <script type="text/javascript" src="jquery.validation/1.14.0/messages_zh.js"></script>
    <title>学历学位认证系统 - 个人信息</title>
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
</head>
<body>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
 <%if (session.getAttribute("userName")==null){%>
     <script language="javascript">
      alert("请重新登录");     
  
    document.location.href='Login.html';
     </script>  
    <%}else {%>
    
    <%}%>
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
                <li class="First-UserManage" onclick="UserNavigator()">
                    <a><i class="fa fa-user-circle" style="color: orange;"></i><i style="color: orange;"><%= session.getAttribute("userName")%></i></a>
                    <div class="SecondNavigator" id="UserManage">
                        <ul>
                            <li class="Second"><a href="Certificate.jsp"><i class="fa fa-certificate"></i><i>实名认证</i></a></li>
                            <li class="Second"><a href="userMessagection!findAll?userName=<%= session.getAttribute("userName")%>"><i class="fa fa-info-circle" style="color:deepskyblue;"></i><i style="color:deepskyblue;">个人信息</i></a></li>
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
<div class="User">
    <div class="Content">
        <div class="Navigator">
            <ul>
                <li><a href="Certificate.jsp"><i class="fa fa-certificate"></i><i>实名认证</i></a></li>
                <li><a href="userMessagection!findAll?userName=<%= session.getAttribute("userName")%>"><i class="fa fa-info-circle" style="color:black;"></i><i style="color:black;">个人信息</i></a></li>
                <li><a href="educationaction!findByUn?userName=<%= session.getAttribute("userName")%>"><i class="fa fa-map"></i><i>学历证书</i></a></li>
                <li><a href="degreeaction!findByUn?userName=<%= session.getAttribute("userName")%>"><i class="fa fa-mortar-board"></i><i>学位证书</i></a></li>
                <li><a href="logout.jsp"><i class="fa fa-window-close"></i><i>注销</i></a></li>
            </ul>
        </div>
        <form class="UserForm">
        <%if (userMessages==null){%>
           <script language="javascript">     
  			   
    				alert("未实名认证，请先认证!");     
  
    				document.location.href='Certificate.jsp';     
  
				</script>
         <%}else {%>
            <h2 class="Title">个人信息</h2>
            <span><i class="fa fa-home"></i><i>账号</i><input type="text" readonly value=<%=userMessages.getUserName() %>><div class="Tips"><i class="fa fa-exclamation-circle"></i>不可修改</div></span>
            <span><i class="fa fa-phone"></i><i>手机号</i><input type="text" id="PhoneNumber" name="PhoneNumber" readonly value=<%=userMessages.getTel() %>><div class="Tips"><i class="fa fa-exclamation-circle"></i>不可修改</div></span>
            <span><i class="fa fa-id-card"></i><i>证件类型</i><input type="text" readonly value=<%=userMessages.getIdType() %>><div class="Tips"><i class="fa fa-exclamation-circle"></i>不可修改</div></span>
            <span><i class="fa fa-edit"></i><i>证件号码</i><input type="text" id="ID" readonly value=<%=userMessages.getIdNum() %>><div class="Tips"><i class="fa fa-exclamation-circle"></i>不可修改</div></span>
            <span><i class="fa fa-font"></i><i>姓名</i><input type="text" id="Name" readonly value=<%=userMessages.getName() %>><div class="Tips"><i class="fa fa-exclamation-circle"></i>不可修改</div></span>
            <span><i class="fa fa-envelope"></i><i>邮箱</i><input type="text" id="Email" name="Email" readonly value=<%=userMessages.getMailbox() %>><div class="Tips"><i class="fa fa-exclamation-circle"></i>不可修改</div></span>
            <span><i class="fa fa-university"></i><i>高校名称</i><input type="text" id="University" readonly value=<%=userMessages.getUniversity() %>><div class="Tips"><i class="fa fa-exclamation-circle"></i>不可修改</div></span>
            <span><i class="fa fa-industry"></i><i title="（系/研究所）">学院名称</i><input type="text" id="College" readonly value=<%=userMessages.getCollege() %>><div class="Tips"><i class="fa fa-exclamation-circle"></i>不可修改</div></span>
            <span><i class="fa fa-map"></i><i>学历</i><input type="text" id="Education" readonly value=<%=userMessages.getEducation() %>><div class="Tips"><i class="fa fa-exclamation-circle"></i>不可修改</div></span>
            <span><i class="fa fa-graduation-cap"></i><i>学位</i><input type="text" id="Degree" readonly value=<%=userMessages.getDegree() %>><div class="Tips"><i class="fa fa-exclamation-circle"></i>不可修改</div></span>
            <span><i class="fa fa-wrench"></i><i>专业名称</i><input type="text" id="Major" readonly value=<%=userMessages.getMajor() %>><div class="Tips"><i class="fa fa-exclamation-circle"></i>不可修改</div></span>
            <span><i class="fa fa-sitemap"></i><i>年级</i><input type="text" id="Grade" readonly value=<%=userMessages.getGrade() %>><div class="Tips"><i class="fa fa-exclamation-circle"></i>不可修改</div></span>
            <span><i class="fa fa-group"></i><i>班级</i><input type="text" id="Class" readonly value=<%=userMessages.getClass_() %>><div class="Tips"><i class="fa fa-exclamation-circle"></i>不可修改</div></span>
            <span><i class="fa fa-sort-numeric-desc"></i><i>学号</i><input type="text" id="StudentID" readonly value=<%=userMessages.getStudentId() %>><div class="Tips"><i class="fa fa-exclamation-circle"></i>不可修改</div></span>
            <span><i class="fa fa-intersex"></i><i>性别</i><input type="text" id="Sex" readonly value=<%=userMessages.getSex() %>><div class="Tips"><i class="fa fa-exclamation-circle"></i>不可修改</div></span>
        <%}%>
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