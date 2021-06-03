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
    <title>学历学位认证系统 - 实名认证</title>
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
<script type="text/javascript">
		 $().ready(function() {
			  $("#registerForm").validate();
			 });
		 function cc() {
		        if(!CertificateFormCheck())
		        {
		        return false;
		        }
			    var userName = "<%=session.getAttribute("userName")%>"; 
			    var university = $('#University').val();
			    var college = $('#College').val();
			    var major = $('#Major').val();
			    var degree = $('#Degree').val();
			    var education = $('#Education').val();
			    var grade = $('#Grade').val();
			    var class_ = $('#Class').val();
			    var studentId = $('#StudentID').val();
			    var sex = $('input:radio[name="Sex"]:checked').val()
			    if (! $("#registerForm").valid()) {
			        return;
			     }     	                  
			    $.ajax({ 
			    type : "post",
			    url : "${pageContext.request.contextPath}/rzaction",
			    data : {
			    	userName : userName,
			    	university : university,
			    	college : college,
			    	major : major,
			    	degree : degree,
			    	education : education,
			    	grade : grade,
			    	class_ : class_,
			    	studentId : studentId,
			    	sex : sex,
			    	
			    },
			    dataType:"json",

			    success : function(data) {
			        if(data=="该学号已存在，请核验")
			    		{
			       		alert(data);
			    		document.getElementById('University').value=university;
				    	document.getElementById('College').value=college;
				    	document.getElementById('Major').value=major;
				    	document.getElementById('Degree').value=degree;
				    	document.getElementById('Education').value=education;
				    	document.getElementById('Grade').value=grade;
				    	document.getElementById('Class').value=class_;
				    	document.getElementById('StudentID').value=password;
				    	document.getElementById('Sex').value=sex;
			       		}
			    	else
			    		{
						   alert(data);
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
                    <a><i class="fa fa-user-circle" style="color: orange;"></i><i style="color: orange;"><%=session.getAttribute("userName")%></i></a>
                    <div class="SecondNavigator" id="UserManage">
                        <ul>
                            <li class="Second"><a href="Certificate.jsp"><i class="fa fa-certificate" style="color:deepskyblue;"></i><i style="color:deepskyblue;">实名认证</i></a></li>
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
<div class="Certificate">
    <div class="Content">
        <div class="Navigator">
            <ul>
                <li><a href="Certificate.jsp"><i class="fa fa-certificate" style="color:black;"></i><i style="color:black;">实名认证</i></a></li>
                <li><a href="userMessagection!findAll?userName=<%= session.getAttribute("userName")%>"><i class="fa fa-info-circle"></i><i>个人信息</i></a></li>
                <li><a href="educationaction!findByUn?userName=<%= session.getAttribute("userName")%>"><i class="fa fa-map"></i><i>学历证书</i></a></li>
                <li><a href="degreeaction!findByUn?userName=<%= session.getAttribute("userName")%>"><i class="fa fa-mortar-board"></i><i>学位证书</i></a></li>
                <li><a href="logout.jsp"><i class="fa fa-window-close"></i><i>注销</i></a></li>
            </ul>
        </div>
        <form class="CertificateForm" action="" method="post"  id="registerForm">
            <h2 class="Title">实名认证</h2>
            <sub style="display:block;text-align:center;font-size: 1em;color: black;font-weight: bolder;">（请认真填写，认证后无法自行更改）</sub>
            <span><i class="fa fa-university"></i><i>高校名称</i><input type="text" id="University" name="University" value="" placeholder="请输入就读高校的全名" onkeyup="UniversityCheck()"><div class="Tips"><i class="fa fa-edit"></i>请输入就读高校的名称，例如西南大学。</div></span>
            <span><i class="fa fa-industry"></i><i>学院名称</i><input type="text" id="College" value="" name="College" placeholder="请输入所在学院（系/研究所）的全名" onkeyup="CollegeCheck()"><div class="Tips"><i class="fa fa-edit"></i>请输入所在学院的名称，例如软件学院。</div></span>
            <span><i class="fa fa-wrench"></i><i>专业名称</i><input type="text" id="Major" value="" name="Major" placeholder="请输入所就读的专业全名" onkeyup="MajorCheck()"><div class="Tips"><i class="fa fa-edit"></i>请输入所就读的专业名称，例如软件工程。</div></span>
            <span><i class="fa fa-graduation-cap"></i><i>学位名称</i><input type="text" id="Degree" value="" name="Degree" placeholder="请输入所要申请的学位全名" onkeyup="DrgreeCheck()"><div class="Tips"><i class="fa fa-edit"></i>请输入所要申请的学位全名，例如工学学位。</div></span>
            <span><i class="fa fa-map"></i><i>学历层次</i>
                <select id="Education" name="Education">
                    <option value="本科">本科</option>
                    <option value="硕士研究生">硕士研究生</option>
                    <option value="博士研究生">博士研究生</option>
                </select>
                <div class="Tips"><i class="fa fa-edit"></i>请选择所要申请的学历。</div>
            </span>
            <span><i class="fa fa-sitemap"></i><i>年级</i><input type="text" id="Grade" name="Grade" value="" placeholder="请输入目前所在的年级" onkeyup="GradeCheck()"><div class="Tips"><i class="fa fa-edit"></i>请输入当前所在的年级，例如2019级。</div></span>
            <span><i class="fa fa-group"></i><i>班级</i><input type="text" id="Class" name="Class" value="" placeholder="请输入目前所在的班级的全称" onkeyup="ClassCheck()"><div class="Tips"><i class="fa fa-edit"></i>请输入当前所在的班级，例如软件工程1班。</div></span>
            <span><i class="fa fa-sort-numeric-desc"></i><i>学号</i><input type="text" id="StudentID" name="StudentID" value="" placeholder="请输入自己的学号" onkeyup="StudentIDCheck()"><div class="Tips"><i class="fa fa-edit"></i>请输入自己的学号，例如151101410085。</div></span>
            <span><i class="fa fa-intersex"></i><i>性别</i>
                <input type="radio" id="Male" name="Sex" value="男" checked><label for="Male">男</label>
                <input type="radio" id="Female" name="Sex" value="女" ><label for="Female">女</label>
                <div class="Tips"><i class="fa fa-edit"></i>请选择性别。</div>
            </span>
            <span style="display:block;width: 90%;"><i class="fa fa-exclamation-circle" style="color:red;width:20px;"></i><b class="Notice">请认真检查自己的学位学历认证信息，一经提交，相关学位学历数据将上传至区块链中保存，同时可以查看自己的电子学历证书、学位证书。</b>
</span>
            <span><input type="button" id="Submit" class="Submit" value="提交" onclick="cc()"></span>
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