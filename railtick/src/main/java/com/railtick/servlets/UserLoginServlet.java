package com.railtick.servlets;

import java.io.IOException;

import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.railtick.constants.ResponseCode;
import com.railtick.constants.UserRole;
import com.railtick.entity.TrainUtil;

@WebServlet("/userlogin")
public class UserLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		PrintWriter pw = res.getWriter();
		res.setContentType("text/html");
		String uName = req.getParameter("uname");
		String pWord = req.getParameter("pword");

		String responseMsg = TrainUtil.login(req, res, UserRole.CUSTOMER, uName, pWord);
		if (ResponseCode.SUCCESS.toString().equalsIgnoreCase(responseMsg)) {
			req.setAttribute("successMessage", "Login successful. Welcome, " + uName + "!");
			RequestDispatcher rd = req.getRequestDispatcher("HomePage.jsp");
			rd.include(req, res);
						
		} else {
			req.setAttribute("errorMessage", "Invalid username or password. Please try again.");
			RequestDispatcher rd = req.getRequestDispatcher("Login.jsp");
			rd.include(req, res);
		

		}

	}
}
