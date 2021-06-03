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
    <link rel="stylesheet" type="text/css" href="StyleSheet/About.css">
    <link rel="shortcut icon" type="image/x-icon" href="Source/favicon.ico"/>
    <link rel="icon" type="image/x-icon" href="Source/favicon.ico"/>
    <script type="text/javascript" src="JavaScript/ProgressLine.js"></script>
    <script type="text/javascript" src="JavaScript/Mobile.js"></script>
    <script type="text/javascript" src="js/1.9.1/jquery.min.js"></script> 
    <script type="text/javascript" src="jquery.validation/1.14.0/jquery.validate.js"></script> 
    <script type="text/javascript" src="jquery.validation/1.14.0/validate-methods.js"></script> 
    <script type="text/javascript" src="jquery.validation/1.14.0/messages_zh.js"></script>
    <title>学历学位认证系统 - 首页</title>
      
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
                <li class="First"><a href="Index.jsp"><i class="fa fa-home" style="color: orange;"></i><i style="color: orange;">首页</i></a></li>
                <li class="First"><a href="Search.jsp"><i class="fa fa-search"></i><i>证书查询</i></a></li>
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
<div class="About">
    <div class="Content">
        <div class="BlockChain">
            <h2 class="Title">什么是区块链？</h2>
            <div class="Image" id="Index1"></div>
            <b class="ImageTips">图1 区块链概念</b>
            <p class="Introduction">区块链起源于比特币，2008年11月1日，一位自称中本聪(Satoshi Nakamoto)的人发表了《比特币:一种点对点的电子现金系统》一文，阐述了基于P2P网络技术、加密技术、时间戳技术、区块链技术等的电子现金系统的构架理念，这标志着比特币的诞生。两个月后理论步入实践，2009年1月3日第一个序号为0的创世区块诞生。几天后2009年1月9日出现序号为1的区块，并与序号为0的创世区块相连接形成了链，标志着区块链的诞生。
                近年来，世界对比特币的态度起起落落，但作为比特币底层技术之一的区块链技术日益受到重视。在比特币形成过程中，区块是一个一个的存储单元，记录了一定时间内各个区块节点全部的交流信息。各个区块之间通过随机散列(也称哈希算法)实现链接，后一个区块包含前一个区块的哈希值，随着信息交流的扩大，一个区块与一个区块相继接续，形成的结果就叫区块链。
            </p>
            <div class="Image" id="Index2"></div>
            <b class="ImageTips">图2 区块链概念</b>
            <p class="Introduction">什么是区块链？从科技层面来看，区块链涉及数学、密码学、互联网和计算机编程等很多科学技术问题。从应用视角来看，简单来说，区块链是一个分布式的共享账本和数据库，具有去中心化、不可篡改、全程留痕、可以追溯、集体维护、公开透明等特点。这些特点保证了区块链的“诚实”与“透明”，为区块链创造信任奠定基础。而区块链丰富的应用场景，基本上都基于区块链能够解决信息不对称问题，实现多个主体之间的协作信任与一致行动。</p>
        </div>
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