<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Access denied</title>
</head>
<body>
	<h1>You do not have permission to access this page!</h1>

		  <form action="/logout" method="post">
          	<input type="submit" value="Sign in as different user" /> 
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		  </form>   
</body>
</html>