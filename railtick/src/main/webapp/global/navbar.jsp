<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RT-Navbar</title>
<%@include file="global_css.jsp"%>

</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<a class="navbar-brand" href="#">Railtick</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarNav" aria-controls="navbarNav"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNav">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item"><a class="nav-link" href="Login.jsp">Login
						as User</a></li>
				<li class="nav-item"><a class="nav-link" href="Register.jsp">New
						User Register</a></li>
				<li class="nav-item"><a class="nav-link" href="AdminLogin.jsp">Login
						as Admin</a></li>
			</ul>
		</div>
	</nav>
</body>
</html>
