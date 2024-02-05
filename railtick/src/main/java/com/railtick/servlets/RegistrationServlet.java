package com.railtick.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.railtick.beans.UserBean;
import com.railtick.entity.DatabaseConnection;

@WebServlet("/RegistrationServlet")
public class RegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection con = null;

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		res.setContentType("text/html");
		PrintWriter pw = res.getWriter();
		RequestDispatcher dispatcher = null;
		UserBean user = null;

		try {
			user = new UserBean();
			user.setFname(req.getParameter("fname"));
			user.setLname(req.getParameter("lname"));
			user.setEmailID(req.getParameter("email"));
			user.setPass(req.getParameter("pass"));
			user.setPhno(Long.parseLong(req.getParameter("phno")));
			user.setGender(req.getParameter("gender"));
			user.setAddress(req.getParameter("address"));
			user.setRePass(req.getParameter("repass"));

			// Start of server-side validation
			if (user.getFname() == null || user.getFname().equals("")) {
				req.setAttribute("status", "invalidFname");
				dispatcher = req.getRequestDispatcher("Register.jsp");
				dispatcher.forward(req, res);
			}
			if (user.getLname() == null || user.getLname().equals("")) {
				req.setAttribute("status", "invalidLname");
				dispatcher = req.getRequestDispatcher("Register.jsp");
				dispatcher.forward(req, res);
			}
			if (user.getEmailID() == null || user.getEmailID().equals("")) {
				req.setAttribute("status", "invalidEmail");
				dispatcher = req.getRequestDispatcher("Register.jsp");
				dispatcher.forward(req, res);
			}
			if (user.getPass() == null || user.getPass().equals("")) {
				req.setAttribute("status", "invalidPass");
				dispatcher = req.getRequestDispatcher("Register.jsp");
				dispatcher.forward(req, res);
			}
			if (!user.getPass().equals(user.getRePass())) {
				req.setAttribute("status", "invalidRePass");
				dispatcher = req.getRequestDispatcher("Register.jsp");
				dispatcher.forward(req, res);
			}
			if (user.getPhno() < 10) {
				req.setAttribute("status", "invalidPhno");
				dispatcher = req.getRequestDispatcher("Register.jsp");
				dispatcher.forward(req, res);
			}
			if (user.getGender() == null || user.getGender().equals("")) {
				req.setAttribute("status", "invalidGender");
				dispatcher = req.getRequestDispatcher("Register.jsp");
				dispatcher.forward(req, res);
			}
			if (user.getAddress() == null || user.getAddress().equals("")) {
				req.setAttribute("status", "invalidAddress");
				dispatcher = req.getRequestDispatcher("Register.jsp");
				dispatcher.forward(req, res);
			}
			// End of server-side validation

			try {
				String query = "INSERT INTO CUSTOMER VALUES(?,?,?,?,?,?,?)";
				Connection con = DatabaseConnection.getConnection();
				PreparedStatement ps = con.prepareStatement(query);
				ps.setString(1, user.getFname());
				ps.setString(2, user.getLname());
				ps.setString(3, user.getEmailID());
				ps.setString(4, user.getPass());
				ps.setLong(5, user.getPhno());
				ps.setString(6, user.getGender());
				ps.setString(7, user.getAddress());
				int rowCount = ps.executeUpdate();
				dispatcher = req.getRequestDispatcher("Register.jsp");
				if (rowCount > 0) {
					req.setAttribute("status", "success");
				} else {
					req.setAttribute("status", "failed");
				}
				dispatcher.forward(req, res);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} finally {
			try {
				con.close();
			} catch (SQLException e) {

				e.printStackTrace();
			}
		}

	}
}
