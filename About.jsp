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
    <script type="text/javascript" src="JavaScript/Display.js"></script>
    <script type="text/javascript" src="js/1.9.1/jquery.min.js"></script> 
    <script type="text/javascript" src="jquery.validation/1.14.0/jquery.validate.js"></script> 
    <script type="text/javascript" src="jquery.validation/1.14.0/validate-methods.js"></script> 
    <script type="text/javascript" src="jquery.validation/1.14.0/messages_zh.js"></script>
    <title>学历学位认证系统 - 关于</title>
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
                <li class="First"><a href="Search.jsp"><i class="fa fa-search"></i><i>证书查询</i></a></li>
                <li class="First"><a href="Verification.jsp"><i class="fa fa-chain"></i><i>证书核验</i></a></li>
                <li class="First"><a href="About.jsp"><i class="fa fa-diamond" style="color: orange;"></i><i style="color: orange;">关于</i></a></li>
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
        <h2 class="Title">团队成员<i class="fa fa-unlock" id="TeamLock" onclick="AboutDisplay('Team','TeamLock')"></i></h2>
        <div class="Team" id="Team">
            <div class="HeadImage" id="About3" title="王基书（队长，前端实现）"></div>
            <div class="HeadImage" id="About4" title="汤雅惠（文档及测试）"></div>
            <div class="HeadImage" id="About5" title="李松霖（后端实现"></div>
            <div class="HeadImage" id="About6" title="吕昌龙（文档及测试）"></div>
            <div class="HeadImage" id="About7" title="何亚辉（文档及测试）"></div>
            <div class="HeadImage" id="About8" title="王强（区块链部署）"></div>
        </div>
        <h2 class="Title">项目概览（前端）<i class="fa fa-unlock" id="ProjectLock" onclick="AboutDisplay('Project','ProjectLock')"></i></h2>
        <div class="Project" id="Project">
            <div class="Image" id="About1"></div>
            <b class="ImageTips">图1 项目概览</b>
            <h3><i class="fa fa-code" style="color: orangered;"></i>总代码量：<b>4260行</b></h3>
            <p class="Introduction">JavaScript：959行（6个文件）</p>
            <p class="Introduction2"><b>Display.js</b>，21行，实现显示/隐藏的效果。</p>
            <p class="Introduction2"><b>Form.js</b>，671行，实现各个页面关于form表单的操作，包括填写检查和显示效果控制。</p>
            <p class="Introduction2"><b>Mobile.js</b>，63行，实现移动端浏览的部分特有显示效果。</p>
            <p class="Introduction2"><b>ProgessLine.js</b>，44行，实现页面浏览的百分比进度条显示。</p>
            <p class="Introduction2"><b>Start.js</b>，116行，实现页面浏览的星空连线效果。</p>
            <p class="Introduction2"><b>Verification.js</b>，44行，实现验证码的生成与刷新。</p>
            <p class="Introduction">CSS：2014行（6个文件）</p>
            <p class="Introduction2"><b>About.css</b>，135行，实现Index页面、About页面的特有样式。</p>
            <p class="Introduction2"><b>NonRLF.css</b>，623行，实现Register页面、Login页面、Forget页面、SetPassword页面之外的特有样式。</p>
            <p class="Introduction2"><b>Public.css</b>，223行，实现各个页面的共有样式，包括头部、底部、导航栏。</p>
            <p class="Introduction2"><b>Reset.css</b>，81行，修改部分HTML的默认样式。</p>
            <p class="Introduction2"><b>RLF.CSS</b>，509行，实现Register页面、Login页面、Forget页面、SetPassword页面的特有样式。</p>
            <p class="Introduction2"><b>Search.CSS</b>，443行，实现Search页面、SearchResult页面、Verification页面、VerificationResult页面的特有样式。</p>
            <p class="Introduction">HTML：1271行（14个文件）</p>
            <p class="Introduction2"><b>About.html</b>，93行，显示项目概览及团队介绍。</p>
            <p class="Introduction2"><b>Certificate.html</b>，108行，实现个人认证功能。</p>
            <p class="Introduction2"><b>Degree.html</b>，96行，实现学位证书生成功能。</p>
            <p class="Introduction2"><b>Education.html</b>，96行，实现学历证书生成功能。</p>
            <p class="Introduction2"><b>Forget.html</b>，89行，实现找回密码的身份核对功能。</p>
            <p class="Introduction2"><b>Index.html</b>，?行，显示区块链相关的介绍。</p>
            <p class="Introduction2"><b>Login.html</b>，74行，实现用户登录功能。</p>
            <p class="Introduction2"><b>Register.html</b>，109行，实现用户注册功能。</p>
            <p class="Introduction2"><b>Search.html</b>，85行，实现证书查询功能。</p>
            <p class="Introduction2"><b>SearchResult.html</b>，105行，显示证书查询结果。</p>
            <p class="Introduction2"><b>SetPassword.html</b>，79行，实现修改密码功能。</p>
            <p class="Introduction2"><b>User.html</b>，98行，显示用户个人信息。</p>
            <p class="Introduction2"><b>Verification.html</b>，85行，实现证书核验功能。</p>
            <p class="Introduction2"><b>VerificationResult.html</b>，73行，显示证书核验结果。</p>
            <div class="Image" id="About2"></div>
            <b class="ImageTips">图2 注册页面展示</b>
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