package com.railtick.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.railtick.beans.TrainBean;
import com.railtick.beans.TrainException;
import com.railtick.constants.UserRole;
import com.railtick.service.TrainService;
import com.railtick.serviceimpl.TrainServiceImpl;
import com.railtick.entity.TrainUtil;

@WebServlet("/viewadmin")
public class AdminViewLinkFwd extends HttpServlet {
	private static final long serialVersionUID = 1L;
	TrainService trainService = new TrainServiceImpl();

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		res.setContentType("text/html");
		PrintWriter pw = res.getWriter();
		TrainUtil.validateUserAuthorization(req, UserRole.ADMIN);
		try {
			String trainNo = req.getParameter("trainNo");
			TrainBean train = trainService.getTrainById(trainNo);
			if (train != null) {
				RequestDispatcher rd = req.getRequestDispatcher("ViewTrains.jsp");
				rd.include(req, res);
				pw.println("<div class='title'><p class='me'>Selected Train Detail</p></div>");
				pw.println("<div class='content'>" + "<table>" + "<tr><td class='head'>Train Name :</td><td>"
						+ train.getTr_name() + "</td></tr>" + "<tr><td class='head'>Train Number :</td><td>"
						+ train.getTr_no() + "</td></tr>" + "<tr><td class='head'>From Station :</td><td>"
						+ train.getFrom_stn() + "</td></tr>" + "<tr><td class='head'>To Station :</td><td>"
						+ train.getTo_stn() + "</td></tr>" + "<tr><td class='head'>Available Seats:</td><td>"
						+ train.getSeats() + "</td></tr>" + "<tr><td class='head'>Fare (INR) :</td><td>"
						+ train.getFare() + " RS</td></tr>" + "</table>" + "</div>");
				pw.println(
						"<div class='content' style='text-align: center;'><form><input type='button' class='goback-btn' value='Go Back' onclick='history.back()'></form></div>");

			} else {
				RequestDispatcher rd = req.getRequestDispatcher("AdminSearchTrains.jsp");
				rd.include(req, res);
				pw.println("<div class='content'><p class='error-message'>Train No." + req.getParameter("trainnumber")
						+ " is Not Available !</p></div>");
				pw.println(
						"<div class='content'><form><input type='button' class='goback-btn' value='Go Back' onclick='history.back()'></form></div>");
			}
		} catch (Exception e) {
			throw new TrainException(422, this.getClass().getName() + "_FAILED", e.getMessage());

		}

	}

}
