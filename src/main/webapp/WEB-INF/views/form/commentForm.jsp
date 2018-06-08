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
<title>Add comment</title>
</head>
<body>
	<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
	<div class="container-fluid bg">
		<%@ include file="../header.jsp"%>
		<div class="container" id="commentForm">
			<form:form method="POST" modelAttribute="comment">
			<div class="form-group">
				<form:hidden path="user" value="${user.id}"/>
				<form:hidden path="post" value="${tweet.id}"/> 
			</div>
			<div class="form-group">
				Content: <form:textarea path="text" rows="20" cols="40"/><br>
				<form:errors path="text" cssClass="error" element="div"/>
			</div>
			<div class="form-group">
				<input class="btn btn-primary" type="submit" value="Add" />
				<input class="btn btn-danger"  type="reset" value="Clear" />
			</div>
			</form:form>
		</div>
		<br>
		<div class="container">
			<div class="row">
				<div class="col">
				 </div>
				 <div class="col">
					<div class="btn-group btn-group-lg">
						<a href="${contextPath}/user/my-page"><button class="btn btn-dark">Back to profile</button></a><br>
						<a href="${contextPath}/tweet/details/${tweed.id}"><button class="btn btn-dark">Back to tweet</button></a><br>
						<a href="${contextPath}/home"><button class="btn btn-dark">Go to main page.</button></a> 
					</div>	   		
				  </div>
				  <div class="col">
				 </div>
			</div>
		</div>
		<%@ include file="../footer.jsp"%>
	</div>
</body>
</html>