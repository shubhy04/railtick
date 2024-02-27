package com.railtick.servlets;

import java.io.IOException;

import java.io.PrintWriter;
import java.util.List;

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

@WebServlet("/adminviewtrainfwd")
public class AdminViewTrainFwd extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private TrainService trainService = new TrainServiceImpl();

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		res.setContentType("text/html");
		PrintWriter pw = res.getWriter();
		TrainUtil.validateUserAuthorization(req, UserRole.ADMIN);
		try {
			List<TrainBean> trains = trainService.getAllTrains();
			if (trains != null && !trains.isEmpty()) {
				RequestDispatcher rd = req.getRequestDispatcher("ViewTrains.jsp");
				rd.include(req, res);
				pw.println("<div class='title'><p class='me'>Running Trains</p></div>");
				pw.println("<div class='content'><table><tr><th>Train Name</th><th>Train Number</th>"
						+ "<th>From Station</th><th>To Station</th><th>Seats Available</th><th>Fare (INR)</th><th>Action</th></tr>");

				for (TrainBean train : trains) {

					pw.println("" + "<tr> " + "" + "<td><a href='viewadmin?trainNo=" + train.getTr_no() + "&fromStn="
							+ train.getFrom_stn() + "&toStn=" + train.getTo_stn() + "'>" + train.getTr_name()
							+ "</a></td>" + "<td>" + train.getTr_no() + "</td>" + "<td>" + train.getFrom_stn() + "</td>"
							+ "<td>" + train.getTo_stn() + "</td>" + "<td>" + train.getSeats() + "</td>" + "<td>"
							+ train.getFare() + " RS</td>" + "<td><a href='adminupdatetrain?trainnumber="
							+ train.getTr_no() + "'>Update</a></td>" + "</tr>");
				}
				pw.println("</table></div>");
				pw.println(
						"<div class='content' style='text-align: center;'><form><input type='button' class='goback-btn' value='Home Page' onclick='history.back()'></form></div>");
			} else {
				RequestDispatcher rd = req.getRequestDispatcher("ViewTrains.jsp");
				rd.include(req, res);
				pw.println("<div class='title'><p class='error-message'> No Running Trains</p></div>");
				pw.println(
						"<div class='content' style='text-align: center;'><form><input type='button' class='goback-btn' value='Home Page' onclick='history.back()'></form></div>");
			}
		} catch (Exception e) {
			throw new TrainException(422, this.getClass().getName() + "_FAILED", e.getMessage());

		}

	}

}
