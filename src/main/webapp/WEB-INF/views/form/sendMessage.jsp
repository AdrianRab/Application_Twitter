<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@	taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<title>New message</title>
</head>
<body>
	<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
	<div class="container-fluid bg">
		<%@ include file="../header.jsp"%>
		<p class="h2 text-muted">New message</p>
		<br>
		<form:form method="POST" modelAttribute="message">
			<div class="form-group">
				To: <form:select path="receiver">
						<form:option value="-" label="--Please Select--"/>
						<form:options items="${allUsers}" itemLabel="username"	itemValue="id"/>
				</form:select>
				<br>
				Title: <form:input path="title"/><br>
				<form:errors path="title" cssClass="error" element="div"/>
				
				Message content: <form:textarea path="content" rows="20" cols="40"/><br>
				<form:errors path="content" cssClass="error" element="div"/>
				
				<form:hidden path="sender" value="${user.id}"/>
				
				<input type="submit" value="Send" class="btn btn-primary"/>
				<input type="reset" value="Clear" class="btn btn-danger"/>
			</div>
		</form:form>
		<br>
		
		<div class="container">
			<div class="row">
				<div class="col">
				</div>
				<div class="col">
					<div class="btn-group btn-group-lg">
						<a href="${contextPath}/user/messages"><button class="btn btn-dark">My messages</button></a>
						<a href="${contextPath}/user/my-page"><button class="btn btn-dark">Back to profile</button></a>
						<a href="${contextPath}/tweet/add"><button class="btn btn-dark">Add new tweet.</button></a>
						<a href="${contextPath}/home"><button class="btn btn-dark">Go to main page.</button></a> 
					</div>	   		
				</div>
				<div class="col">
				</div>
			</div>
		</div>
		<br>
		<br>
		<br>
		<br>
		<%@ include file="../footer.jsp"%>
	</div>
</body>
</html>