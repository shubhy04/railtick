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

@WebServlet("/searchtrainservlet")
public class UserSearchTrain extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private TrainService trainService = new TrainServiceImpl();

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		res.setContentType("text/html");
		PrintWriter pw = res.getWriter();

	//	TrainUtil.validateUserAuthorization(req, UserRole.CUSTOMER);

		try {

			String trainNo = req.getParameter("trainnumber");
			TrainBean train = trainService.getTrainById(trainNo);
			if (train != null) {
				int hr = (int) (Math.random() * 24);
                int min = (int) (Math.random() * 60);
                String time = (hr < 10 ? ("0" + hr) : hr) + ":" + ((min < 10) ? "0" + min : min);
				req.setAttribute("trainData", train);  // Set train data as attribute
				req.setAttribute("time", time);
				RequestDispatcher rd = req.getRequestDispatcher("TrainDisplay.jsp");
				rd.include(req, res);
				
				
			} else {
				req.setAttribute("errorMessage","Train No." + trainNo + " is Not Available !");
        	    RequestDispatcher rd = req.getRequestDispatcher("SearchTrains.jsp");
        	    rd.include(req, res);
			}
		} catch (Exception e) {
			throw new TrainException(422, this.getClass().getName() + "_FAILED", e.getMessage());
		}

	}

}
