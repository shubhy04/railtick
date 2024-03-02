package com.railtick.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.railtick.beans.TrainBean;
import com.railtick.beans.TrainException;
import com.railtick.beans.HistoryBean;
import com.railtick.constants.ResponseCode;
import com.railtick.constants.UserRole;
import com.railtick.service.BookingService;
import com.railtick.service.TrainService;
import com.railtick.serviceimpl.BookingServiceImpl;
import com.railtick.serviceimpl.TrainServiceImpl;
import com.railtick.entity.TrainUtil;

@WebServlet("/booktrains")
public class BookTrains extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private TrainService trainService = new TrainServiceImpl();
	private BookingService bookingService = new BookingServiceImpl();

	private enum BookingStatus {
		CONFIRMED("Confirmed", "green"), RAC("RAC", "orange"), WAITING_LIST("Waiting List", "red"),
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

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		PrintWriter pw = res.getWriter();
		res.setContentType("text/html");
		TrainUtil.validateUserAuthorization(req, UserRole.CUSTOMER);

		RequestDispatcher rd = req.getRequestDispatcher("Reciept.jsp");
		rd.include(req, res);

		ServletContext sct = req.getServletContext();

		try {
			int seat = (int) sct.getAttribute("seats");
			String trainNo = (String) sct.getAttribute("trainnumber");
			String journeyDate = (String) sct.getAttribute("journeydate");
			String seatClass = (String) sct.getAttribute("class");
			String Berth = (String) sct.getAttribute("berth");

			String userMailId = TrainUtil.getCurrentUserEmail(req);

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
//					pw.println("<div class='tab'><p1 class='menu red'>Only " + avail
//							+ " Seats are Available in this Train!</p1></div>");
					avail = avail - seat;
					train.setSeats(avail);

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

					String responseCode = trainService.updateTrain(train);
					if (ResponseCode.SUCCESS.toString().equalsIgnoreCase(responseCode)) {
						String razorpayOrderId = req.getParameter("razorpay_order_id");
						String razorpayPaymentId = req.getParameter("razorpay_payment_id");
						String razorpaySignature = req.getParameter("razorpay_signature");
						HistoryBean bookingDetails = new HistoryBean();
						Double totalAmount = (double) (classFare * seat);
						bookingDetails.setAmount(totalAmount);
						bookingDetails.setFrom_stn(train.getFrom_stn());
						bookingDetails.setTo_stn(train.getTo_stn());
						bookingDetails.setTr_no(trainNo);
						bookingDetails.setSeats(seat);

						bookingDetails.setMailId(userMailId);
						bookingDetails.setDate(date);
						//bookingDetails.setRazorpayOrderId(razorpayOrderId);

						HistoryBean transaction = bookingService.createHistory(bookingDetails, razorpayPaymentId,
								razorpaySignature,razorpayOrderId);

						BookingStatus bookingStatus = getBookingStatus(train, transaction);
						pw.println("<div class='tab'><p class='menu green'>" + seat
								+ " Seats Booked Successfully!<br/><br/> Your Transaction Id is: "
								+ transaction.getTransId() + "</p>" + "</div>");

						// Set ticket details as request attributes
						req.setAttribute("transId", transaction.getTransId());
						req.setAttribute("tr_name", train.getTr_name());
						req.setAttribute("tr_no", transaction.getTr_no());
						req.setAttribute("from_stn", transaction.getFrom_stn());
						req.setAttribute("to_stn", transaction.getTo_stn());
						req.setAttribute("date", transaction.getDate());
						req.setAttribute("berth", Berth);
						req.setAttribute("seats", transaction.getSeats());
						req.setAttribute("class", seatClass);
						req.setAttribute("statusColor", bookingStatus.getColor());
						req.setAttribute("bookingStatus", bookingStatus.getStatus());
						req.setAttribute("amount", transaction.getAmount());

						// Forward the request to the Ticket.jsp page
						RequestDispatcher ticketDispatcher = req.getRequestDispatcher("Ticket.jsp");
						ticketDispatcher.forward(req, res);

					} else {
						pw.println(
								"<div class='tab'><p1 class='menu red'>Transaction Declined. Try Again !</p1></div>");
					}

				} else if (seat <= avail) {
					avail = avail - seat;
					train.setSeats(avail);

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

					String responseCode = trainService.updateTrain(train);
					if (ResponseCode.SUCCESS.toString().equalsIgnoreCase(responseCode)) {
						String razorpayOrderId = req.getParameter("razorpay_order_id");
						String razorpayPaymentId = req.getParameter("razorpay_payment_id");
						String razorpaySignature = req.getParameter("razorpay_signature");
						HistoryBean bookingDetails = new HistoryBean();
						Double totalAmount = (double) (classFare * seat);
						bookingDetails.setAmount(totalAmount);
						bookingDetails.setFrom_stn(train.getFrom_stn());
						bookingDetails.setTo_stn(train.getTo_stn());
						bookingDetails.setTr_no(trainNo);
						bookingDetails.setSeats(seat);

						bookingDetails.setMailId(userMailId);
						bookingDetails.setDate(date);
					//	bookingDetails.setRazorpayOrderId(razorpayOrderId);
						

						HistoryBean transaction = bookingService.createHistory(bookingDetails, razorpayPaymentId,
								razorpaySignature, razorpayOrderId);

						BookingStatus bookingStatus = getBookingStatus(train, transaction);
						// Inside the doPost method, after calculating the actual seat numbers
						List<String> actualSeatNumbers = calculateSeatNumbers(bookingStatus, transaction.getSeats());
						req.setAttribute("actualSeatNumbers", actualSeatNumbers);


					    pw.println("<div class='tab'><p class='menu green'>" + seat
					            + " Seats Booked Successfully!<br/><br/> Your Transaction Id is: "
					            + transaction.getTransId() + "</div>");
						// Set ticket details as request attributes
						req.setAttribute("transId", transaction.getTransId());
						req.setAttribute("tr_name", train.getTr_name());
						req.setAttribute("tr_no", transaction.getTr_no());
						req.setAttribute("from_stn", transaction.getFrom_stn());
						req.setAttribute("to_stn", transaction.getTo_stn());
						req.setAttribute("date", transaction.getDate());
						req.setAttribute("berth", Berth);
						req.setAttribute("seats", transaction.getSeats());
						req.setAttribute("class", seatClass);
						req.setAttribute("statusColor", bookingStatus.getColor());
						req.setAttribute("bookingStatus", bookingStatus.getStatus());
						req.setAttribute("amount", transaction.getAmount());
						

						// Forward the request to the Ticket.jsp page
						RequestDispatcher ticketDispatcher = req.getRequestDispatcher("Ticket.jsp");
						ticketDispatcher.forward(req, res);

					} else {
						pw.println(
								"<div class='tab'><p1 class='menu red'>Transaction Declined. Try Again !</p1></div>");
					}
				}
			} else {
				pw.println("<div class='tab'><p1 class='menu'>Invalid Train Number !</p1></div>");
			}

		} catch (Exception e) {
			throw new TrainException(422, this.getClass().getName() + "_FAILED", e.getMessage());
		}

		sct.removeAttribute("seat");
		sct.removeAttribute("trainNo");
		sct.removeAttribute("journeyDate");
		sct.removeAttribute("class");
	}

	private BookingStatus getBookingStatus(TrainBean train, HistoryBean transaction) {
	    int availableSeats = train.getSeats();
	    int bookedSeats = transaction.getSeats();

	    if (availableSeats >= bookedSeats) {
	        return BookingStatus.CONFIRMED;
	    } else {
	        int remainingSeats = availableSeats;
	        int racThreshold = 10;  // Set your RAC threshold as needed
	        int waitingListLimit = 15;  // Set your waiting list limit as needed

	        if (remainingSeats >= bookedSeats) {
	            return BookingStatus.CONFIRMED;
	        } else if (remainingSeats + racThreshold >= bookedSeats) {
	            return BookingStatus.RAC;
	        } else if (remainingSeats + racThreshold + waitingListLimit >= bookedSeats) {
	            return BookingStatus.WAITING_LIST;
	        } else {
	            return BookingStatus.NOT_AVAILABLE;
	        }
	    }
	}
	private List<String> calculateSeatNumbers(BookingStatus bookingStatus, int bookedSeats) {
	    List<String> seatNumbers = new ArrayList<>();

	    switch (bookingStatus) {
	        case CONFIRMED:
	        case RAC:
	        case WAITING_LIST:
	            int coachNumber = (bookedSeats - 1) / 50 + 1; // Assuming 50 seats per coach
	            for (int i = 0; i < bookedSeats; i++) {
	                int seatWithinCoach = (i % 50) + 1;
	                String statusAbbreviation;
	                switch (bookingStatus) {
	                    case CONFIRMED:
	                        statusAbbreviation = "CNF";
	                        break;
	                    case RAC:
	                        statusAbbreviation = "RAC";
	                        break;
	                    case WAITING_LIST:
	                        statusAbbreviation = "WL";
	                        break;
	                    default:
	                        statusAbbreviation = "N/A";
	                }
	                seatNumbers.add(statusAbbreviation + "/S" + coachNumber + "/" + seatWithinCoach);
	            }
	            break;
	        default:
	            seatNumbers.add("N/A");  // Handle the case where the booking status is NOT_AVAILABLE
	    }

	    return seatNumbers;
	}




}
