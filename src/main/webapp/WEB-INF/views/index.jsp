<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Home page</title>
</head>
<body>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
	<h2>Navigation panel</h2>
	<a href="${contextPath}/getBookList"><button>List of all books</button> </a><br>
	<a href="${contextPath}/getAllAuthors"><button>List of all authors</button> </a><br>
	<a href="${contextPath}/getAllPublishers"><button>List of all publishers</button> </a><br>
</body>
</html>