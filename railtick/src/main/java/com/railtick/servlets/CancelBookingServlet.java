package com.railtick.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.railtick.beans.TrainException;
import com.railtick.service.BookingService;
import com.railtick.serviceimpl.BookingServiceImpl;

@WebServlet("/cancelBooking")
public class CancelBookingServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private BookingService bookingService = new BookingServiceImpl();

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String transId = request.getParameter("transId");

        try {
            boolean cancellationStatus = bookingService.cancelBooking(transId);

            if (cancellationStatus) {
                // Forward to cancellation confirmation page with a success message
                sendConfirmationPage(request, response, "Booking cancelled successfully!");
            } else {
                // Forward to cancellation confirmation page with a failure message
                sendConfirmationPage(request, response, "Booking cancellation failed. Please try again.");
            }
        } catch (TrainException e) {
            // Log the exception
            e.printStackTrace();
            // Redirect to an error page
            response.sendRedirect("error.jsp");
        }
    }

    private void sendConfirmationPage(HttpServletRequest request, HttpServletResponse response, String message)
            throws ServletException, IOException {
        request.setAttribute("cancellationStatus", message);
        request.getRequestDispatcher("CancellationConfirmation.jsp").forward(request, response);
    }
}
