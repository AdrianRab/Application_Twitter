<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@	taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>User profile</title>
</head>
<body style="background-color: hsl(204, 8%, 95%)">
	
	<div  style="background-color: hsl(150, 100%, 65%)">
		<%@ include file="header.jsp"%>
	</div>
	
	<security:authorize access="hasRole('ROLE_USER')">
	    You are logged in.
	    <br/>
	</security:authorize>
	
	<c:if test="${user.role == ADMIN_ROLE}">
		<p>You are logged as admin.</p>
	</c:if>
	
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
	
	
	<h3>All tweets:</h3>
	
	<table>
		<tr>
			<th>Posted</th>
			<th>Content</th>
			<th>Details</th>
		</tr>
		<c:forEach var="tweet" items="${user.tweets}">
			<tr>
				<td>${tweet.created}</td>
				<td>${tweet.text}</td>
				<td><a href="${contextPath}/tweet/details/${tweet.id}"><button>Details</button></a><br></td>
			</tr>
		</c:forEach>
	</table>
	<a href="${contextPath}/user/messages/${user.id}"><button>Messages</button></a>
	<a href="${contextPath}/user/edit-user/${user.id}"><button>Edit profile.</button></a><br>
	<a href="${contextPath}/tweet/add"><button>Add new tweet.</button></a><br>
	<a href="${contextPath}/home"><button>Go to main page.</button></a> 
	
	<div  style="background-color: hsl(150, 100%, 65%)"><%@ include file="footer.jsp"%></div>
</body>
</html>