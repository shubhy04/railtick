package com.railtick.serviceimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import com.railtick.beans.TrainException;
import com.railtick.constants.ResponseCode;
import com.railtick.entity.DatabaseConnection;
import com.railtick.service.BookingService;
import com.railtick.beans.HistoryBean;

public class BookingServiceImpl implements BookingService {

	@Override
	public List<HistoryBean> getAllBookingsByCustomerId(String customerEmailId) throws TrainException {
		List<HistoryBean> transactions = null;
		String query = "SELECT * FROM HISTORY WHERE MAILID=?";
		try {
			Connection con = DatabaseConnection.getConnection();
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, customerEmailId);
			ResultSet rs = ps.executeQuery();
			transactions = new ArrayList<HistoryBean>();
			while (rs.next()) {
				HistoryBean transaction = new HistoryBean();
				transaction.setTransId(rs.getString("transid"));
				transaction.setFrom_stn(rs.getString("from_stn"));
				transaction.setTo_stn(rs.getString("to_stn"));
				transaction.setDate(rs.getString("date"));
				transaction.setMailId(rs.getString("mailid"));
				transaction.setSeats(rs.getInt("seats"));
				transaction.setAmount(rs.getDouble("amount"));
				transaction.setTr_no(rs.getString("tr_no"));
				transaction.setRazorpay_payment_id(rs.getString("razorpay_payment_id"));
				transaction.setRazorpay_signature(rs.getString("razorpay_signature"));
				transaction.setRazorpayOrderId(rs.getString("razorpay_order_id"));
				transactions.add(transaction);
				
			}

			ps.close();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			throw new TrainException(e.getMessage());
		}
		return transactions;
	}

	@Override
	public HistoryBean createHistory(HistoryBean details,String razorpayPaymentId, String razorpaySignature, String RazorpayOrderId) throws TrainException {
		HistoryBean history = null;
		
		String query = "INSERT INTO HISTORY VALUES(?,?,?,?,?,?,?,?,?,?,?)";
		try {
			details.setRazorpay_payment_id(razorpayPaymentId);
			details.setRazorpay_signature(razorpaySignature);
			details.setRazorpayOrderId(RazorpayOrderId);
			Connection con = DatabaseConnection.getConnection();
			PreparedStatement ps = con.prepareStatement(query);
			String transactionId = UUID.randomUUID().toString();
			ps.setString(1, transactionId);
			ps.setString(2, details.getMailId());
			ps.setString(3, details.getTr_no());
			ps.setString(4, details.getDate());
			ps.setString(5, details.getFrom_stn());
			ps.setString(6, details.getTo_stn());
			ps.setLong(7, details.getSeats());
			ps.setDouble(8, details.getAmount());
			ps.setString(9, details.getRazorpay_payment_id());
            ps.setString(10, details.getRazorpay_signature());
            ps.setString(11, details.getRazorpayOrderId());
			int response = ps.executeUpdate();
			if (response > 0) {
				history = (HistoryBean) details;
				history.setTransId(transactionId);
			} else {
				throw new TrainException(ResponseCode.INTERNAL_SERVER_ERROR);
			}
			ps.close();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			throw new TrainException(e.getMessage());
		}
		return history;
	}
	@Override
	public HistoryBean getBookingByTransId(String transId) throws TrainException {
	    HistoryBean transaction = null;
	    String query = "SELECT * FROM HISTORY WHERE TRANSID=?";
	    try {
	        Connection con = DatabaseConnection.getConnection();
	        PreparedStatement ps = con.prepareStatement(query);
	        ps.setString(1, transId);
	        ResultSet rs = ps.executeQuery();
	        
	        if (rs.next()) {
	            transaction = new HistoryBean();
	            transaction.setTransId(rs.getString("transid"));
	            transaction.setFrom_stn(rs.getString("from_stn"));
	            transaction.setTo_stn(rs.getString("to_stn"));
	            transaction.setDate(rs.getString("date"));
	            transaction.setMailId(rs.getString("mailid"));
	            transaction.setSeats(rs.getInt("seats"));
	            transaction.setAmount(rs.getDouble("amount"));
	            transaction.setTr_no(rs.getString("tr_no"));
	            transaction.setRazorpay_payment_id(rs.getString("razorpay_payment_id"));
	            transaction.setRazorpay_signature(rs.getString("razorpay_signature"));
	            transaction.setRazorpayOrderId(rs.getString("razorpay_order_id"));
	        }

	        ps.close();
	    } catch (SQLException e) {
	        System.out.println(e.getMessage());
	        throw new TrainException(e.getMessage());
	    }
	    return transaction;
	}
	
	@Override
	public boolean cancelBooking(String transId) throws TrainException {
	    boolean cancellationStatus = false;
	    String getBookingDetailsQuery = "SELECT * FROM HISTORY WHERE TRANSID=?";
	    String updateTrainSeatsQuery = "UPDATE TRAIN SET SEATS = SEATS + ? WHERE TR_NO=?";
	    String deleteBookingQuery = "DELETE FROM HISTORY WHERE TRANSID=?";

	    try {
	        Connection con = DatabaseConnection.getConnection();
	        con.setAutoCommit(false); // Set auto-commit to false for transaction

	        // Get booking details
	        PreparedStatement getBookingDetailsPS = con.prepareStatement(getBookingDetailsQuery);
	        getBookingDetailsPS.setString(1, transId);
	        ResultSet bookingDetailsRS = getBookingDetailsPS.executeQuery();

	        PreparedStatement updateTrainSeatsPS = null;  // Declare outside the if block

	        if (bookingDetailsRS.next()) {
	            String trNo = bookingDetailsRS.getString("tr_no");
	            int bookedSeats = bookingDetailsRS.getInt("seats");
	            double refundAmount = bookingDetailsRS.getDouble("amount");

	            // Update train seats
	            updateTrainSeatsPS = con.prepareStatement(updateTrainSeatsQuery);
	            updateTrainSeatsPS.setInt(1, bookedSeats);
	            updateTrainSeatsPS.setString(2, trNo);
	            int updateTrainSeatsResponse = updateTrainSeatsPS.executeUpdate();

	            // Delete booking record
	            PreparedStatement deleteBookingPS = con.prepareStatement(deleteBookingQuery);
	            deleteBookingPS.setString(1, transId);
	            int deleteBookingResponse = deleteBookingPS.executeUpdate();

	            // Check if both updates were successful
	            if (updateTrainSeatsResponse > 0 && deleteBookingResponse > 0) {
	                // Commit the transaction
	                con.commit();
	                cancellationStatus = true;
	            } else {
	                // Rollback if any update fails
	                con.rollback();
	            }
	        }

	        // Close prepared statements
	        getBookingDetailsPS.close();

	        // Close updateTrainSeatsPS if it was created
	        if (updateTrainSeatsPS != null) {
	            updateTrainSeatsPS.close();
	        }

	    } catch (SQLException e) {
	        System.out.println(e.getMessage());
	        throw new TrainException(e.getMessage());
	    }

	    return cancellationStatus;
	}

}



