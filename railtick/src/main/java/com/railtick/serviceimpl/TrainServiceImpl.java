package com.railtick.serviceimpl;

import java.sql.*;

import java.util.ArrayList;
import java.util.List;

import com.railtick.beans.Farebean;
import com.railtick.beans.TrainBean;
import com.railtick.beans.TrainException;
import com.railtick.entity.DatabaseConnection;
import com.railtick.service.TrainService;
import com.railtick.constants.ResponseCode;

public class TrainServiceImpl implements TrainService {

	@Override
	public String addTrain(TrainBean train) {
		String responseCode = ResponseCode.FAILURE.toString();
		String query = "INSERT INTO TRAIN VALUES(?,?,?,?,?,?)";
		try {
			Connection con = DatabaseConnection.getConnection();
			PreparedStatement ps = con.prepareStatement(query);
			ps.setLong(1, train.getTr_no());
			ps.setString(2, train.getTr_name());
			ps.setString(3, train.getFrom_stn());
			ps.setString(4, train.getTo_stn());
			ps.setLong(5, train.getSeats());
			ps.setDouble(6, train.getFare());
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				responseCode = ResponseCode.SUCCESS.toString();
			}
			ps.close();
		} catch (SQLException e) {
			responseCode += " : " + e.getMessage();
		}
		return responseCode;
	}

	@Override
	public String deleteTrainById(String trainNo) {
		String responseCode = ResponseCode.FAILURE.toString();
		String query = "DELETE FROM TRAIN WHERE TR_NO=?";
		try {
			Connection con = DatabaseConnection.getConnection();
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, trainNo);
			int response = ps.executeUpdate();
			if (response > 0) {
				responseCode = ResponseCode.SUCCESS.toString();
			}
			ps.close();
		} catch (SQLException e) {
			responseCode += " : " + e.getMessage();
		}
		return responseCode;
	}

	@Override
	public List<TrainBean> getAllTrains() throws TrainException {
		List<TrainBean> trains = null;
		String query = "SELECT * FROM TRAIN";
		try {
			Connection con = DatabaseConnection.getConnection();
			PreparedStatement ps = con.prepareStatement(query);
			ResultSet rs = ps.executeQuery();
			trains = new ArrayList<TrainBean>();
			while (rs.next()) {
				TrainBean train = new TrainBean();
				train.setFare(rs.getDouble("fare"));
				train.setFrom_stn(rs.getString("from_stn"));
				train.setTo_stn(rs.getString("to_stn"));
				train.setTr_name(rs.getString("tr_name"));
				train.setTr_no(rs.getLong("tr_no"));
				train.setSeats(rs.getInt("seats"));
				trains.add(train);
			}

			ps.close();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			throw new TrainException(e.getMessage());
		}
		return trains;
	}

	@Override
	public TrainBean getTrainById(String trainNo) throws TrainException {
		TrainBean train = null;
		String query = "SELECT * FROM TRAIN WHERE TR_NO=?";
		try {
			Connection con = DatabaseConnection.getConnection();
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, trainNo);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				train = new TrainBean();
				train.setFare(rs.getDouble("fare"));
				train.setFrom_stn(rs.getString("from_stn"));
				train.setTo_stn(rs.getString("to_stn"));
				train.setTr_name(rs.getString("tr_name"));
				train.setTr_no(rs.getLong("tr_no"));
				train.setSeats(rs.getInt("seats"));
			}
			ps.close();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			throw new TrainException(e.getMessage());
		}
		return train;
	}

	@Override
	public TrainBean getFareDetails(String trainNo) throws TrainException {
		TrainBean train = null;
		String query = "SELECT * FROM FARE WHERE TR_NO=?";
		try {
			Connection con = DatabaseConnection.getConnection();
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, trainNo);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				train = new TrainBean();
				train.setTr_no(rs.getLong("tr_no"));
				train.setSleeper(rs.getLong("sleeper"));
				train.setGeneral(rs.getLong("general"));
				train.setAc_tier(rs.getLong("ac_tier"));
				train.setAc_2_tier(rs.getLong("ac_2_tier"));
			}
			ps.close();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			throw new TrainException(e.getMessage());
		}
		return train;
	}

	@Override
	public List<TrainBean> getTrainsBetweenStations(String fromStation, String toStation) throws TrainException {
		List<TrainBean> trains = null;
		String query = "SELECT * FROM TRAIN WHERE UPPER(FROM_STN) LIKE UPPER(?) AND UPPER(TO_STN) LIKE UPPER(?)";

		try {
			Connection con = DatabaseConnection.getConnection();
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, "%" + fromStation + "%");
			ps.setString(2, "%" + toStation + "%");
			ResultSet rs = ps.executeQuery();
			trains = new ArrayList<TrainBean>();
			while (rs.next()) {
				TrainBean train = new TrainBean();
				train.setFare(rs.getDouble("fare"));
				train.setFrom_stn(rs.getString("from_stn"));
				train.setTo_stn(rs.getString("to_stn"));
				train.setTr_name(rs.getString("tr_name"));
				train.setTr_no(rs.getLong("tr_no"));
				train.setSeats(rs.getInt("seats"));
				trains.add(train);
			}

			ps.close();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			throw new TrainException(e.getMessage());
		}
		return trains;
	}

	@Override
	public String updateTrain(TrainBean train) {
		String responseCode = ResponseCode.FAILURE.toString();
		String query = "UPDATE TRAIN SET TR_NAME=?, FROM_STN=?,TO_STN=?,SEATS=?,FARE=? WHERE TR_NO=?";
		try {
			Connection con = DatabaseConnection.getConnection();
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, train.getTr_name());
			ps.setString(2, train.getFrom_stn());
			ps.setString(3, train.getTo_stn());
			ps.setLong(4, train.getSeats());
			ps.setDouble(5, train.getFare());
			ps.setDouble(6, train.getTr_no());
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				responseCode = ResponseCode.SUCCESS.toString();
			}
			ps.close();
		} catch (SQLException e) {
			responseCode += " : " + e.getMessage();
		}
		return responseCode;
	}

//	@Override
//	public String getFare(Farebean fare) {
//		String responseCode = ResponseCode.FAILURE.toString();
//		String query = "SELECT * FROM FARE";
//		try {
//			Connection con = DatabaseConnection.getConnection();
//			PreparedStatement ps = con.prepareStatement(query);
//			ps.setDouble(1, fare.getSleeper());
//			ps.setDouble(2, fare.getSecond());
//			ps.setDouble(3, fare.getAcfirst());
//			ps.setDouble(4, fare.getAc2tier());
//			ResultSet rs = ps.executeQuery();
//			if (rs.next()) {
//				responseCode = ResponseCode.SUCCESS.toString();
//			}
//			ps.close();
//		} catch (SQLException e) {
//			responseCode += " : " + e.getMessage();
//		}
//		return responseCode;
//	}

}
