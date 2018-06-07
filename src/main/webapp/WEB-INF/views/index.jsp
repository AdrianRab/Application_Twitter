<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<title>Home page</title>
</head>
<body style="background-color: hsl(204, 8%, 95%)">
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

	<div class="container-fluid bg">

		<%@ include file="header.jsp"%>
			
		<h1>Twitter like application.</h1>
		
		<security:authorize access="hasRole('ROLE_USER')">
		    You are logged in.
		    <br/>
		</security:authorize>
		<security:authorize access="hasRole('ROLE_ADMIN')">
		    This text is only visible to an admin
		    <br/>
		</security:authorize>
		<security:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_USER')">
			<h2>Recent tweets:</h2>
			
			<table border=1>
				<tr>
					<th>Posted</th>
					<th>Content</th>
					<th>Details</th>
				</tr>
				<c:forEach  begin="0" end="10"  var="tweet" items="${allTweets}">
					<tr>
						<td>${tweet.created}</td>
						<c:set var="shortDesc" value="${fn:substring(tweet.text, 0, 200)}" />
						<td>${shortDesc}</td>
						<td><a href="${contextPath}/tweet/details/${tweet.id}"><button>Details</button></a><br></td>
						<td><a href="${contextPath}/tweet/add-comment/${tweet.id}"><button>Comment</button></a><br></td>
					</tr>
				</c:forEach>
			</table>
			
		</security:authorize>
		
		<security:authorize access="hasRole('ROLE_USER')" >
			<h3>Post tweet</h3>
				<a href="${contextPath}/tweet/add"><button class="btn btn-primary">Add tweet</button></a>
		</security:authorize>
	
		
		<security:authorize access="isAnonymous()">
			<a href="${contextPath}/login"><button>Login to add new Tweet.</button> </a><br>
			Does not have  account? <a href="${contextPath}/register-user"><button>Register.</button></a>
		</security:authorize>
							<br>
				  			<br>
		<security:authorize access ="hasAnyRole('ADMIN', 'USER')">
		
			<form action="${contextPath}/home" method="post">
				<input class="btn btn-danger" type="submit" value="Sign Out" /> 
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			</form>
		</security:authorize>
		
		
		<%@ include file="footer.jsp"%>
	
	</div>
</body>
</html>