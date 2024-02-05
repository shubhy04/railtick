package com.railtick.constants;

public enum ResponseCode {
	SUCCESS(10, "OK"), FAILURE(20, "Error"), UNAUTHORIZED(401, "Invalid Credentials, Try Again"),
	NO_CONTENT(30, "No content"),SESSION_EXPIRED(401, "Session Expired, Login Again to Continue"),;

	private final String message;
	private final int code;

	ResponseCode(int code, String message) {
		this.code = code;
		this.message = message;
	}

	public String getMessage() {
		return message;
	}

	public int getCode() {
		return code;
	}
}
