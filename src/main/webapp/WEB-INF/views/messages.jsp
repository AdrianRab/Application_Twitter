<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@	taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Messages</title>
</head>
<body>
	<div  style="background-color: hsl(150, 100%, 65%)"><%@ include file="header.jsp"%></div>
		<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
		<div>
			<h2>Received messages</h2>
			<c:if test="${message != null}">
				<div>	
					<p>Message has been successfully sent.</p>
				</div>
			</c:if>
			
			<div>
				<table border=1>
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
							<td><a href="${contextPath}/user/delete/${received.id}"><button>Delete</button></a>	</td>
					</tr>
						<tr id="receivedContent"> <!-- w JS zrobić by sie rozsuwalo po klknieciu -->
							<td>${received.content}</td>
						</tr>
				</c:forEach>
				</table>
			</div>
		</div>
		
		<div>
			<h2>Sent messages</h2>
			<div id="sent"> <!-- w JS zrobić by sie rozsuwalo po klknieciu -->
				<table border=1>
			<tr>
				<th>Date</th>
				<th>Title</th>
				<th>From</th>
				<th>Action</th>
			</tr>
					<c:forEach items="${sentMessages}" var="sent">
						<tr>
							<td>${sent.timeSent}</td>
							<td>${sent.title}</td>
							<td>${sent.sender.username}</td>
							<td><a href="${contextPath}/user/delete/${sent.id}"><button>Delete</button></a>	</td>
				
						</tr>
						<tr id="sentContent"> <!-- w JS zrobić by sie rozsuwalo po klknieciu -->
							<td>${sent.content}</td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
		
		<a href="${contextPath}/user/sendMessage/${user.id}"><button>Send message</button></a>
		<br>
		<a href="${contextPath}/user/my-page/${user.id}"><button>Back</button></a>	
	<div  style="background-color: hsl(150, 100%, 65%)"><%@ include file="footer.jsp"%></div> 
</body>
</html>