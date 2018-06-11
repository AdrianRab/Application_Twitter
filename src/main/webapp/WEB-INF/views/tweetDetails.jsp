<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@	taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<title>Tweet details</title>
</head>
<body>
	<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
	<div class="container-fluid bg">
		<%@ include file="header.jsp"%>
		
		
		<div class="container">
			<p class="h2 text-muted">Tweet details</p>
			<table class="table">
				<thead class="thead-dark">
					<tr>
						<th>Id:</th>
						<th>Created:</th>
						<th>Edited:</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>${tweet.id}</td>
						<td>${tweet.created}</td>
						<td>${tweet.updated}</td>
					</tr>
				</tbody>
				<tr>
					<td align="center" rowspan="3">${tweet.text}</td>
				</tr>
			</table>
		</div>
		<div class="container">
			<h3>Comments</h3>
			<table class="table table-bordered table-sm">
				<thead>
					<tr>
						<th>Id</th>
						<th>Posted by</th>
						<th>Created</th>
						<th>Text</th>
						<th>Action</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<c:forEach items="${comments}" var="comment">
							<td>${comment.id}</td>
							<td>${comment.user.username}</td>	
							<td>${comment.created}</td>
							<td>${comment.text}</td>
							<td><a href="${contextPath}/tweet/delete-comment/${comment.id}"><button>Delete</button></a><br></td>
						</c:forEach>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="container">
			<div class="row">
				<div class="col">
					<a href="${contextPath}/tweet/add-comment/${tweet.id}"><button class="btn btn-success">Comment</button></a>
				</div>
			</div>
		</div>
			<div class="container">
				<div class="row">
				    <div class="col">
				    </div>
				   	<div class="col">
						<div class="btn-group btn-group-lg">
							<a href="${contextPath}/user/my-page"><button class="btn btn-dark">Back to profile</button></a>
							<a href="${contextPath}/tweet/edit/${tweet.id}"><button class="btn btn-dark">Edit tweet.</button></a>
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