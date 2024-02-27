<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RT-SeatAvailability</title>
</head>
<body>
	<div class="tab">
		<p class="menu">Seat Availability</p>
	</div>
	<form action="useravail" class="tab red" method="post">
		<label>TrainNumber: </label><input type="text" name="trainno" required>
		<br /> <input type="submit" value=" SEARCH TRAIN AVAILABILITY">
	</form>
</body>
</html>