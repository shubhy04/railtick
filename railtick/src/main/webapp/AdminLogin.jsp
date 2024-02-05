<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RT-Admin Login</title>
<%@include file="global/global_css.jsp"%>
</head>
<body>
	<%@include file="global/navbar.jsp"%>
	<!--<input type="hidden" id="status"
		value="<%=request.getAttribute("status")%>"> -->
	<div class="main mt-4">
		<div class="container col-md-6">
			<div class="card">
				<div class="card-body">
					<h2 class="form-title col-md-6">Sign in</h2>
					<h5 class="form-title col-md-6">Admin Login</h5>
					<form method="post" action="AdminLoginServlet">
						<div class="form-group col-md-8">
							<label for="Email">Email</label> <input type="email"
								class="form-control" id="Email" placeholder="Email" name="email"
								required>
						</div>
						<div class="form-group col-md-8">
							<label for="Password">Password</label> <input type="password"
								class="form-control" id="Password" placeholder="Password"
								name="pass" required>
							<!-- <i class="fa-regular fa-eye-slash"></i>  -->

						</div>
						<div class="form-row">
							<div class="form-check">
								<a href="ForgetPassword.jsp" class="forget-pass"
									style="color: #27374D;">Forget Password</a>

							</div>
							<div class="form-group">
								<div class="form-check">
									<a href="Register.jsp" class="create-account"
										style="color: #27374D;">Create Account</a>
								</div>
							</div>
						</div>
						<div class="form-group col-md-6">
							<button type="submit" class="btn" style="">Sign up</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!--  
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<link rel="stylesheet" href="alert/dist/sweetalert.css">
	<script type="text/javascript">
		var status = document.getElementById("status").value;
		if (status == "failed") {
			swal("Sorry", "Incorrect Username or Password", "error");
		} else if (status == "invalidEmail") {
			swal("Sorry", "Invalid Username", "error");
		} else if (status == "invalidPass") {
			swal("Sorry", "Invalid Password", "error");
		}
	</script>
	-->

</body>
</html>