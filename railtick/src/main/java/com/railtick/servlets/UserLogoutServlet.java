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

@WebServlet("/userlogout")
public class UserLogoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter pw = response.getWriter();
		if (TrainUtil.isLoggedIn(request, UserRole.CUSTOMER)) {
			TrainUtil.logout(response);
			RequestDispatcher rd = request.getRequestDispatcher("Login.jsp");
			rd.include(request, response);

		} else {
			RequestDispatcher rd = request.getRequestDispatcher("Login.jsp");
			rd.include(request, response);
		}
	}
}
