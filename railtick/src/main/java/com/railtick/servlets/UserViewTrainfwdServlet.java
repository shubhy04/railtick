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
                RequestDispatcher rd = req.getRequestDispatcher("UserViewTrains.jsp");
                rd.include(req, res);

                pw.println("<div class='main'><p1 class='menu'>Running Trains</p1></div>");
                pw.println("<div class='tab'><table><tr><th>Train Name</th><th>Train Number</th>"
                        + "<th>From Station</th><th>To Station</th><th>Time</th><th>Seats Available</th><th>Fare (INR)</th><th>Booking</th></tr>");

                for (TrainBean train : trains) {
                    int hr = (int) (Math.random() * 24);
                    int min = (int) (Math.random() * 60);
                    String time = (hr < 10 ? ("0" + hr) : hr) + ":" + ((min < 10) ? "0" + min : min);

                    pw.println("<tr>"
                            + "<td><a href='view?trainNo=" + train.getTr_no() + "&fromStn=" + train.getFrom_stn()
                            + "&toStn=" + train.getTo_stn() + "'>" + train.getTr_name() + "</a></td>"
                            + "<td>" + train.getTr_no() + "</td>"
                            + "<td>" + train.getFrom_stn() + "</td>"
                            + "<td>" + train.getTo_stn() + "</td>"
                            + "<td>" + time + "</td>"
                            + "<td>" + train.getSeats() + "</td>"
                            + "<td><a href='fare?trainNo=" + train.getTr_no()
                            + "&fromStn=" + train.getFrom_stn() + "&toStn=" + train.getTo_stn()
                            + "'><div class='red'>See fare</div></a></td>"
                            + "<td><a href='booktrainbyref?trainNo=" + train.getTr_no()
                            + "&fromStn=" + train.getFrom_stn() + "&toStn=" + train.getTo_stn()
                            + "'><div class='red'>Book Now</div></a></td>"
                            + "</tr>");
                }
                pw.println("</table></div>");
            } else {
                RequestDispatcher rd = req.getRequestDispatcher("UserViewTrains.jsp");
                rd.include(req, res);
                pw.println("<div class='main'><p1 class='menu red'> No Running Trains</p1></div>");
            }
        } catch (Exception e) {
            throw new TrainException(422, this.getClass().getName() + "_FAILED", e.getMessage());
        }
    }
}
