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
		RequestDispatcher rd = req.getRequestDispatcher("UserProfile.jsp");
		rd.include(req, res);
		pw.println("<div class='tab'>" + "		<p1 class='menu'>" + "	Hello " + TrainUtil.getCurrentUserName(req)
				+ " ! Welcome to our new Railtick Website" + "		</p1>" + "	</div>");
		pw.println("<div class='main'><p1 class='menu'><a href='viewuserprofile'>View Profile</a></p1>&nbsp;"
				+ "<p1 class='menu'><a href='edituserprofile'>Edit Profile</a></p1>&nbsp;"
				+ "<p1 class='menu'><a href='changeuserpassword'>Change Password</a></p1>" + "</div>");
		pw.println("<div class='tab'>Users Profile View</div>");
		pw.println("<div class='tab'>" + "<table>" + "<tr><td>User Name :</td><td>" + ub.getMailId() + "</td></tr>"
				+ "</td></tr>" + "<tr><td>First Name :</td><td>" + ub.getFName() + "</td></tr>"
				+ "<tr><td>Last Name :</td><td>" + ub.getLName() + "</td></tr>" + "<tr><td>Address :</td><td>"
				+ ub.getAddr() + "</td></tr>" + "<tr><td>Phone No:</td><td>" + ub.getPhNo() + "</td></tr>"
				+ "<tr><td>Mail Id :</td><td>" + ub.getMailId() + "</td></tr>" + "</table>" + "</div>");

	}
}
