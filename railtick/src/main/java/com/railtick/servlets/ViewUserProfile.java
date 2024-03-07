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
import com.railtick.entity.TrainUtil;

@WebServlet("/viewuserprofile")
public class ViewUserProfile extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        res.setContentType("text/html");
        PrintWriter pw = res.getWriter();

        TrainUtil.validateUserAuthorization(req, UserRole.CUSTOMER);

        UserBean ub = TrainUtil.getCurrentCustomer(req);
        req.setAttribute("userName", TrainUtil.getCurrentUserName(req));
        req.setAttribute("userProfile", ub);

        RequestDispatcher rd = req.getRequestDispatcher("UserProfile.jsp");
        rd.forward(req, res);
    }
}
