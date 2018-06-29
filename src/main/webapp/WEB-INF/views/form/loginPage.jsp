<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@	taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script> 
<style>
body {font-family: Arial, Helvetica, sans-serif;}
form {border: 3px solid #f1f1f1;}

input[type=text], input[type=password] {
    width: 100%;
    padding: 12px 20px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    box-sizing: border-box;
}
button:hover {
    opacity: 0.8;
}

.imgcontainer {
    text-align: center;
    margin: 24px 0 12px 0;
}

img.avatar {
    width: 40%;
    border-radius: 50%;
}

.container {
    padding: 16px;
}

span.psw {
    float: right;
    padding-top: 16px;
}

@media screen and (max-width: 300px) {
    span.psw {
       display: block;
       float: none;
    }
}
.custom {
    width: 78px !important;
}
body, html {
    height: 100%;
    margin: 0;
}

.bg {
    background-image: url("resources/rawpixel-600782-unsplash.jpg");

    height: 100%; 

    background-position: center;
    background-repeat: no-repeat;
    background-size: cover;
}
</style>
</head>
<body>	
	<div class="container-fluid bg">
		<%@ include file="../header.jsp"%>
		
		 <form action="#" method= post>
			  <div class="imgcontainer">
			    <img  src="<c:url value="resources/login_image.jpg" />" alt="Avatar" class="avatar">
			  </div>
	
		  <div class="container">
		    <label for="email"><b>Email</b></label>
		    <input type="text" placeholder="Enter E-mail" name="email" required>
		
		    <label for="password"><b>Password</b></label>
		    <input type="password" placeholder="Enter Password" name="password" required>
			
			 <input type="hidden" 
	                     name="${_csrf.parameterName}" value="${_csrf.token}" />
		    <button class="btn btn-success" type="submit">Login</button>
		    <button type="reset" class="btn btn-danger">Cancel</button>
		  </div>
		</form> 
		<div class="container">
			<div class="row">
			    <div class="col">
			    </div>
			   	<div class="col">
			   		<div class="btn-group btn-group-lg">
						<a href="${contextPath}/home"><button type="button" class="btn btn-info">Main page</button></a>
						<a href="${contextPath}/register"><button type="button" class="btn btn-info">Register</button></a>	
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