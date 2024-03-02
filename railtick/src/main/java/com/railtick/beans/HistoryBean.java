package com.railtick.beans;

public class HistoryBean extends BookingDetails{
	private static final long serialVersionUID = 1L;

	private String transId;
	private String razorpay_payment_id;
    private String razorpay_signature;
    private String razorpay_order_id;

	public String getTransId() {
		return transId;
	}

	public void setTransId(String transId) {
		this.transId = transId;
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

	public String getRazorpayOrderId() {
		return razorpay_order_id;
	}

	public void setRazorpayOrderId(String razorpay_order_id) {
		this.razorpay_order_id = razorpay_order_id;
	}


}
