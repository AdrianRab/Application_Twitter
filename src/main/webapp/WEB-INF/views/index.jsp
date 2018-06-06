<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Home page</title>
</head>
<body style="background-color: hsl(204, 8%, 95%)">
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
	
	<div  style="background-color: hsl(150, 100%, 65%)">
		<%@ include file="header.jsp"%>
	</div>
		
	<h1>Welcome on main page of new Twitter application.</h1>
	
	<security:authorize access="hasRole('ROLE_USER')">
	    You are logged in.
	    <br/>
	</security:authorize>
	<security:authorize access="hasRole('ROLE_ADMIN')">
	    This text is only visible to an admin
	    <br/>
	</security:authorize>
	
	<h2>Navigation panel</h2>
	<a href="${contextPath}/login"><button>Login</button> </a><br>
	<a href="${contextPath}/register-user"><button>Register</button> </a><br>	
	
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
	
	
	
	<security:authorize access="hasRole('ROLE_USER')" >
		<h3>Post tweet</h3>
		<br>
		<form:form method="POST" modelAttribute="tweet">
			Username: <form:input path="username" value="${user.username}"/><br>
			<form:errors path="username" cssClass="error" element="div"/>
			
			Content: <form:textarea path="text" rows="20" cols="40"/><br>
			<form:errors path="text" cssClass="error" element="div"/>
				
			<input type="submit" value="Add" />
			<input type="reset" value="Clear" />
		</form:form>
	</security:authorize>

	
	<security:authorize access="isAnonymous()">
		<a href="${contextPath}/login"><button>Login to add new Tweet.</button> </a><br>
	</security:authorize>
						<br>
			  			<br>
	<security:authorize access ="hasAnyRole('ADMIN', 'USER')">
	
		<form action="/logout" method="post">
			<input class="btn btn-danger" type="submit" value="Sign Out" /> 
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		</form>
	</security:authorize>
	
	
 	<div  style="background-color: hsl(150, 100%, 65%)"><%@ include file="footer.jsp"%></div>
	
	
</body>
</html>