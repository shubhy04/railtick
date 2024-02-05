package com.railtick.serviceimpl;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.railtick.beans.UserBean;
import com.railtick.constants.ResponseCode;
import com.railtick.constants.UserRole;
import com.railtick.entity.DatabaseConnection;
import com.railtick.service.UserService;
import com.railtick.beans.TrainException;

public class UserServiceImpl implements UserService {
	private final String TABLE_NAME;

	public UserServiceImpl(UserRole userRole) {
		if (userRole == null) {
			userRole = UserRole.CUSTOMER;
		}
		this.TABLE_NAME = userRole.toString();
	}

	@Override
	public UserBean getUserByEmailId(String customerEmailId) throws TrainException {
		UserBean customer = null;
		String query = "SELECT * FROM " + TABLE_NAME + "WHERE EMAILID = ?";
		try {
			Connection con = DatabaseConnection.getConnection();
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, customerEmailId);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				customer = new UserBean();
				customer.setFname(rs.getString("Fname"));
				customer.setLname(rs.getString("Lname"));
				customer.setEmailID(rs.getString("EmailID"));
				customer.setPass(rs.getString("Pass"));
				customer.setPhno(rs.getLong("Phno"));
				customer.setGender(rs.getString("Gender"));
				customer.setAddress(rs.getString("Address"));

			} else {
				throw new TrainException(ResponseCode.NO_CONTENT);
			}
			ps.close();

		} catch (SQLException e) {
			System.out.println(e.getMessage());
			throw new TrainException(e.getMessage());

		}
		return customer;

	}

	@Override
	public UserBean loginUser(String username, String password) throws TrainException {
		UserBean customer = null;
		String query = "SELECT * FROM " + TABLE_NAME + " WHERE EMAILID=? AND PASS=?";
		try {
			Connection con = DatabaseConnection.getConnection();
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, username);
			ps.setString(2, password);
			ResultSet rs = ps.executeQuery(); 
			if (rs.next()) {
				customer = new UserBean();
				customer.setFname(rs.getString("Fname"));
				customer.setLname(rs.getString("Lname"));
				customer.setEmailID(rs.getString("Email"));
				customer.setPass(rs.getString("Pass"));
				customer.setPhno(rs.getLong("Phno"));
				customer.setGender(rs.getString("Gender"));
				customer.setAddress(rs.getString("Address"));

			} else {
				throw new TrainException(ResponseCode.UNAUTHORIZED);
			}
			ps.close();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			throw new TrainException(e.getMessage());
		}
		return customer;
	}

	@Override
	public List<UserBean> getAllUsers() throws TrainException {
		List<UserBean> customers = null;
		String query = "SELECT * FROM" + TABLE_NAME;
		try {
			Connection con = DatabaseConnection.getConnection();
			PreparedStatement ps = con.prepareStatement(query);
			ResultSet rs = ps.executeQuery();
			customers = new ArrayList<UserBean>();
			while (rs.next()) {
				UserBean customer = new UserBean();
				customer.setFname(rs.getString("Fname"));
				customer.setLname(rs.getString("Lname"));
				customer.setEmailID(rs.getString("EmailID"));
				customer.setPass(rs.getString("Pass"));
				customer.setPhno(rs.getLong("Phno"));
				customer.setGender(rs.getString("Gender"));
				customer.setAddress(rs.getString("Address"));
				customers.add(customer);

			}
			if (customers.isEmpty()) {
				throw new TrainException(ResponseCode.NO_CONTENT);
			}

		} catch (SQLException e) {
			System.out.println(e.getMessage());
			throw new TrainException(e.getMessage());

		}

		return customers;
	}

}
