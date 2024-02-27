package com.railtick.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.railtick.constants.UserRole;
import com.railtick.entity.TrainUtil;

@WebServlet("/adminsearchtrainfwd")
public class AdminSearchTrainFwd extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		res.setContentType("text/html");
		TrainUtil.validateUserAuthorization(req, UserRole.ADMIN);
		RequestDispatcher rd = req.getRequestDispatcher("AdminSearchTrain.jsp");
		rd.forward(req, res);

	}

}
