package com.railtick.beans;

public class UserBean {
	//private static final long serialVersionUID = 1L;

	private String Fname;
	private String Lname;
	private String EmailID;
	private String Pass;
	private long Phno;
	private String Gender;
	private String Address;
	private String RePass;

	public void setFname(String Fname) {
		this.Fname = Fname;
	}

	public void setLname(String Lname) {
		this.Lname = Lname;
	}

	public void setEmailID(String EmailID) {
		this.EmailID = EmailID;
	}

	public void setPass(String Pass) {
		this.Pass = Pass;
	}

	public void setPhno(long Phno) {
		this.Phno = Phno;
	}

	public void setGender(String Gender) {
		this.Gender = Gender;
	}

	public void setAddress(String Address) {
		this.Address = Address;
	}

	public String getFname() {
		return Fname;
	}

	public String getLname() {
		return Lname;
	}

	public String getEmailID() {
		return EmailID;
	}

	public String getPass() {
		return Pass;
	}

	public long getPhno() {
		return Phno;
	}

	public String getGender() {
		return Gender;
	}

	public String getAddress() {
		return Address;
	}
	public void setRePass(String RePass) {
		this.RePass = RePass;
	}
	public String getRePass() {
		return RePass;
	}
}
