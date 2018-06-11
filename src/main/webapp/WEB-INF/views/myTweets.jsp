<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<title>${user.username} tweets</title>
</head>
<body>
		<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
	<div class="container-fluid bg">
		<%@ include file="header.jsp"%>
		
		
		<div class="container">
			<p class="h2 text-muted">Tweets</p>
			<c:if test="${not empty myTweets}">
				<table class="table">
					<thead class="thead-dark">
						<tr>
							<th>Id:</th>
							<th>Created:</th>
							<th>Edited:</th>
							<th>Text:</th>
							<th>Details:</th>
						</tr>
					</thead>
	
					<c:forEach items="${myTweets}" var="tweet">
						<tr>
							<td>${tweet.id}</td>
							<td>${tweet.created}</td>
							<td>${tweet.updated}</td>
							<c:set var="shortDesc" value="${fn:substring(tweet.text, 0, 200)}" />
							<td>${shortDesc}</td>
							<td><a href="${contextPath}/tweet/details/${tweet.id}">Details</a></td>
						</tr>
					</c:forEach>
				</table>
			</c:if>
			<c:if test="${empty myTweets}">
				<p class="h2 text-muted">You do not have any tweets yet. <a href="${contextPath}/tweet/add"> Click </a> to add a new tweet.</p>
			</c:if>
		</div>
			<div class="container">
				<div class="row">
				    <div class="col">
				    </div>
				   	<div class="col">
						<div class="btn-group btn-group-lg">
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