<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@	taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<title>Messages</title>
</head>
<body>
	<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
	<div class="container-fluid bg">
		<%@ include file="header.jsp"%>
		
		<div>
			<h2>Received messages</h2>
			<c:if test="${message != null}">
				<div>	
					<p>Message has been successfully sent.</p>
				</div>
			</c:if>
			
			<div>
				<c:if test="${not empty receivedMessages}">
					<table class="table">
						<tr>
							<th>Date</th>
							<th>Title</th>
							<th>From</th>
							<th>Action</th>
						</tr>
					<c:forEach items="${receivedMessages}" var="received">
						<tr>
								<td>${received.timeSent}</td>
								<td>${received.title}</td>
								<td>${received.sender.username}</td>
								<td><a href="${contextPath}/user/delete-message/${received.id}"><button>Delete</button></a>	</td>
						</tr>
							<tr id="receivedContent"> <!-- w JS zrobić by sie rozsuwalo po klknieciu -->
								<td>${received.content}</td>
							</tr>
					</c:forEach>
					</table>
				</c:if>
				<c:if test="${empty receivedMessages || receivedMessages == null}">
					<p>You do not have any message yet.</p>
				</c:if>
			</div>
		</div>
		
		<c:if test="${not empty sentMessages}">
		<div>
			<h2>Sent messages</h2>
			<div id="sent"> <!-- w JS zrobić by sie rozsuwalo po klknieciu -->
					<table class="table">
						<tr>
							<th>Date</th>
							<th>Title</th>
							<th>To</th>
							<th>Action</th>
						</tr>
						<c:forEach items="${sentMessages}" var="sent">
							<tr>
								<td>${sent.timeSent}</td>
								<td>${sent.title}</td>
								<td>${sent.receiver.username}</td>
								<td><a href="${contextPath}/user/delete-message/${sent.id}"><button>Delete</button></a>	</td>
					
							</tr>
							<tr id="sentContent"> <!-- w JS zrobić by sie rozsuwalo po klknieciu -->
								<td>${sent.content}</td>
							</tr>
						</c:forEach>
					</table>	
			</div>
		</div>
		<c:if test="${empty sentMessages || sentMessage == null}">
			<p>You have not sent any meessages yet.</p>
		</c:if>
		</c:if>
		
			<div class="container">
				<div class="row">
				    <div class="col">
				    </div>
				   	<div class="col">
						<div class="btn-group btn-group-lg">
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