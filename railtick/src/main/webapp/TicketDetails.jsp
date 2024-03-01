<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="en">
<head>
    <!-- Your existing head content -->
</head>
<body>
    <div class="main">
        <h1>Ticket Details</h1>
    </div>

    <div class="tab">
         <table>
            <tr>
                <th>PNR No:</th>
                <td colspan="3" style="color: blue;"><%= request.getAttribute("transId") %></td>
            </tr>
            <tr>
                <th>Train Name:</th>
                <td><%= request.getAttribute("tr_name") %></td>
                <th>Train No:</th>
                <td><%= request.getAttribute("tr_no") %></td>
            </tr>
            <tr>
                <th>Booked From:</th>
                <td><%= request.getAttribute("from_stn") %></td>
                <th>To Station:</th>
                <td><%= request.getAttribute("to_stn") %></td>
            </tr>
            <tr>
                <th>Date Of Journey:</th>
                <td><%= request.getAttribute("date") %></td>
                <th>Berth:</th>
                <td><%= request.getAttribute("berth") %></td>
            </tr>
            <tr>
                <th>Time (HH:MM):</th>
                <td>11:23</td>
                <th>Passengers:</th>
                <td><%= request.getAttribute("seats") %></td>
            </tr>
            <tr>
                <th>Class:</th>
                <td><%= request.getAttribute("class") %></td>
                <th>Booking Status:</th>
                <td style="color: <%= request.getAttribute("statusColor") %>;">
                    <%= request.getAttribute("bookingStatus") %>
                </td>
            </tr>
            <tr>
                <th>Amount Paid:</th>
                <td colspan="3">&#8377; <%= request.getAttribute("amount") %></td>
            </tr>
        </table>
    </div>

    <div class="main">
        <button onclick="window.print()">Print Ticket</button>
    </div>
</body>
</html>
