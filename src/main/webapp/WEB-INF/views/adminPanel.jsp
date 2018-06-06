<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@	taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Admin</title>
</head>
<body>
	<div  style="background-color: hsl(150, 100%, 65%)"><%@ include file="header.jsp"%></div>
	
	
	<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
	
<%-- 	<c:choose>
		<c:when test="${pageContext.request.userPrincipal.authenticated}">Show something</c:when>
		<c:otherwise>Show something else</c:otherwise>
	</c:choose> --%>
	
	<table border=1>
	<tr>
		<th>Username</th>
		<th>E-mail</th>
		<th>Active since</th>
		<th>Profile</th>
		<th>Action</th>
	</tr>
		<c:forEach items="allUsers" var="user">
		<tr>
			<td>${user.username}</td>
			<td>${user.email}</td>
			<td>${user.created}</td>
			<td><a href="${contextPath}/user/my-page/${user.id}"><button>Details</button></a></td>
			<td><a href="${contextPath}/admin/rights/${user.id}"><button>Add admin rights</button></a></td>
			<td><a href="${contextPath}/user/edit-user/${user.id}"><button>Edit</button></a></td>
			<td><a href="${contextPath}/user/detele-user/${user.id}"><button>Delete</button></a></td>
		</tr>	
		</c:forEach>
	</table>
	
	<a href="${contextPath}/home"><button>Home</button></a>
	
	<div  style="background-color: hsl(150, 100%, 65%)"><%@ include file="footer.jsp"%></div> 
</body>
</html>