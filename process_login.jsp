<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String userName=request.getParameter("userName");
   
        session.setAttribute("userName",userName);
  
    /* response.sendRedirect("User.jsp"); */
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    
    <title>My JSP 'process_login.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript" src="js/1.9.1/jquery.min.js"></script> 
    <script type="text/javascript" src="jquery.validation/1.14.0/jquery.validate.js"></script> 
    <script type="text/javascript" src="jquery.validation/1.14.0/validate-methods.js"></script> 
    <script type="text/javascript" src="jquery.validation/1.14.0/messages_zh.js"></script>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
   <script language="javascript">
          
  
    document.location.href="userMessagection!findAll?userName=<%= session.getAttribute("userName")%>";
     </script> 
  </head>
  
  <body>
    This is my JSP page. <br>
  </body>
</html>
