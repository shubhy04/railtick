package com.railtick.servlets;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;

import com.razorpay.Order;
import com.razorpay.RazorpayClient;
import com.railtick.beans.TrainBean;
import com.railtick.beans.TrainException;
import com.railtick.constants.ResponseCode;
import com.railtick.constants.UserRole;
import com.railtick.entity.DatabaseConnection;
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

                if (seat > avail) {
                    pw.println("<div class='tab'><p1 class='menu red'>Only " + avail
                            + " Seats are Available in this Train!</p1></div>");
                } else {
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
                    String responseCode = trainService.updateTrain(train);
                    if (ResponseCode.SUCCESS.toString().equalsIgnoreCase(responseCode)) {
                        String content = "<div class='tab'>" + "<p class='menu'>" + "<table>"
                                + "</td></tr><tr><td>Train Name: </td><td>" + train.getTr_name()
                                + "</td><td>Train No: </td><td>" + train.getTr_no()
                                + "</td></tr><tr><td>Booked From: </td><td>" + train.getFrom_stn()
                                + "</td><td>To Station: </td><td>" + train.getTo_stn() + "</td></tr>"
                                + "<tr><td>Date Of Journey:</td><td>" + date
                                + "<tr><td>Berth:</td><td>" + Berth
                                + "</td><td>Time(HH:MM):</td><td>11:23</td></tr><tr><td>Seats: </td><td>"
                                + train.getSeats() + "</td><td>Class: </td><td>" + seatClass + "</td></tr>"
                                + "</td><td>Amount:</td><td>&#8377; " + totalAmount + "</td></tr>" + "</table>"
                                + "</p></div>";
                        req.getSession().setAttribute("content", content);
                        req.getSession().setAttribute("responseCode", responseCode);

                        // Store totalAmount in the session for use in Payment.jsp
                        req.getSession().setAttribute("totalAmount", totalAmount);

                        // Initialize Razorpay client
                        RazorpayClient razorpay = new RazorpayClient("rzp_test_LSfhbrTgIOlWn2", "gGenJAHiwaWcS261meEZa5kK");

                        // Create a Razorpay order
                        JSONObject orderRequest = new JSONObject();
                        orderRequest.put("amount", totalAmount * 100); // Amount in paise
                        orderRequest.put("currency", "INR");
                        orderRequest.put("payment_capture", 1);

                        Order order = razorpay.Orders.create(orderRequest);

                        // Extract Razorpay order ID
                        String razorpayOrderId = order.get("id");

                        // Store Razorpay order ID in the session for verification during payment success callback
                        req.getSession().setAttribute("razorpayOrderId", razorpayOrderId);

                        // Save payment details in the database
                        String razorpayPaymentId = req.getParameter("razorpay_payment_id");
                        String razorpaySignature = req.getParameter("razorpay_signature");
                        savePaymentDetails(razorpayOrderId, razorpayPaymentId, razorpaySignature, totalAmount);

                        // Redirect to the Razorpay payment page
                        String redirectUrl = "Payment.jsp";
                        res.sendRedirect(redirectUrl);
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

    private void savePaymentDetails(String razorpayOrderId, String razorpayPaymentId, String razorpaySignature, Long totalAmount) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;

        try {
            connection = DatabaseConnection.getConnection();

            // Insert payment details into the database
            String insertQuery = "INSERT INTO PAYMENTS (razorpay_order_id, razorpay_payment_id, razorpay_signature, amount, payment_date) VALUES (?, ?, ?, ?, SYSDATE)";
            preparedStatement = connection.prepareStatement(insertQuery);
            preparedStatement.setString(1, razorpayOrderId);
            preparedStatement.setString(2, razorpayPaymentId);
            preparedStatement.setString(3, razorpaySignature);
            preparedStatement.setLong(4, totalAmount);

            int rowsAffected = preparedStatement.executeUpdate();

            if (rowsAffected > 0) {
                System.out.println("Payment details saved in the database successfully!");
            } else {
                System.out.println("Failed to save payment details in the database.");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DatabaseConnection.closeResources(connection, preparedStatement);
        }
    }
}
