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

			request.getServletContext().setAttribute(userRole.toString(), user);

			request.getSession().setAttribute("Fname", user.getFname());
			request.getSession().setAttribute("EmailID", user.getEmailID());

			Cookie cookie = new Cookie("sessionIdFor" + userRole.toString(), UUID.randomUUID().toString());

			cookie.setMaxAge(600);

			response.addCookie(cookie);

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

	public static String getCurrentUsername(HttpServletRequest request) {
		return (String) request.getSession().getAttribute("Fname");

	}

	public static String getCurrentUserEmail(HttpServletRequest request) {
		return (String) request.getSession().getAttribute("EmailID");

	}

	public static UserBean getCurrentCustomer(HttpServletRequest request) {
		return (UserBean) request.getServletContext().getAttribute(UserRole.CUSTOMER.toString());

	}

}
