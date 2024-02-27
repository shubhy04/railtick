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
import com.railtick.service.TrainService;
import com.railtick.serviceimpl.TrainServiceImpl;

/**
 * Servlet implementation class UpdateTrainSchedule
 */
@WebServlet("/updatetrainschedule")
public class UpdateTrainSchedule extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private TrainService trainService = new TrainServiceImpl();

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		res.setContentType("text/html");
		PrintWriter pw = res.getWriter();

		try {

			TrainBean train = new TrainBean();
			train.setTr_no(Long.parseLong(req.getParameter("trainno")));
			train.setTr_name(req.getParameter("trainname"));
			train.setFrom_stn(req.getParameter("fromstation"));
			train.setTo_stn(req.getParameter("tostation"));
			train.setSeats(Integer.parseInt(req.getParameter("available")));
			train.setFare(Double.parseDouble(req.getParameter("fare")));

			String message = trainService.updateTrain(train);
			if ("SUCCESS".equalsIgnoreCase(message)) {
				RequestDispatcher rd = req.getRequestDispatcher("AdminUpdateTrain.jsp");
				rd.include(req, res);
				pw.println("<div class='tab'><p1 class='menu'>Train Updated Successfully!</p1></div>");
			} else {
				RequestDispatcher rd = req.getRequestDispatcher("AdminUpdateTrain.jsp");
				rd.include(req, res);
				pw.println("<div class='tab'><p1 class='menu'>Error in filling the train Detail</p1></div>");
			}
		} catch (Exception e) {
			throw new TrainException(422, this.getClass().getName() + "_FAILED", e.getMessage());
		}

	}

}
