<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@	taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Confirmation</title>
</head>
<body>

	<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
	<h2>Welcome ${user.username}!</h2>
	<br>
	<h3>Account details.</h3>
	
	<table border ="1">
		<tr>
			<th>Username</th>
			<th>E-mail</th>
			<th>Member since:</th>
			<th>Last update:</th>
		</tr>
		<tr>
			<td>${user.username}</td>
			<td>${user.email}</td>
			<td>${user.created}</td>
			<td>${user.updated}</td>
		</tr>
	</table>
	
	<a href="${contextPath}/user/edit-user/${user.id}"><button>Edit profile.</button></a><br>
	
	<a href="${contextPath}/"><button>Go to main page.</button></a> 

</body>
</html>