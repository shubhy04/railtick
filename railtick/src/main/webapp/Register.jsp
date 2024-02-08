<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>RT-Register</title>
<link rel="stylesheet" href="styles.css">
<style>
.error-message {
	color: red;
}
</style>
</head>
<body>
	<%@include file="global/navbar.jsp"%>
	<section class="registration-section">
		<h2>New User Registration</h2>
		<%
		String errorMessage = (String) request.getAttribute("errorMessage");
		if (errorMessage != null && !errorMessage.isEmpty()) {
		%>
		<p class="error-message"><%=errorMessage%></p>
		<%
		}
		%>
		<form action="userreg" method="post" enctype="multipart/form-data">
			<label for="email">Email Id:</label> <input type="email" id="email"
				name="mailid" placeholder="Enter your Email" required> <label
				for="password">Password:</label> <input type="password"
				id="password" name="pword" placeholder="Enter your Password"
				required> <label for="firstname">First Name:</label> <input
				type="text" id="firstname" name="firstname"
				placeholder="Enter your First Name" required> <label
				for="lastname">Last Name:</label> <input type="text" id="lastname"
				name="lastname" placeholder="Enter your Last Name" required>
			<label for="address">Address:</label> <input type="text" id="address"
				name="address" placeholder="Enter your Address" required> <label
				for="phoneno">Phone No:</label> <input type="tel" id="phoneno"
				name="phoneno" pattern="[0-9]{10}" placeholder="Enter your Contact"
				required> <label for="userphoto">Photo:</label> <input
				type="file" id="userphoto" name="userphoto"> <input
				type="submit"
				value="I AGREE FOR ALL TERMS & CONDITIONS! REGISTER ME">
		</form>
	</section>

</body>
</html>
