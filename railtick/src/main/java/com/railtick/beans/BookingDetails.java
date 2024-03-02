package com.railtick.beans;

import java.io.Serializable;

public class BookingDetails implements Serializable {

	private static final long serialVersionUID = 1L;
	private String mailId;
	private String tr_no;
	private String date;
	private String from_stn;
	private String to_stn;
	private String berth;
	private int seats;

	private String razorpay_payment_id;
	private String razorpay_signature;

	private Double amount;

	public String getMailId() {
		return mailId;
	}

	public void setMailId(String mailId) {
		this.mailId = mailId;
	}

	public String getTr_no() {
		return tr_no;
	}

	public void setTr_no(String tr_no) {
		this.tr_no = tr_no;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getFrom_stn() {
		return from_stn;
	}

	public void setFrom_stn(String from_stn) {
		this.from_stn = from_stn;
	}

	public String getTo_stn() {
		return to_stn;
	}

	public void setTo_stn(String to_stn) {
		this.to_stn = to_stn;
	}

	public int getSeats() {
		return seats;
	}

	public void setSeats(int seats) {
		this.seats = seats;
	}

	public Double getAmount() {
		return amount;
	}

	public void setAmount(Double amount) {
		this.amount = amount;
	}

	public String getBerth() {
		return berth;
	}

	public void setBerth(String berth) {
		this.berth = berth;
	}

	public String getRazorpay_payment_id() {
		return razorpay_payment_id;
	}

	public void setRazorpay_payment_id(String razorpay_payment_id) {
		this.razorpay_payment_id = razorpay_payment_id;
	}

	public String getRazorpay_signature() {
		return razorpay_signature;
	}

	public void setRazorpay_signature(String razorpay_signature) {
		this.razorpay_signature = razorpay_signature;
	}

}
