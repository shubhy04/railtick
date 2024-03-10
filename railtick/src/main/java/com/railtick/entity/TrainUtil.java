package com.railtick.entity;

import java.util.Arrays;


import java.util.Optional;
import java.util.UUID;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.railtick.beans.*;
import com.railtick.beans.TrainException;
import com.railtick.constants.ResponseCode;
import com.railtick.constants.UserRole;
import com.railtick.service.UserService;
import com.railtick.serviceimpl.UserServiceImpl;
 

public class TrainUtil {
	public static Optional<String> readCookie(HttpServletRequest request, String key) {
		Cookie[] cookies = request.getCookies();
		if (cookies == null) {
			return Optional.empty();
		}
		return Arrays.stream(cookies).filter(c -> key.equals(c.getName())).map(Cookie::getValue).findAny();
	}

	public static String login(HttpServletRequest request, HttpServletResponse response, UserRole userRole,
			String username, String password) {
		UserService userService = new UserServiceImpl(userRole);
		String responseCode = ResponseCode.UNAUTHORIZED.toString();
		try {
			UserBean user = userService.loginUser(username, password);

			// Add the user details to the ServletContext with key as role name
			request.getServletContext().setAttribute(userRole.toString(), user);

			// Store the user firstName and mailId in the http session
			request.getSession().setAttribute("uName", user.getFName());
			request.getSession().setAttribute("mailid", user.getMailId());

			// Add the sessionId to the cookie with key as sessionId
			Cookie cookie = new Cookie("sessionIdFor" + userRole.toString(), UUID.randomUUID().toString());

			cookie.setMaxAge(1200); // Expires after 20 MIN

			// add the cookie to the response
			response.addCookie(cookie);

			// set the responseCode to success
			responseCode = ResponseCode.SUCCESS.toString();

		} catch (TrainException e) {
			responseCode += " : " + e.getMessage();
		}

		return responseCode;
	}

	public static boolean isLoggedIn(HttpServletRequest request, UserRole userRole) {
		Optional<String> sessionId = readCookie(request, "sessionIdFor" + userRole.toString());
		return sessionId != null && sessionId.isPresent();
	}

	public static void validateUserAuthorization(HttpServletRequest request, UserRole userRole) throws TrainException {
		if (!isLoggedIn(request, userRole)) {
			throw new TrainException(ResponseCode.SESSION_EXPIRED);
		}
	}

	public static boolean logout(HttpServletResponse response) {
		Cookie cookie = new Cookie("sessionIdFor" + UserRole.ADMIN.toString(), UUID.randomUUID().toString());
		cookie.setMaxAge(0);

		Cookie cookie2 = new Cookie("sessionIdFor" + UserRole.CUSTOMER.toString(), UUID.randomUUID().toString());
		cookie2.setMaxAge(0);

		response.addCookie(cookie);
		response.addCookie(cookie2);

		return true;

	}

	public static String getCurrentUserName(HttpServletRequest req) {
		return (String) req.getSession().getAttribute("uName");
	}

	public static String getCurrentUserEmail(HttpServletRequest req) {
		return (String) req.getSession().getAttribute("mailid");
	}

	public static UserBean getCurrentCustomer(HttpServletRequest req) {
		return (UserBean) req.getServletContext().getAttribute(UserRole.CUSTOMER.toString());
	}

}
