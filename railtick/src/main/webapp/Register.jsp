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

	<table class="tab brown hd">
		<tr>
			<td>New User Registration</td>
		</tr>
	</table>

	<table class="tab green">

		<tr>
			<td>
				<form action="userreg" method="post">
					Email Id : <input type="email" name="mailid"
						placeholder="Enter your emailId" required><br /> <br />
					Password : <input type="password" name="pword" required><br />
					<br /> FirstName: <input type="text" name="firstname" required><br />
					<br /> Last Name: <input type="text" name="lastname" required><br />
					<br /> Address : <input type="text" name="address" required><br />
					<br /> Phone No : <input type="number" name="phoneno" required><br />
<!-- 					<br /> Photo : <input type="file" name="userphoto"><br /> -->
					<br /> <input type="submit"
						value=" I AGREE FOR ALL TERMS & CONDITIONS ! REGISTER ME "
						style="text-align: center">
				</form>
			</td>

		</tr>
	</table>




</body>
</html>
