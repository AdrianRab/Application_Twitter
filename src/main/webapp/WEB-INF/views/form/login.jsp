<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@	taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login</title>
</head>
<body>
	<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
	
	
	<h2>Login</h2>
	
	<c:if test="${errorMessage != null}">
		<div><h3>Error</h3>
			<p>${errorMessage}</p>
		</div>
	</c:if>
	
	<form method="POST" action="http://localhost:8080/Application_Twitter/login">
		<table border=1>
			<tr>
				<th>Email:</th>
				<td>
					<input type="text" name="email">
				</td>
			</tr>
			<tr>
				<th>Password:</th>
				<td>
					<input type="password" name="password">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" name="submitButton" value="Log in">
				</td>
			</tr>
		</table>
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	</form>
	
	<br>
	Don't have account yet? 
	<a href="${contextPath}/user/register-user"><button>Register</button></a> <br>
	
	<a href="${contextPath}/home"><button>Cancel</button></a> 
</body>

</html>