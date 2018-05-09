<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@	taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>New author</title>
</head>
<body>
	<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

	<form:form method="POST" modelAttribute="author">
		First name: <form:input path="firstName"/><br>
		<form:errors path="firstName" cssClass="error" element="div"/>
		
		Last name: <form:input path="lastName"/><br>
		<form:errors path="lastName" cssClass="error" element="div"/>
<%-- 		Books: <form:select path="books" items="${bookItems}"
			itemValue="id" itemLabel="title" /> --%>
			
		PESEL: <form:input path="pesel"/><br>
		<form:errors path="pesel" cssClass="error" element="div"/>
		
		E-mail address: <form:input path="email"/><br>
		<form:errors path="email" cssClass="error" element="div"/>
		
		Year of birth: <form:input path="yearOfBirth"/><br>
		<form:errors path="yearOfBirth" cssClass="error" element="div"/>
		
		<input type="submit" value="Save" />
	</form:form>
	<br>
	<a href="${contextPath}/"><button>Home</button></a> 
</body>
</html>