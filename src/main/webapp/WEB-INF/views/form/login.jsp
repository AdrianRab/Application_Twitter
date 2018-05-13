<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@	taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login</title>
</head>
<body>
	<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
	
<!-- 	strona nie dziala -->
	
	<h2>Login</h2>
	<form:form method="POST" modelAttribute="user">
	
		E-mail address: <form:input path="email"/><br>
		<form:errors path="email" cssClass="error" element="div"/>
			
		Password: <form:password path="password"/><br>
		<form:errors path="password" cssClass="error" element="div"/>
		
		<input type="submit" value="Login" />
		<input type="reset" value="Reset the form" />
	</form:form>
	<br>
	Doesn't have account yet? 
	<a href="${contextPath}/user/register-user"><button>Register</button></a> 
	
	<a href="${contextPath}/"><button>Cancel</button></a> 
</body>

</html>