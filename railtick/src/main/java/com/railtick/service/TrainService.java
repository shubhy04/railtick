package com.railtick.service;

import java.util.List;

import com.railtick.beans.Farebean;
import com.railtick.beans.TrainBean;
import com.railtick.beans.TrainException;

public interface TrainService {
	public String addTrain(TrainBean train);

	public String deleteTrainById(String trainNo);

	public String updateTrain(TrainBean train);

	public TrainBean getTrainById(String trainNo) throws TrainException;

	public List<TrainBean> getAllTrains() throws TrainException;

	public TrainBean getFareDetails(String trainNo) throws TrainException;

	public List<TrainBean> getTrainsBetweenStations(String fromStation, String toStation) throws TrainException;

}
