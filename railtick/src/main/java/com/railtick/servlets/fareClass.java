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
import com.railtick.entity.TrainUtil;
import com.railtick.service.TrainService;
import com.railtick.serviceimpl.TrainServiceImpl;

@WebServlet("/fare")
public class fareClass extends HttpServlet {
	private static final long serialVersionUID = 1L;

	TrainService trainService = new TrainServiceImpl();

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		res.setContentType("text/html");
		PrintWriter pw = res.getWriter();
		TrainUtil.validateUserAuthorization(req, UserRole.CUSTOMER);

		try {
			String trainNo = req.getParameter("trainNo");
			TrainBean train = trainService.getFareDetails(trainNo);
			if (train != null) {
				RequestDispatcher rd = req.getRequestDispatcher("FareDisplay.jsp");
				rd.include(req, res);
				pw.println("<div class='main'><p1 class='menu'>Fare Detail</p1></div>");
				pw.println("<div class='tab'>" + "<table>" + "<tr><td class='blue'>Train Number :</td><td>"
						+ train.getTr_no() + "</td></tr>" + "<tr><td class='blue'>Sleeper:</td><td>"
						+ train.getSleeper() + "</td></tr>" + "<tr><td class='blue'>General:</td><td>"
						+ train.getGeneral() + "</td></tr>" + "<tr><td class='blue'>Ac Tier :</td><td>"
						+ train.getAc_tier() + "</td></tr>" + "<tr><td class='blue'>Ac 2 Tier :</td><td>"
						+ train.getAc_2_tier() + "</td></tr>" + "</table>" + "</div>");
			} else {
				RequestDispatcher rd = req.getRequestDispatcher("FareDisplay.jsp");
				rd.include(req, res);
				pw.println("<div class='tab'><p1 class='menu'>Train No." + req.getParameter("trainnumber")
						+ " is Not Available !</p1></div>");
			}
		} catch (Exception e) {
			throw new TrainException(422, this.getClass().getName() + "_FAILED", e.getMessage());
		}

	}

}
