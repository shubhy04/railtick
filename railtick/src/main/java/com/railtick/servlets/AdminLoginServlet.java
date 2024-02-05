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



@WebServlet("/AdminLoginServlet")
public class AdminLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		PrintWriter pw = res.getWriter();
		res.setContentType("text/html");
		String Email = req.getParameter("email");
		String Pass = req.getParameter("pass");
		try {
			String message = TrainUtil.login(req, res, UserRole.ADMIN, Email, Pass);
			if ("SUCCESS".equalsIgnoreCase(message)) {
				RequestDispatcher rd = req.getRequestDispatcher("AdminHomePage.jsp");
				rd.include(req, res);				
				pw.println("welcome" + Email);
			} else {
				RequestDispatcher rd = req.getRequestDispatcher("AdminLogin.jsp");
				rd.include(req, res);
				pw.println(message);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
}
