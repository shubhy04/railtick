package com.railtick.servlets;

import java.io.IOException;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalTime;

import javax.servlet.RequestDispatcher;
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
		sct.setAttribute("berth", Berth);;

		try {
			SimpleDateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd");
			SimpleDateFormat outputFormat = new SimpleDateFormat("dd-MMM-yyyy");
			java.util.Date utilDate;
			String date = LocalDate.now().toString();
			String time = LocalTime.now().toString();
			utilDate = inputFormat.parse(journeyDate);
			date = outputFormat.format(utilDate);

			TrainBean train = trainService.getTrainById(trainNo);
			TrainBean fare = trainService.getFareDetails(trainNo);
			BookingStatus bookingStatus = getBookingStatus(train, seat);

			if (train != null && fare != null) {
				int avail = train.getSeats();
				

				if (bookingStatus == BookingStatus.NOT_AVAILABLE) {
				    pw.println("<div class='tab'><p1 class='menu red'>Booking not available for the requested seats in this Train!</p1></div>");
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
						String content = "<table class= 'table table-bordered'>"
								+ "<tr><th>Train Name: </th><td>" + train.getTr_name()+ "</td>" 
								+ "<th>Train No: </th><td>" + train.getTr_no() 
								+ "</td></tr><tr><th>Booked From: </th><td>" + train.getFrom_stn()
								+ "</td><th>To Station: </th><td>" + train.getTo_stn() + "</td></tr>"
								+ "<tr><th>Booking Status: </th><td style='color: "
								+ getBookingStatus(train, seat).getColor() + "'>"
								+ getBookingStatus(train, seat).getStatus() + "</td>"
								+ "<th>Date Of Journey:</th><td>" + date + "</td></tr><tr><th>Berth:</th><td>" + Berth
								+ "</td><th>Time(HH:MM):</th><td>"+ time +"</td></tr><tr><th>Seats: </th><td>"
								+ train.getSeats() + "</td><th>Class: </th><td>" + seatClass + "</td></tr>"
								
								+ "</td><th colspan='2' class='text-center'>Amount:</th><td colspan='4' class='text-center amount-value'>&#8377; " + totalAmount + "</td></tr>" + "</table>"
								;
						req.getSession().setAttribute("content", content);
						req.getSession().setAttribute("responseCode", responseCode);

						
						req.setAttribute("bookingStatus", bookingStatus);

						req.getSession().setAttribute("totalAmount", totalAmount);

						// Initialize Razorpay client
						RazorpayClient razorpay = new RazorpayClient("rzp_test_LSfhbrTgIOlWn2",
								"gGenJAHiwaWcS261meEZa5kK");

						// Create a Razorpay order
						JSONObject orderRequest = new JSONObject();
						orderRequest.put("amount", totalAmount * 100); // Amount in paise
						orderRequest.put("currency", "INR");
						orderRequest.put("receipt", "txn_123456");
						orderRequest.put("payment_capture", 1);

						Order order = razorpay.orders.create(orderRequest);

						// Extract Razorpay order ID
						String razorpayOrderId = order.get("id");

						// Store Razorpay order ID in the session for verification during payment
						// success callback
						req.getSession().setAttribute("razorpayOrderId", razorpayOrderId);

						// Redirect to the Razorpay payment page
						String redirectUrl = "Payment.jsp";
						res.sendRedirect(redirectUrl);
					} else {
						pw.println(
								"<div class='tab'><p1 class='menu red'>Transaction Declined. Try Again !</p1></div>");
					}
				}
			} else {
				pw.println("<div class='tab'><p1 class='menu'>Invalid Train Number or Fare Details!</p1></div>");
			}
		} catch (Exception e) {
			throw new TrainException(422, this.getClass().getName() + "_FAILED", e.getMessage());
		}

		RequestDispatcher rd = req.getRequestDispatcher("Reciept.jsp");
		rd.include(req, res);

		sct.removeAttribute("seat");
		sct.removeAttribute("trainNo");
		sct.removeAttribute("journeyDate");
	}

	private BookingStatus getBookingStatus(TrainBean train, int bookedSeats) {
		int availableSeats = train.getSeats();
		int racThreshold = 10; // Set your RAC threshold as needed
		int waitingListLimit = 15; // Set your waiting list limit as needed

		if (availableSeats >= bookedSeats) {
			return BookingStatus.AVAILABLE;
		} else {
			int remainingSeats = availableSeats;

			if (remainingSeats >= bookedSeats) {
				return BookingStatus.AVAILABLE;
			} else if (remainingSeats + racThreshold >= bookedSeats) {
				return BookingStatus.RAC;
			} else if (remainingSeats + racThreshold + waitingListLimit >= bookedSeats) {
				return BookingStatus.WAITING_LIST;
			} else {
				return BookingStatus.NOT_AVAILABLE;
			}
		}
	}

	private enum BookingStatus {
		AVAILABLE("Available", "green"), RAC("RAC", "orange"), WAITING_LIST("Waiting List", "red"),
		NOT_AVAILABLE("Not Available", "gray");

		private final String status;
		private final String color;

		BookingStatus(String status, String color) {
			this.status = status;
			this.color = color;
		}

		public String getStatus() {
			return status;
		}

		public String getColor() {
			return color;
		}
	}
}
