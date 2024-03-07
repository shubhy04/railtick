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
import com.railtick.entity.TrainUtil;
import com.railtick.service.TrainService;
import com.railtick.serviceimpl.TrainServiceImpl;
@WebServlet("/fare")
public class fareClass extends HttpServlet {
    private static final long serialVersionUID = 1L;
    TrainService trainService = new TrainServiceImpl();

    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        processRequest(req, res);
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        processRequest(req, res);
    }

    private void processRequest(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        res.setContentType("text/html");
        PrintWriter pw = res.getWriter();
        TrainUtil.validateUserAuthorization(req, UserRole.CUSTOMER);

        try {
            String trainNo = req.getParameter("trainnumber");
            TrainBean train = trainService.getFareDetails(trainNo);

            if (train != null) {
                req.setAttribute("trainnumber", trainNo);
                req.setAttribute("train", train);
                RequestDispatcher rd = req.getRequestDispatcher("FareDisplay.jsp");
                rd.forward(req, res);
            } else {
                RequestDispatcher rd = req.getRequestDispatcher("FareDisplay.jsp");
                rd.forward(req, res);
                pw.println("<div class='error-message'><p1 class='err'>Train No." + req.getParameter("trainnumber") + " is Not Available !</p1></div>");
            }
        } catch (Exception e) {
            throw new TrainException(422, this.getClass().getName() + "_FAILED", e.getMessage());
        }
    }
}
