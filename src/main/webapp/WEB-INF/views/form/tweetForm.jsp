<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@	taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<title>Add new tweet</title>
</head>
<body>

	<c:set var="contextPath" value="${pageContext.request.contextPath}" />
	
	<div class="container">
		<h3>Post tweet</h3>
		<br>
		<form:form method="POST" modelAttribute="tweet">
			<div class="form-group">
				<p id="userlHelp" class="form-text text-muted">You are posting as ${user.username}.</p>
				<form:hidden path="user" value="${user.id}" />
				<br>
				<form:errors path="user" cssClass="error" element="div" />
			</div>
			<div class="form-group">
				<label for="tweetText">Your post:</label>
				<form:textarea path="text" rows="20" cols="40" maxlength="160" id="tweetText"/>
				<br>
				<form:errors path="text" cssClass="error" element="div" />
			</div>
			<input class="btn btn-primary" type="submit" value="Add" />
			<input class="btn btn-danger" type="reset" value="Clear"/>
		</form:form>
		<br>
	</div>
		<div class="container">
			<div class="row">
			    <div class="col">
			    </div>
			   	<div class="col">
					<div class="btn-group btn-group-lg">
						<a href="${contextPath}/user/my-page"><button class="btn btn-dark">My profile</button></a> 
						<a href="${contextPath}/home"><button class="btn btn-dark">Main page</button></a>
					</div>	   		
			    </div>
			    <div class="col">
			    </div>
			</div>
		</div>


</body>
</html>