package com.railtick.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.railtick.constants.UserRole;
import com.railtick.entity.TrainUtil;
import com.railtick.beans.TrainException;

@WebServlet("/adminlogin")
public class AdminLoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        PrintWriter pw = res.getWriter();
        res.setContentType("text/html");

        // Server-side validation
        String errorMessage = validateRequestParameters(req);
        if (errorMessage != null) {
            RequestDispatcher rd = req.getRequestDispatcher("AdminLogin.jsp");
            rd.include(req, res);
            pw.println("<div class='login-section'><p class='error-message'>" + errorMessage + "</p></div>");
            return;
        }

        String uName = req.getParameter("uname");
        String pWord = req.getParameter("pword");

        try {
            String message = TrainUtil.login(req, res, UserRole.ADMIN, uName, pWord);
            if ("SUCCESS".equalsIgnoreCase(message)) {
                RequestDispatcher rd = req.getRequestDispatcher("AdminHome.jsp");
                rd.include(req, res);
            } else {
                RequestDispatcher rd = req.getRequestDispatcher("AdminLogin.jsp");
                rd.include(req, res);
                pw.println("<div class='login-section'><p class='error-message'>" + message + "</p></div>");
            }
        } catch (Exception e) {
            throw new TrainException(422, this.getClass().getName() + "_FAILED", e.getMessage());
        }
    }

    // Server-side validation method
    private String validateRequestParameters(HttpServletRequest req) {
        String uName = req.getParameter("uname");
        String pWord = req.getParameter("pword");

        if (uName == null || uName.trim().isEmpty() || pWord == null || pWord.trim().isEmpty()) {
            return "Username and Password are required.";
        }
        return null;
    }
}
