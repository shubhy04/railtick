<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RT-Register</title>
<%@include file="global/global_css.jsp"%>
<body>
	<%@include file="global/navbar.jsp"%>
	<input type="hidden" id="status"
		value="<%=request.getAttribute("status")%>">
	<div class="main mt-4">
		<div class="container">
			<div class="card">
				<div class="card-body">
					<h2 class="form-title" style="color: #27374D;">Sign up</h2>
					<form method="post" action="RegistrationServlet">
						<div class="form-row">
							<div class="form-group col-md-6">
								<label for="inputFname">First Name</label><input type="text"
									class="form-control" name="fname" placeholder="First name"
									required>
							</div>
							<div class="form-group col-md-6">
								<label for="inputLname">Last Name</label><input type="text"
									class="form-control" name="lname" placeholder="Last name"
									required>
							</div>
						</div>
						<div class="form-row">
							<div class="form-group col-md-6">
								<label for="inputEmail">Email</label> <input type="email"
									class="form-control" id="inputEmail" name="email"
									placeholder="Email" required>
							</div>
							<div class="form-group col-md-3">
								<label for="inputPassword">Password</label> <input
									type="password" class="form-control" id="inputPassword"
									name="pass" placeholder="Password" required>
							</div>
							<div class="form-group col-md-3">
								<label for="inputRePass">Repeat Password</label> <input
									type="password" class="form-control" id="inputRePass"
									name="repass" placeholder="Repeat Password" required>
							</div>
						</div>
						<div class="form-row">
							<div class="form-group col-md-6">
								<label for="inputPhone">Phone No</label><input type="text"
									class="form-control" name="phno" placeholder="Phone No"
									required>
							</div>
							<div class="form-group col-md-4">
								<label for="inputState">Gender</label> <select id="inputState"
									class="form-control" name="gender" required>
									<option selected>Choose...</option>
									<option>Male</option>
									<option>Female</option>
									<option>Other</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="inputAddress">Address</label> <input type="text"
								class="form-control" id="inputAddress" name="address"
								placeholder="Address" required>
						</div>
						<div class="form-row">
							<div class="form-group col-md-9">
								<div class="form-check">
									<input class="form-check-input" type="checkbox" value=""
										id="invalidCheck" required> <label
										class="form-check-label" for="invalidCheck"> Agree to
										terms and conditions </label>
								</div>
							</div>
							<div class="form-group col-md-3">
								<div class="form-check">
									<a href="Login.jsp" class="already-user"
										style="color: #27374D;">I am already member</a>
								</div>
							</div>
						</div>
						<button type="submit" class="btn" style="">Sign up</button>
					</form>
				</div>
			</div>
		</div>
	</div>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<link rel="stylesheet" href="alert/dist/sweetalert.css">
	<script type="text/javascript">
		var status = document.getElementById("status").value;
		if (status == "success") {
			swal("Congrats", "Account created succesfully", "success");
		}
		if (status == "invalidFname") {
			swal("Sorry", "Enter First Name", "error");
		}
		if (status == "invalidLname") {
			swal("Sorry", "Enter Last Name", "error");
		}
		if (status == "invalidEmail") {
			swal("Sorry", "Enter Email", "error");
		}
		if (status == "invalidPass") {
			swal("Sorry", "Enter Password", "error");
		}
		if (status == "invalidRePass") {
			swal("Sorry", "Password doesn't match", "error");
		}
		if (status == "invalidPhno") {
			swal("Sorry", "Enter Phone number", "error");
		}
		if (status == "invalidGender") {
			swal("Sorry", "Enter Gender", "error");
		}
		if (status == "invalidAddress") {
			swal("Sorry", "Enter Addesss", "error");
		}
	</script>
</body>
</html>

