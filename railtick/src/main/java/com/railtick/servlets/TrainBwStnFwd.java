//package com.railtick.servlets;
//
//import java.io.IOException;
//
//
//import javax.servlet.RequestDispatcher;
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//import com.railtick.constants.UserRole;
//import com.railtick.entity.TrainUtil;
//
//@WebServlet("/trainbwstnfwd")
//public class TrainBwStnFwd extends HttpServlet {
//	private static final long serialVersionUID = 1L;
//       
//
//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		TrainUtil.validateUserAuthorization(request, UserRole.CUSTOMER);
//
//		RequestDispatcher rd = request.getRequestDispatcher("TrainBwStn.jsp");
//		rd.forward(request, response);
//	}
//
//}