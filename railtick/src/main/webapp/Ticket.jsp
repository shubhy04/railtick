<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Train Ticket</title>
<style>
        .footer {
            background-color: #343a40;
            color: #fff;
            padding: 20px 0;
            text-align: center;
            position: absolute;
            width: 100%;
        } 


.ticket {
	width: 80%;
	padding: 30px;
	background-color: white;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
	border-radius: 10px;
	overflow: hidden;
}

table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 20px;
}

table, th, td {
	border: 1px solid #ddd;
}

th, td {
	padding: 12px;
	text-align: left;
}

th {
	background-color: #f2f2f2;
}

h1 {
	color: #333;
	text-align: center;
	margin-bottom: 20px;
}

button {
	margin-top: 10px;
	padding: 15px;
	background-color: #4CAF50;
	color: white;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	font-size: 16px;
	width: 100%;
	transition: background-color 0.3s ease;
}

button:hover {
	background-color: #45a049;
}

/* Print Styles */
@media print {
	body {
		background-color: white;
		padding: 0;
	}
	.ticket-details-container {
		width: 100%;
		margin: 0;
		box-shadow: none;
		padding: 10px;
	}
	table, th, td {
		border: 1px solid #000;
	}
	th {
		background-color: #f2f2f2;
	}
	button {
		display: none;
	}
}

/* Additional styles for better print layout */
@media print {
	table {
		page-break-inside: auto;
	}
	th, td {
		page-break-inside: avoid;
	}
}
</style>
<script>
	function printTicket() {
		window.print();
	}
</script>
</head>
<body>
     <%@include file="global/navbar.jsp"%>
	<div class="container ticket-details-container">
		<h1>Train Ticket</h1>
		<table>
			<tr>
				<th>PNR No:</th>
				<td colspan="3" style="color: blue;"><%=request.getAttribute("transId")%></td>
			</tr>
			<tr>
				<th>Train Name:</th>
				<td><%=request.getAttribute("tr_name")%></td>
				<th>Train No:</th>
				<td><%=request.getAttribute("tr_no")%></td>
			</tr>
			<tr>
				<th>Booked From:</th>
				<td><%=request.getAttribute("from_stn")%></td>
				<th>To Station:</th>
				<td><%=request.getAttribute("to_stn")%></td>
			</tr>
			<tr>
				<th>Date Of Journey:</th>
				<td><%=request.getAttribute("date")%></td>
				<th>Berth:</th>
				<td><%=request.getAttribute("berth")%></td>
			</tr>
			<tr>
				<th>Time (HH:MM):</th>
				<td>11:23</td>
				<th>Passengers:</th>
				<td><%=request.getAttribute("seats")%></td>
			</tr>
			<tr>
				<th>Class:</th>
				<td><%=request.getAttribute("class")%></td>
				<th>Booking Status:</th>
				<td style="color: <%=request.getAttribute("statusColor")%>;">
					<%=request.getAttribute("bookingStatus")%>
				</td>
			</tr>
	<tr>
    <th>Seat Numbers (Coach):</th>
   <td colspan="3"> 
       <% for (String seatNumber : (List<String>) request.getAttribute("actualSeatNumbers")) { %> 
            <%= seatNumber %><br> 
        <% } %> 
   </td>
</tr>
			<tr>
				<th>Amount Paid:</th>
				<td colspan="3">&#8377; <%=request.getAttribute("amount")%></td>

			</tr>

		</table>

		<div>
			<button onclick="printTicket()">Print Ticket</button>
		</div>

		<div style="margin-top: 20px;">
			<h3>Rules and Information:</h3>
			<p>
				1. Please carry a valid ID proof along with this ticket.<br> 2.
				Check the train schedule for any changes before your journey.<br>
				3. Report to the station at least 30 minutes before the departure
				time.<br> 4. Keep the ticket safe and do not share it with
				strangers.<br> 5. Smoking and consumption of alcohol are
				strictly prohibited on the train.<br> 6. In case of loss of
				ticket, contact the railway authorities immediately.<br> 7.
				Follow safety guidelines and instructions provided by railway staff.<br>
				8. For any assistance, contact the helpline number mentioned on the
				ticket.<br> 9. Have a safe and pleasant journey!
			</p>
		</div>
	</div>
	
	<!-- Footer -->
<footer class="footer">
    <div class="container">
        <p class="para">&copy; 2024 RailTick. All rights reserved.</p>
    </div>
</footer>
</body>
</html>
