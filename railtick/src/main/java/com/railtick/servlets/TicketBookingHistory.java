package com.railtick.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.railtick.beans.HistoryBean;
import com.railtick.beans.TrainException;
import com.railtick.constants.UserRole;
import com.railtick.service.BookingService;
import com.railtick.serviceimpl.BookingServiceImpl;
import com.railtick.entity.TrainUtil;

@WebServlet("/bookingdetails")
public class TicketBookingHistory extends HttpServlet {
    private static final long serialVersionUID = 1L;

    BookingService bookingService = new BookingServiceImpl();

    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        res.setContentType("text/html");
        PrintWriter pw = res.getWriter();
        TrainUtil.validateUserAuthorization(req, UserRole.CUSTOMER);
        try {
            String customerId = TrainUtil.getCurrentUserEmail(req);
            List<HistoryBean> details = bookingService.getAllBookingsByCustomerId(customerId);
            
            RequestDispatcher rd = req.getRequestDispatcher("BookingHistory.jsp");
            rd.include(req, res);
            pw.println("<div class='main'><p1 class='menu'>Booked Ticket History</p1></div>");

            if (!details.isEmpty()) {
                pw.println("<div class='tab'><table><tr><th>Transaction ID</th><th>Train Number</th>"
                        + "<th>From Station</th><th>To Station</th><th>Journey Date</th><th>Seat</th><th>Amount Paid</th><th>Razorpay_payment_id</th><th>Razorpay_signature</th><th>RazorpayOrderId</th><th>Details</th></tr>");

                for (HistoryBean trans : details) {
                    pw.println("<tr>" +
                                "<td>" + trans.getTransId() + "</td>" +
                                "<td>" + trans.getTr_no() + "</td>" +
                                "<td>" + trans.getFrom_stn() + "</td>" +
                                "<td>" + trans.getTo_stn() + "</td>" +
                                "<td>" + trans.getDate() + "</td>" +
                                "<td>" + trans.getSeats() + "</td>" +
                                "<td>" + trans.getAmount() + "</td>" +
                                "<td>" + trans.getRazorpay_payment_id() + "</td>" +
                                "<td>" + trans.getRazorpay_signature() + "</td>" +
                                "<td>" + trans.getRazorpayOrderId() + "</td>" +
                                "<td><a href='BookingDetailsServlet?transId=" + trans.getTransId() + "'>View Details</a></td>" +
                                "</tr>");
                }
                pw.println("</table></div>");
                
            } 
            else {
                pw.println("<div class='main'><p1 class='menu red'> No any ticket booked, book your first ticket now!!</p1></div>");
            }
        } catch (Exception e) {
            throw new TrainException(422, this.getClass().getName() + "_FAILED", e.getMessage());
        }
    }
}
