package com.railtick.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.railtick.beans.TrainException;
import com.railtick.beans.UserBean;
import com.railtick.entity.TrainUtil;
import com.railtick.service.UserService;
import com.railtick.serviceimpl.UserServiceImpl;
import com.railtick.constants.UserRole;

@WebServlet("/updateuserprofile")
public class UpdateUserProfile extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserService userService = new UserServiceImpl(UserRole.CUSTOMER);

    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        res.setContentType("text/html");

        TrainUtil.validateUserAuthorization(req, UserRole.CUSTOMER);

        UserBean ub = TrainUtil.getCurrentCustomer(req);

        String fName = req.getParameter("firstname");
        String lName = req.getParameter("lastname");
        String addR = req.getParameter("address");
        long phNo = Long.parseLong(req.getParameter("phone"));
        String mailId = req.getParameter("mail");

        ub.setFName(fName);
        ub.setLName(lName);
        ub.setAddr(addR);
        ub.setPhNo(phNo);
        ub.setMailId(mailId);

        try {
            String message = userService.updateUser(ub);
            req.setAttribute("updateMessage", message);

            RequestDispatcher rd = req.getRequestDispatcher("HomePage.jsp");
            rd.forward(req, res);
        } catch (Exception e) {
            throw new TrainException(422, this.getClass().getName() + "_FAILED", e.getMessage());
        }
    }
}
