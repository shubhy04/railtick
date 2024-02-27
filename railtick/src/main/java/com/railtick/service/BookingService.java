package com.railtick.service;

import java.util.List;

import com.railtick.beans.HistoryBean;
import com.railtick.beans.TrainException;

public interface BookingService {
	public List<HistoryBean> getAllBookingsByCustomerId(String customerEmailId) throws TrainException;

	public HistoryBean createHistory(HistoryBean bookingDetails) throws TrainException;

}
