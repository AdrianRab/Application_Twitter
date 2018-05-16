<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@	taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Tweet details</title>
</head>
<body>
		<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
	
	<h2>Tweet details</h2>
	
	<table border=1>
		<tr>
			<th>Id:</th>
			<td>${tweet.id}</td>
		</tr>
		<tr>
			<th>Created:</th>
			<td>${tweet.created}</td>
		</tr>
		<tr>
			<th>Edited:</th>
			<td>${tweet.updated}</td>
		</tr>
		<tr>
			<th>Content:</th>
			<td>${tweet.text}</td>
		</tr>
	
	</table>
	
	<a href="${contextPath}/user/my-page/${user.id}"><button>Back to profile</button></a><br>
	<a href="${contextPath}/tweet/edit/${tweet.id}"><button>Add new tweet.</button></a><br>
	<a href="${contextPath}/"><button>Go to main page.</button></a> 
</body>
</html>