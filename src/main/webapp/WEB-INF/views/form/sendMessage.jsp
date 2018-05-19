<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@	taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>New message</title>
</head>
<body>
	<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
	
	<h3>New message</h3>
	<br>
	<form:form method="POST" modelAttribute="message">
		
		To: <form:select path="receiver">
				<form:option value="-" label="--Please Select--"/>
				<form:options items="${allUsers}"/>
		</form:select>
		
		Title: <form:input path="title" value="${message.title}"/><br>
		<form:errors path="title" cssClass="error" element="div"/>
		
		Message content: <form:textarea path="content" rows="20" cols="40"/><br>
		<form:errors path="content" cssClass="error" element="div"/>
		
		<form:hidden path="sender" value="${user.id}"/>
		
		<input type="submit" value="Send"/>
		<input type="reset" value="Clear"/>
	</form:form>
	<br>
	
	<a href="${contextPath}/user/messages/${user.id}"><button>Back</button></a>
	<a href="${contextPath}/home"><button>Main page</button></a> 
</body>
</html>