package com.railtick.beans;

public class TrainBean {
	private static final long serialVersionUID = 1L;

	private Long tr_no;
	private String tr_name;
	private String from_stn;
	private String to_stn;
	private Integer seats;
	private Double fare;
	
	// fARE
	private Long sleeper;
	private Long general;
	private Long ac_tier;
	private Long ac_2_tier;
	
	

	public Long getTr_no() {
		return tr_no;
	}

	public String getTr_name() {
		return tr_name;
	}

	public String getFrom_stn() {
		return from_stn;
	}

	public String getTo_stn() {
		return to_stn;
	}

	public Integer getSeats() {
		return seats;
	}

	public Double getFare() {
		return fare;
	}

	public void setTr_no(Long tr_no) {
		this.tr_no = tr_no;
	}

	public void setTr_name(String tr_name) {
		this.tr_name = tr_name;
	}

	public void setFrom_stn(String from_stn) {
		this.from_stn = from_stn;
	}

	public void setTo_stn(String to_stn) {
		this.to_stn = to_stn;
	}

	public void setSeats(Integer seats) {
		this.seats = seats;
	}

	public void setFare(Double fare) {
		this.fare = fare;
	}
	
	//fare
	public Long getSleeper() {
		return sleeper;
	}
	public void setSleeper(Long sleeper) {
		this.sleeper = sleeper;
	}
	public Long getGeneral() {
		return general;
	}
	public void setGeneral(Long general) {
		this.general = general;
	}
	public Long getAc_tier() {
		return ac_tier;
	}
	public void setAc_tier (Long ac_tier) {
		this.ac_tier = ac_tier;
	}
	public Long getAc_2_tier() {
		return ac_2_tier;
	}
	public void setAc_2_tier(Long ac_2_tier) {
		this.ac_2_tier = ac_2_tier;
	}


}
