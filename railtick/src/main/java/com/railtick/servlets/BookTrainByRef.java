package com.railtick.servlets;

import java.io.IOException;

import java.io.PrintWriter;
import java.time.LocalDate;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.railtick.constants.UserRole;
import com.railtick.entity.TrainUtil;

@WebServlet("/booktrainbyref")
public class BookTrainByRef extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        PrintWriter pw = res.getWriter();
        res.setContentType("text/html");
        TrainUtil.validateUserAuthorization(req, UserRole.CUSTOMER);

        String emailId = TrainUtil.getCurrentUserEmail(req);
        long trainNo = Long.parseLong(req.getParameter("trainNo"));
        int seat = 1;
        String fromStn = req.getParameter("fromStn");
        String toStn = req.getParameter("toStn");
        LocalDate today = LocalDate.now();
        
        req.setAttribute("emailId", emailId);
        req.setAttribute("trainNo", trainNo);
        req.setAttribute("fromStn", fromStn);
        req.setAttribute("toStn", toStn);
        req.setAttribute("today", today);
        req.setAttribute("seat", seat);
        
        RequestDispatcher rd = req.getRequestDispatcher("UserViewTrains.jsp");
        rd.include(req, res);
        
    }
}
