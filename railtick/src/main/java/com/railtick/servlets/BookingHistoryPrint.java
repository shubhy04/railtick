package com.railtick.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.railtick.beans.TrainBean;
import com.railtick.service.TrainService;
import com.railtick.serviceimpl.TrainServiceImpl;

@WebServlet("/printticketdetails")
public class BookingHistoryPrint extends HttpServlet {
    private static final long serialVersionUID = 1L;

    TrainService trainService = new TrainServiceImpl();

    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        res.setContentType("text/html");
        PrintWriter pw = res.getWriter();
        ServletContext sct = req.getServletContext();

        try {
            // Get the train number from the request parameter
        	 String trainNo = (String) sct.getAttribute("trainnumber");

            // Retrieve train details based on the train number
            TrainBean train = trainService.getTrainById(trainNo);

            // Display train details
            pw.println("<html><head><title>Train Details</title></head><body>");
            pw.println("<h2>Train Details</h2>");

            if (train != null) {
                pw.println("<p>Train Number: " + train.getTr_no() + "</p>");
                pw.println("<p>Train Name: " + train.getTr_name() + "</p>");
                pw.println("<p>From Station: " + train.getFrom_stn() + "</p>");
                pw.println("<p>To Station: " + train.getTo_stn() + "</p>");
                pw.println("<p>Departure Time: " + train.getSeats() + "</p>");
                // Add more details as needed
            } else {
                pw.println("<p>Train details not found</p>");
            }

            pw.println("</body></html>");
        } catch (Exception e) {
            e.printStackTrace(); // Handle the exception appropriately
            pw.println("<p>Error retrieving train details</p>");
        }
    }
}
