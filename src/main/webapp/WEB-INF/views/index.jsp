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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<title>Home page</title>
</head>
<body>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

	<div class="container-fluid bg">

		<%@ include file="header.jsp"%>
		<div class="container">
			<div class="row">
				<div class="col">
					<p class="h1 text-muted">Twitter like application.</p>
				 </div>	
			</div>
		</div>
	
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
			
			<table class="table">
				<thead class="thead-dark">
					<tr>
						<th>Date</th>
						<th>Posted by</th>
						<th>Content</th>
						<th>Details</th>
						<th>Action</th>
					</tr>
				</thead>
				<c:forEach  begin="0" end="10"  var="tweet" items="${allTweets}">
					<tr>
						<td>${tweet.created}</td>
						<td>${tweet.user.username}</td>
						<c:set var="shortDesc" value="${fn:substring(tweet.text, 0, 200)}" />
						<td>${shortDesc}</td>
						<td><a href="${contextPath}/tweet/details/${tweet.id}"><button>Details</button></a><br></td>
						<td><a href="${contextPath}/tweet/add-comment/${tweet.id}"><button>Comment</button></a><br></td>
					</tr>
				</c:forEach>
			</table>
		</security:authorize>
		
		
			<div class="container">
				<div class="row">
				    <div class="col">
				    </div>
				   	<div class="col">
						<security:authorize access="hasRole('ROLE_USER')" >
							<a href="${contextPath}/tweet/add"><button class="btn btn-primary">Add tweet</button></a>
					</security:authorize>
					<security:authorize access="isAnonymous()">
						<a href="${contextPath}/login"><button button class="btn btn-warning">Login to add new Tweet.</button> </a><br>
						Does not have  account? <a href="${contextPath}/register-user"><button button class="btn btn-success">Register.</button></a>
					</security:authorize>  		
				    </div>
				    <div class="col">
				    </div>
				</div>
			</div>
		<br>
		<br>
	
		<%@ include file="footer.jsp"%>
	
	</div>
</body>
</html>