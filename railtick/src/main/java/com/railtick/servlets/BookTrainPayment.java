package com.railtick.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.time.LocalDate;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.railtick.beans.TrainBean;
import com.railtick.beans.TrainException;
import com.railtick.constants.ResponseCode;
import com.railtick.constants.UserRole;
import com.railtick.entity.TrainUtil;
import com.railtick.service.TrainService;
import com.railtick.serviceimpl.TrainServiceImpl;

@WebServlet("/payment")
public class BookTrainPayment extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private TrainService trainService = new TrainServiceImpl();

    public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
        res.setContentType("text/html");
        TrainUtil.validateUserAuthorization(req, UserRole.CUSTOMER);
        PrintWriter pw = res.getWriter();
        int seat = Integer.parseInt(req.getParameter("seats"));
        String trainNo = req.getParameter("trainnumber");
        String journeyDate = req.getParameter("journeydate");
        String seatClass = req.getParameter("class");
        String Berth = req.getParameter("berth");

        ServletContext sct = req.getServletContext();
        sct.setAttribute("seats", seat);
        sct.setAttribute("trainnumber", trainNo);
        sct.setAttribute("journeydate", journeyDate);
        sct.setAttribute("class", seatClass);
        sct.setAttribute("berth", Berth);

        try {
            SimpleDateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd");
            SimpleDateFormat outputFormat = new SimpleDateFormat("dd-MMM-yyyy");
            java.util.Date utilDate;
            String date = LocalDate.now().toString();
            utilDate = inputFormat.parse(journeyDate);
            date = outputFormat.format(utilDate);

            TrainBean train = trainService.getTrainById(trainNo);
            TrainBean fare = trainService.getFareDetails(trainNo);

            if (train != null && fare != null) {
                int avail = train.getSeats();
//                if (seat > avail) {
//                    pw.println("<div class='tab'><p1 class='menu red'>Only " + avail
//                            + " Seats are Available in this Train!</p1></div>");
//                }
//                
//                else
                	
                	if (seat > avail || seat <= avail) {
                    avail = avail - seat;

                    Long classFare = 0L;
                    switch (seatClass) {
                        case "Second Sitting(2S)":
                            classFare = fare.getGeneral();
                            break;
                        case "Sleeper(SL)":
                            classFare = fare.getSleeper();
                            break;
                        case "AC First Class(1A)":
                            classFare = fare.getAc_tier();
                            break;
                        case "AC 2 Tier(2A)":
                            classFare = fare.getAc_2_tier();
                            break;
                        default:
                            pw.println("<div class='tab'><p1 class='menu red'>Invalid Seat Class!</p1></div>");
                            return;
                    }

                    Long totalAmount = classFare * seat;

                    //train.setSeats(avail);
                    String responseCode = trainService.updateTrain(train);
                    if (ResponseCode.SUCCESS.toString().equalsIgnoreCase(responseCode)) {
                        pw.println("<div class='tab'>" + "<p class='menu'>" + "<table>"
                                + "</td></tr><tr><td>Train Name: </td><td>" + train.getTr_name()
                                + "</td><td>Train No: </td><td>" + train.getTr_no()
                                + "</td></tr><tr><td>Booked From: </td><td>" + train.getFrom_stn()
                                + "</td><td>To Station: </td><td>" + train.getTo_stn() + "</td></tr>"
                                + "<tr><td>Date Of Journey:</td><td>" + date
                                + "<tr><td>Berth:</td><td>" + Berth
                                + "</td><td>Time(HH:MM):</td><td>11:23</td></tr><tr><td>Seats: </td><td>"
                                + train.getSeats() + "</td><td>Class: </td><td>" + seatClass + "</td></tr>"
                                + "</td><td>Amount:</td><td>&#8377; " + totalAmount + "</td></tr>" + "</table>"
                                + "</p></div>");
                        pw.println("<button onclick=" + "location.href='Payment.jsp'>" + "Start Booking</button>");

                    } else {
                        pw.println("<div class='tab'><p1 class='menu red'>Transaction Declined. Try Again !</p1></div>");
                    }
                }
            } else {
                pw.println("<div class='tab'><p1 class='menu'>Invalid Train Number or Fare Details!</p1></div>");
            }

        } catch (Exception e) {
            throw new TrainException(422, this.getClass().getName() + "_FAILED", e.getMessage());
        }

        sct.removeAttribute("seat");
        sct.removeAttribute("trainNo");
        sct.removeAttribute("journeyDate");
    }
}
