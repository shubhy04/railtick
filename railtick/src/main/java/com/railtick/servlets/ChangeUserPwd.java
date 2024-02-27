package com.railtick.servlets;

import java.io.IOException;
import java.io.PrintWriter;

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

@WebServlet("/changeuserpwd")
public class ChangeUserPwd extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserService userService = new UserServiceImpl(UserRole.CUSTOMER);

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		res.setContentType("text/html");
		PrintWriter pw = res.getWriter();
		UserBean currentUser = TrainUtil.getCurrentCustomer(req);

		try {
			String u_Name = req.getParameter("username");
			String oldPWord = (String) req.getParameter("oldpassword");
			String newPWord = req.getParameter("newpassword");
			if (currentUser.getMailId().equals(u_Name)) {
				if (currentUser.getPWord().equals(oldPWord)) {
					currentUser.setPWord(newPWord);
					String message = userService.updateUser(currentUser);
					if ("SUCCESS".equalsIgnoreCase(message)) {
						RequestDispatcher rd = req.getRequestDispatcher("Login.jsp");
						rd.include(req, res);
						TrainUtil.logout(res);
						pw.println(
								"<div class='tab'>Your Username and Password has Been Updated Successfully<br/>Please Login Again !</div>");
					} else {
						RequestDispatcher rd = req.getRequestDispatcher("UserProfile.jsp");
						rd.include(req, res);
						pw.println("<div class='tab'>" + "		<p1 class='menu'>" + "	Hello " + currentUser.getFName()
								+ " ! Welcome to our new Railtick Website" + "		</p1>" + "	</div>");
						pw.println(
								"<div class='main'><p1 class='menu'><a href='viewuserprofile'>View Profile</a></p1>&nbsp;"
										+ "<p1 class='menu'><a href='edituserprofile'>Edit Profile</a></p1>&nbsp;"
										+ "<p1 class='menu'><a href='changeuserpassword'>Change Password</a></p1>"
										+ "</div>");
						pw.println("<div class='tab'>Invalid Username and Old Password !</div>");
					}
				} else {
					RequestDispatcher rd = req.getRequestDispatcher("UserProfile.jsp");
					rd.include(req, res);
					pw.println("<div class='main'><p1 class='menu'><a href='viewuserprofile'>view Profile</a></p1>"
							+ "<p1 class='menu'><a href='edituserprofile'>Edit Profile</a></p1>"
							+ "<p1 class='menu'><a href='changeuserpassword'>Change Password</a></p1>" + "</div>");
					pw.println("<div class='tab'>Wrong Old PassWord!</div>");
				}
			} else {
				RequestDispatcher rd = req.getRequestDispatcher("UserProfile.jsp");
				rd.include(req, res);
				pw.println("<div class='main'><p1 class='menu'><a href='viewuserprofile'>view Profile</a></p1>"
						+ "<p1 class='menu'><a href='edituserprofile'>Edit Profile</a></p1>"
						+ "<p1 class='menu'><a href='changeuserpassword'>Change Password</a></p1>" + "</div>");
				pw.println("<div class='tab'>Invalid UserName</div>");
			}

		} catch (Exception e) {
			throw new TrainException(422, this.getClass().getName() + "_FAILED", e.getMessage());
		}

	}

}
