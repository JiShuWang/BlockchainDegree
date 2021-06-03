<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="factory.Education"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
Education educations=(Education)session.getAttribute("education");
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
    <title>学历学位认证系统 - 学历证书</title>
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
                            <li class="Second"><a href="userMessagection!findAll?userName=<%= session.getAttribute("userName")%>"><i class="fa fa-info-circle"></i><i>个人信息</i></a></li>
                            <li class="Second"><a href="educationaction!findByUn?userName=<%= session.getAttribute("userName")%>"><i class="fa fa-map" style="color:deepskyblue;"></i><i style="color:deepskyblue;">学历证书</i></a></li>
                            <li class="Second"><a href="degreeaction!findByUn?userName=<%= session.getAttribute("userName")%>"><i class="fa fa-mortar-board"></i><i>学位证书</i></a></li>
                            <li class="Second"><a href="logout.jsp"><i class="fa fa-window-close"></i><i>注销</i></a></li>
                        </ul>
                    </div>
                </li>
            </ul>
        </div>
    </div>
</div>
<div class="Education">
    <div class="Content">
        <div class="Navigator">
            <ul>
                <li><a href="Certificate.jsp"><i class="fa fa-certificate"></i><i>实名认证</i></a></li>
                <li><a href="userMessagection!findAll?userName=<%= session.getAttribute("userName")%>"><i class="fa fa-info-circle"></i><i>个人信息</i></a></li>
                <li><a href="educationaction!findByUn?userName=<%= session.getAttribute("userName")%>"><i class="fa fa-map" style="color:black;"></i><i style="color:black;">学历证书</i></a></li>
                <li><a href="degreeaction!findByUn?userName=<%= session.getAttribute("userName")%>"><i class="fa fa-mortar-board"></i><i>学位证书</i></a></li>
                <li><a href="logout.jsp"><i class="fa fa-window-close"></i><i>注销</i></a></li>
            </ul>
        </div>
        <%if (educations==null){%>
           <script language="javascript">     
  			   
    				alert("未实名认证，请先认证!");     
  
    				document.location.href='Certificate.jsp';     
  
				</script>
         <%}else {%>
        <h2 class="Title">学历证书</h2>
        <div class="File">
            <div class="Data" style="background-image: url('Source/EducationBackground.jpg');">
                <div class="Symbol2"></div>
                <p class="EducationTitle">毕业证书</p>
                <pre class="Information"><b class="Name"><%=educations.getName() %></b>，<b class="Sex"><%=educations.getSex() %></b>，<b class="Year"><%=educations.getYear() %></b>年<b class="Month"><%=educations.getMonth() %></b>月<b class="Day"><%=educations.getDay() %></b>日生。于<b class="StartYear">2019</b>年<b class="StartMonth">8</b>月至<b class="EndYear">2022</b>年<b class="EndMonth">7月</b>在本校<b class="Major"><%=educations.getMajor() %></b>专业<b class="Time">4年制<%=educations.getEducation() %></b>学习，修完教学计划规定的全部课程，成绩合格，准予毕业。</pre>
                <div class="HeadImage" style="background-image: url('Source/HeadImage.jpg')"></div>
                <b class="UniversitySign">云南大学</b>
                <b class="Headmaster">校长<br>学位评定委员会主席</b>
                <b class="HeadmasterName">方精云</b>
                <b class="EducationID">证书编号：<%=educations.getEducationId() %></b>
                <b class="PublishDate"><i class="Year">二0二二</i>年<i class="Month">六</i>月<i class="Day">二十四</i>日</b>
                <b class="Notice">（普通高等教育本科毕业生）</b>
            </div>
            <p class="BlockChainData"><b class="BlockID">所属区块号：<%=educations.getId() %><i class="fa fa-info-circle" id="BlockID" title="该学位证书所存储的位置。" onclick="BlockData('BlockID')"></i></b><b class="HashValue">Hash：<%=educations.getHashvalue() %><i class="fa fa-info-circle" id="HashValue" title="该学位证书所对应的哈希值，该值是唯一的，因此可用于核验证书真伪。" onclick="BlockData('HashValue')"></i></b></p>
        </div>
         <%}%>
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