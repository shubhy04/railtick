package com.railtick.service;

import java.util.List;


import com.railtick.beans.UserBean;
import com.railtick.beans.TrainException;

public interface UserService {
	public UserBean getUserByEmailId(String userEmailId) throws TrainException;

	public List<UserBean> getAllUsers() throws TrainException;

	public String updateUser(UserBean customer);

	public String deleteUser(UserBean customer);

	public String registerUser(UserBean customer);
	
	public UserBean loginUser(String username, String password) throws TrainException;

}
