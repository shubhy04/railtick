package com.railtick.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.railtick.beans.UserBean;
import com.railtick.constants.UserRole;
import com.railtick.entity.TrainUtil;

@WebServlet("/edituserprofile")
public class EditUserProfile extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        TrainUtil.validateUserAuthorization(req, UserRole.CUSTOMER);

        UserBean ub = TrainUtil.getCurrentCustomer(req);
        req.setAttribute("username", ub.getMailId());
        req.setAttribute("firstname", ub.getFName());
        req.setAttribute("lastname", ub.getLName());
        req.setAttribute("address", ub.getAddr());
        req.setAttribute("phone", ub.getPhNo());

        RequestDispatcher rd = req.getRequestDispatcher("UpdateProfile.jsp");
        rd.forward(req, res);
    }
}
