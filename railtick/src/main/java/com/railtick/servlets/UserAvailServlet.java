package com.railtick.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.railtick.beans.TrainBean;
import com.railtick.beans.TrainException;
import com.railtick.constants.UserRole;
import com.railtick.service.TrainService;
import com.railtick.serviceimpl.TrainServiceImpl;
import com.railtick.entity.TrainUtil;

/**
 * Servlet implementation class UserAvailServlet
 */
@WebServlet("/useravail")
public class UserAvailServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private TrainService trainService = new TrainServiceImpl();

    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        res.setContentType("text/html");
        PrintWriter pw = res.getWriter();

       // TrainUtil.validateUserAuthorization(req, UserRole.CUSTOMER);

        try {
            String trainNo = req.getParameter("trainnumber");

            if (trainNo != null && !trainNo.isEmpty()) {
                TrainBean train = trainService.getTrainById(trainNo);

                if (train != null) {
                    req.setAttribute("successMessage", "Train No." + trainNo + "Seats available : " + train.getSeats());
                } else {
                    req.setAttribute("errorMessage", "Train No. " + trainNo + " is Not Available!");
                }
            } else {
                req.setAttribute("errorMessage", "Invalid Train Number!");
            }

            RequestDispatcher rd = req.getRequestDispatcher("Availability.jsp");
            rd.forward(req, res);

        } catch (Exception e) {
            throw new TrainException(422, this.getClass().getName() + "_FAILED", e.getMessage());
        }
    }
}
