<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@	taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<title>Tweet details</title>
</head>
<body>
	<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
	<div class="container-fluid bg">
		<%@ include file="header.jsp"%>
		
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
		
		<h3>Comments</h3>
		<table>
			<tr>
				<th>Id</th>
				<th>Posted by</th>
				<th>Created</th>
				<th>Text</th>
				<th>Action</th>
			</tr>
			<tr>
				<c:forEach items="${comments}" var="comment">
					<td>${comment.id}</td>
					<td>${comment.user.username}</td>	
					<td>${comment.created}</td>
					<td>${comment.text}</td>
					<td><a href="${contextPath}/tweet/delete-comment/${comment.id}"><button>Delete</button></a><br></td>
				</c:forEach>
			</tr>
		</table>
		
		<a href="${contextPath}/tweet/add-comment/${tweet.id}"><button class="btn btn-success">Comment</button></a>
		<div class="container" id="commentForm">
			<form:form method="POST" modelAttribute="comment">
			<div class="form-group">
				<form:hidden path="user"/>
				<form:hidden path="post"/>
			</div>
			<div class="form-group">
				Content: <form:textarea path="text" rows="20" cols="40"/><br>
				<form:errors path="text" cssClass="error" element="div"/>
			</div>
			<div class="form-group">
				<input class="btn btn-primary" type="submit" value="Add" />
				<input class="btn btn-danger"  type="reset" value="Clear" />
			</div>
			</form:form>
		</div>
		
				<div class="container">
				<div class="row">
				    <div class="col">
				    </div>
				   	<div class="col">
						<div class="btn-group btn-group-lg">
							<a href="${contextPath}/user/my-page"><button class="btn btn-dark">Back to profile</button></a><br>
							<a href="${contextPath}/tweet/edit/${tweet.id}"><button class="btn btn-dark">Add new tweet.</button></a><br>
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