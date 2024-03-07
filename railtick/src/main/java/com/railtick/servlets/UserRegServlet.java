package com.railtick.servlets;

import java.io.IOException;

import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.railtick.beans.UserBean;
import com.railtick.constants.UserRole;
import com.railtick.serviceimpl.UserServiceImpl;
import com.railtick.service.UserService;
import com.railtick.beans.TrainException;
@WebServlet("/userreg")
public class UserRegServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserService userService = new UserServiceImpl(UserRole.CUSTOMER);

    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
        res.setContentType("text/html");
        PrintWriter pw = res.getWriter();
        try {
            UserBean user = new UserBean();
            user.setMailId(req.getParameter("mailid"));
            user.setPWord(req.getParameter("pword"));
            user.setFName(req.getParameter("firstname"));
            user.setLName(req.getParameter("lastname"));
            user.setAddr(req.getParameter("address"));
            user.setPhNo(Long.parseLong(req.getParameter("phoneno")));

            String message = userService.registerUser(user);
            if ("SUCCESS".equalsIgnoreCase(message)) {
                // Set success message in request attribute
                req.setAttribute("successMessage", "User Registered Successfully!");
                RequestDispatcher rd = req.getRequestDispatcher("Login.jsp");
                rd.forward(req, res);
            } else {
                // Set error message in request attribute
                req.setAttribute("errorMessage", message);
                RequestDispatcher rd = req.getRequestDispatcher("Register.jsp");
                rd.forward(req, res);
            }

        } catch (Exception e) {
            // Handle exceptions
            throw new TrainException(422, this.getClass().getName() + "_FAILED", e.getMessage());
        }
    }
}