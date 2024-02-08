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
		String uName = req.getParameter("uname");
		String pWord = req.getParameter("pword");
		try {
			String message = TrainUtil.login(req, res, UserRole.ADMIN, uName, pWord);
			if ("SUCCESS".equalsIgnoreCase(message)) {
				RequestDispatcher rd = req.getRequestDispatcher("AdminHomePage.jsp");
				rd.include(req, res);
				pw.println("<div class='login-section'><p class='error-message'>Hello, " + uName + " ! Welcome </p></div>");
				pw.println("<div class='login-section'>Hi ! Here You can Manage Train Information as per Your Requirement</div>");

			} else {
				RequestDispatcher rd = req.getRequestDispatcher("AdminLogin.jsp");
				rd.include(req, res);
				pw.println("<div class='login-section'><p class='error-message'>" + message + "</p></div>");

			}
		} catch (Exception e) {
			throw new TrainException(422, this.getClass().getName() + "_FAILED", e.getMessage());
		}
	}
}
