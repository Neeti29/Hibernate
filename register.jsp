<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.niit.hiber.UserDao"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registeration Hibernate Demo</title>
</head>
<body>
<jsp:useBean id="userBean" class="com.niit.hiber.User">
</jsp:useBean>

<jsp:setProperty property="*" name="userBean"/>

<%
	int i=UserDao.register(userBean);
	if(i>0)
		out.print("You are Successfully Registered");
%>
</body>
</html>