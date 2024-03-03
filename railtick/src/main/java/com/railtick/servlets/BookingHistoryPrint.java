package com.railtick.servlets;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.railtick.beans.HistoryBean;
import com.railtick.beans.TrainException;
import com.railtick.service.BookingService;
import com.railtick.serviceimpl.BookingServiceImpl;

@WebServlet("/BookingDetailsServlet")
public class BookingHistoryPrint extends HttpServlet {
    private static final long serialVersionUID = 1L;
    BookingService bookingService = new BookingServiceImpl();
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        // Get the transId parameter from the request
        String transId = request.getParameter("transId");

        // Call the service method to get the booking details
        try {
            HistoryBean transaction = bookingService.getBookingByTransId(transId);

            // Set the result in the request attribute
            request.setAttribute("transaction", transaction);

            // Forward the request to the JSP page
            RequestDispatcher dispatcher = request.getRequestDispatcher("PrintTicketDetails.jsp");
            dispatcher.forward(request, response);
        } catch (TrainException e) {
            out.println("Error: " + e.getMessage());
        }
    }
}
