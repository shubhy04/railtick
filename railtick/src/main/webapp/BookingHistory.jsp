<%@ page import="java.util.List"%>
<%@ page import="com.railtick.beans.HistoryBean"%>
<%@ page import="java.util.Collections" %>
<%@ page import="java.util.Comparator" %>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<style>
body {
	background-color: #FFF7F1;
	color: #403d39;
}
.table td, .table th {
   
    vertical-align: middle !important;
}
.table-container {
	margin-top: 20px;
}

.table-container table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 20px;
}

.table-container th, .table-container td {
	padding: 12px;
	border: 1px solid #dee2e6;
	text-align: left;
}

.table-container th {
	background-color: #403d39;
	color: #fff;
	cursor: pointer;
}

.table-container tbody tr {
	background-color: #ccc5b9;
}

.table-container tbody tr:hover {
	background-color: #ddd;
}

.btn-view-details {
	display: inline-block;
	padding: 6px 12px;
	margin-bottom: 0;
	font-size: 14px;
	font-weight: normal;
	line-height: 1.42857143;
	text-align: center;
	white-space: nowrap;
	vertical-align: middle;
	cursor: pointer;
	background-image: none;
}

.btn-view-details {
	background-color: #403d39 !important;
	color: #fffcf2 !important;
	text-decoration: none;
}

.btn-view-details:hover, .btn-view-details:active, .btn-view-details:focus
	{
	background-color: #252422 !important;
	color: #fffcf2 !important; /* Adjusted text color on hover */
}

.error-message {
	background-color: #ffdddd;
	color: #dc3545;
	padding: 10px;
	margin-top: 20px;
	border-radius: 5px;
}

.err {
	font-weight: bold;
}
.footer {
	background-color: #403d39;
	color: #fffcf2;
	padding: 20px 0;
	text-align: center;
	position: absolute;
	width: 100%;
}
</style>
<title>Railtick - Booking History</title>
</head>
<body>
	<%@include file="global/navbar.jsp"%>

	<!-- Booking Details Table -->
	<div class="container table-container">
		<h2 class="text-center mb-4">Booking History</h2>

		<%
List<HistoryBean> bookingDetails = (List<HistoryBean>) request.getAttribute("bookingDetails");

// Sort the booking details by transaction date in descending order
Collections.sort(bookingDetails, new Comparator<HistoryBean>() {
    @Override
    public int compare(HistoryBean o1, HistoryBean o2) {
        // Assuming 'getDate()' returns a Date object
        return o2.getDate().compareTo(o1.getDate());
    }
});
%>

		<%
		if (bookingDetails != null && !bookingDetails.isEmpty()) {
		%>
		<table class="table">
			<thead>
				<tr>
					<th>Transaction ID</th>
					<th>Train Number</th>
					<th>From Station</th>
					<th>To Station</th>
					<th>Journey Date</th>
					<th>Seats</th>
					<th>Amount Paid</th>
					<th>Razorpay Payment ID</th>
					<th>Razorpay Order ID</th>
					<th>Details</th>
				</tr>
			</thead>
			<tbody>
				<%
				for (HistoryBean trans : bookingDetails) {
				%>
				<tr>
					<td
						style="max-width: 120px; overflow: hidden; text-overflow: ellipsis;"><%=trans.getTransId()%></td>
					<td><%=trans.getTr_no()%></td>
					<td><%=trans.getFrom_stn()%></td>
					<td><%=trans.getTo_stn()%></td>
					<td><%=trans.getDate()%></td>
					<td><%=trans.getSeats()%></td>
					<td><%=trans.getAmount()%></td>
					<td
						style="max-width: 120px; overflow: hidden; text-overflow: ellipsis;"><%=trans.getRazorpay_payment_id()%></td>
					<td
						style="max-width: 120px; overflow: hidden; text-overflow: ellipsis;"><%=trans.getRazorpayOrderId()%></td>
					<td><a
						href='BookingDetailsServlet?transId=<%=trans.getTransId()%>'
						class="btn btn-info btn-sm btn-view-details">View Details</a></td>
				</tr>
				<%
				}
				%>
			</tbody>
		</table>
	</div>
	<%
	} else {
	%>

	<div class="text-center">
		<p>No tickets booked, book your first ticket now!!</p>
	</div>
	<%
	}
	%>

<!-- 	<footer class="footer">
		<div class="container">
			<p>&copy; 2024 RailTick. All rights reserved.</p>
		</div>
	</footer> -->
</body>
</html>
