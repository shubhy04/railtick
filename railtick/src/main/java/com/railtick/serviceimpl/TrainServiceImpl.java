package com.railtick.serviceimpl;

import java.sql.*;

import java.util.ArrayList;
import java.util.List;

import com.railtick.beans.TrainBean;
import com.railtick.beans.TrainException;
import com.railtick.entity.DatabaseConnection;
import com.railtick.service.TrainService;

public class TrainServiceImpl implements TrainService {
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

}
