<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@	taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Admin</title>
</head>
<body>
<div class="container-fluid bg">
	<%@ include file="header.jsp"%>
	
	
	<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
	
	<table class="table">
	<tr>
		<th>Username</th>
		<th>E-mail</th>
		<th>Active since</th>
		<th>Profile</th>
		<th>Action</th>
	</tr>
		<c:forEach items="${allUsers}" var="user">
		<tr>
			<td>${user.username}</td>
			<td>${user.email}</td>
			<td>${user.created}</td>
			<td><a href="${contextPath}/user/my-page/${user.id}"><button class="btn btn-info">Details</button></a></td>
			<c:if test="${user.role.role == 'ROLE_USER'}">
				<td><a href="${contextPath}/admin/rights/${user.id}"><button class="btn btn-info">Add admin rights</button></a></td>
			</c:if>
			<c:if test="${user.role.role == 'ROLE_ADMIN'}" >
				<td><a href="${contextPath}/admin/remove-rights/${user.id}"><button class="btn btn-info">Remove admin rights</button></a></td>
			</c:if>
			<td><a href="${contextPath}/admin/edit-user/${user.id}"><button class="btn btn-warning">Edit</button></a></td>
			<td><a href="${contextPath}/admin/delete-user/${user.id}"><button class="btn btn-danger">Delete</button></a></td>
		</tr>	
		</c:forEach>
	</table>
	
	<div class="container">
		<div class="row">
			<div class="col">
			</div>
			<div class="col">
			<div class="btn-group btn-group-lg">
				<a href="${contextPath}/admin/add"><button class="btn btn-dark">Add new admin</button></a>
				<a href="${contextPath}/user/send-message"><button class="btn btn-dark">Send message</button></a>
				<a href="${contextPath}/user/my-page"><button class="btn btn-dark">Back to profile</button></a>
				<a href="${contextPath}/tweet/add"><button class="btn btn-dark">Add new tweet.</button></a>
				<a href="${contextPath}/home"><button class="btn btn-dark">Go to main page.</button></a> 
			</div>	   		
			</div>
			<div class="col">
			</div>
		</div>
	</div>
	
	<%@ include file="footer.jsp"%>
</div>
</body>
</html>