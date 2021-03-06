<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@	taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<title>User profile</title>
</head>
<body>
	<div class="container-fluid bg">
		<%@ include file="header.jsp"%>

	<div class="container">
		<div class="row">
			<div class="col">
				<c:if test="${adminMode==true}">
					<security:authorize access ="hasRole('ADMIN')">
						<p class="h2 text-muted">You are logged as admin.</p>
					</security:authorize>
				</c:if>
			</div>
		</div>
	</div>
	<br>
	<br>
	<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
	<div class="container">
		<div class="row">
			<div class="col">
				<c:if test="${adminMode==false || adminMode==null}">
					<p class="h2 text-muted">Welcome ${user.username}!</p>
				</c:if>
			</div>
		</div>
	</div>
	<br>
	<div class="container">
		<h3>Account details.</h3>
		<table class="table">
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
	</div>
	
	
	<div class="container">
		<h3>All tweets:</h3>
		<table class="table">
			<thead class="thead-dark">
				<tr>
					<th>Posted</th>
					<th>Content</th>
					<th>Details</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="tweet" items="${user.tweets}">
					<tr>
						<td>${tweet.created}</td>
						<td>${tweet.text}</td>
						<td><a href="${contextPath}/tweet/details/${tweet.id}"><button>Details</button></a><br></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
		<div class="container">
			<div class="row">
				<div class="col">
				 </div>
				 <div class="col">
					<div class="btn-group btn-group-lg">
						<a href="${contextPath}/user/messages"><button class="btn btn-dark">Messages</button></a>
						<a href="${contextPath}/user/edit-user"><button class="btn btn-dark">Edit profile.</button></a><br>
						<a href="${contextPath}/user/my-tweets"><button class="btn btn-dark">My tweets</button></a>
						<a href="${contextPath}/tweet/add"><button class="btn btn-dark">Add new tweet.</button></a><br>
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