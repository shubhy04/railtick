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
import com.railtick.entity.TrainUtil;
import com.railtick.service.TrainService;
import com.railtick.serviceimpl.TrainServiceImpl;
@WebServlet("/userviewtrainfwd")
public class UserViewTrainfwdServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    TrainService trainService = new TrainServiceImpl();

    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        res.setContentType("text/html");
        PrintWriter pw = res.getWriter();
        TrainUtil.validateUserAuthorization(req, UserRole.CUSTOMER);

        try {
            List<TrainBean> trains = trainService.getAllTrains();
            if (trains != null && !trains.isEmpty()) {
            	int hr = (int) (Math.random() * 24);
                int min = (int) (Math.random() * 60);
                String time = (hr < 10 ? ("0" + hr) : hr) + ":" + ((min < 10) ? "0" + min : min);
                req.setAttribute("trains", trains);
                req.setAttribute("time", time);
                RequestDispatcher rd = req.getRequestDispatcher("AllTrainsDisplay.jsp");
                rd.forward(req, res);
            } else {
                RequestDispatcher rd = req.getRequestDispatcher("AllTrainsDisplay.jsp");
                rd.forward(req, res);
                pw.println("<div class='error-message'><p1 class='err'> No Running Trains</p1></div>");
            }
        } catch (Exception e) {
            throw new TrainException(422, this.getClass().getName() + "_FAILED", e.getMessage());
        }
    }
}
