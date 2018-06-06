<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@	taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Edit your profile</title>
</head>
<body>
	<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
	<h2>Enter new data</h2>
	
	<form:form method="POST" modelAttribute="user">
		Username: <form:input path="username"/><br>
		<form:errors path="username" cssClass="error" element="div"/>
		
		E-mail address: <form:input path="email"/><br>
		<form:errors path="email" cssClass="error" element="div"/>
			
		Password: <form:password path="password"/><br>
		<form:errors path="password" cssClass="error" element="div"/>
		
		
		<input type="submit" value="Save changes" />
		<input type="reset" value="Reset the form" />
	</form:form>
	<br>
	<a href="${contextPath}/user/my-page"><button>Back</button></a> 
	<a href="${contextPath}/home"><button>Main page</button></a> 
</body>
</html>