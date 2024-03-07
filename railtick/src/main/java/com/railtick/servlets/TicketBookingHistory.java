package com.railtick.servlets;

import java.io.IOException;
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
        TrainUtil.validateUserAuthorization(req, UserRole.CUSTOMER);
        try {
            String customerId = TrainUtil.getCurrentUserEmail(req);
            List<HistoryBean> details = bookingService.getAllBookingsByCustomerId(customerId);
            
            req.setAttribute("bookingDetails", details);
            RequestDispatcher rd = req.getRequestDispatcher("BookingHistory.jsp");
            rd.forward(req, res);
        } catch (Exception e) {
            throw new TrainException(422, this.getClass().getName() + "_FAILED", e.getMessage());
        }
    }
}
