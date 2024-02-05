package com.railtick.service;

import java.util.List;


import com.railtick.beans.TrainBean;
import com.railtick.beans.TrainException;

public interface TrainService {
	public List<TrainBean> getAllTrains() throws TrainException;

}
