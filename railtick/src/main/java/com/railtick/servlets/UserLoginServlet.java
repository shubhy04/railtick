package com.railtick.servlets;

import java.io.IOException;

import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.railtick.constants.ResponseCode;
import com.railtick.constants.UserRole;
import com.railtick.entity.TrainUtil;



@WebServlet("/UserLoginServlet")
public class UserLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		PrintWriter pw = res.getWriter();
		res.setContentType("text/html");
		String Email = req.getParameter("email");
		String Pass = req.getParameter("pass");

		String Remessage = TrainUtil.login(req, res, UserRole.CUSTOMER, Email, Pass);
		if (ResponseCode.SUCCESS.toString().equalsIgnoreCase(Remessage)) {
			RequestDispatcher rd = req.getRequestDispatcher("HomePage.jsp");
			rd.include(req, res);
			pw.println("welcome" + Email);
		} else {
			RequestDispatcher rd = req.getRequestDispatcher("Login.jsp");
			rd.include(req, res);
			pw.println(Remessage);
		}

	}
}
