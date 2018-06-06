<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@	taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Add new tweet</title>
</head>
<body>

	<c:set var="contextPath" value="${pageContext.request.contextPath}" />

	<h3>Post tweet</h3>
	<br>
	<form:form method="POST" modelAttribute="tweet">
		Username: <form:input path="username" value="${user.username}" />
		<br>
		<form:errors path="username" cssClass="error" element="div" />
		
		Content: <form:textarea path="text" rows="20" cols="40" />
		<br>
		<form:errors path="text" cssClass="error" element="div" />

		<input type="submit" value="Add" />
		<input type="reset" value="Clear" />
	</form:form>
	<br>
	<a href="${contextPath}/user/my-page"><button>My profile</button></a> 
	<a href="${contextPath}/home"><button>Main page</button></a>

</body>
</html>