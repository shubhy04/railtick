package com.railtick.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.railtick.beans.UserBean;
import com.railtick.constants.UserRole;
import com.railtick.serviceimpl.UserServiceImpl;
import com.railtick.service.UserService;
import com.railtick.beans.TrainException;

@WebServlet("/userreg")
public class UserRegServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserService userService = new UserServiceImpl(UserRole.CUSTOMER);

    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
        res.setContentType("text/html");
        PrintWriter pw = res.getWriter();

        try {
            // Client-side validation
            String errorMessage = validateRequestParameters(req);
            if (errorMessage != null) {
                // Set error message in request attribute
                req.setAttribute("errorMessage", errorMessage);
                RequestDispatcher rd = req.getRequestDispatcher("Register.jsp");
                rd.forward(req, res);
                return;
            }

            UserBean user = new UserBean();
            user.setMailId(req.getParameter("mailid"));
            user.setPWord(req.getParameter("pword"));
            user.setFName(req.getParameter("firstname"));
            user.setLName(req.getParameter("lastname"));
            user.setAddr(req.getParameter("address"));
            user.setPhNo(Long.parseLong(req.getParameter("phoneno")));

            String message = userService.registerUser(user);
            if ("SUCCESS".equalsIgnoreCase(message)) {
                // Set success message in request attribute
                req.setAttribute("successMessage", "User Registered Successfully!");
                RequestDispatcher rd = req.getRequestDispatcher("Login.jsp");
                rd.forward(req, res);
            } else {
                // Set error message in request attribute
                req.setAttribute("errorMessage", message);
                RequestDispatcher rd = req.getRequestDispatcher("Register.jsp");
                rd.forward(req, res);
            }

        } catch (Exception e) {
            // Handle exceptions
            throw new TrainException(422, this.getClass().getName() + "_FAILED", e.getMessage());
        }
    }

 // Server-side validation method
    private String validateRequestParameters(HttpServletRequest req) {
        String mailId = req.getParameter("mailid");
        String password = req.getParameter("pword");
        String firstName = req.getParameter("firstname");
        String lastName = req.getParameter("lastname");
        String address = req.getParameter("address");
        String phoneNo = req.getParameter("phoneno");

        // Email validation
        if (mailId == null || mailId.trim().isEmpty() || !isValidEmail(mailId)) {
            return "Please enter a valid email address.";
        }

        // Password validation (at least 8 characters with a mix of letters and numbers)
        if (password == null || password.trim().isEmpty() || !isValidPassword(password)) {
            return "Password must be at least 8 characters long and contain both letters and numbers.";
        }

        // Name validation (only letters and spaces allowed)
        if (firstName == null || firstName.trim().isEmpty() || !isValidName(firstName) ||
            lastName == null || lastName.trim().isEmpty() || !isValidName(lastName)) {
            return "Please enter valid first and last names (only letters and spaces are allowed).";
        }

        // Address validation (alphanumeric with spaces)
        if (address == null || address.trim().isEmpty() || !isValidAddress(address)) {
            return "Please enter a valid address (only letters, numbers, and spaces are allowed).";
        }

        // Phone number validation (exactly 10 digits)
        if (phoneNo == null || phoneNo.trim().isEmpty() || !isValidPhoneNumber(phoneNo)) {
            return "Please enter a valid 10-digit phone number.";
        }

        return null;
    }

 // Email validation
    private boolean isValidEmail(String email) {
        // Using a simple regex for basic email validation
        String emailRegex = "^[a-zA-Z0-9_+&*-]+(?:\\.[a-zA-Z0-9_+&*-]+)*@(?:[a-zA-Z0-9-]+\\.)+[a-zA-Z]{2,7}$";
        return email.matches(emailRegex);
    }

    // Password validation (at least 8 characters with a mix of letters and numbers)
    private boolean isValidPassword(String password) {
        return password.matches("^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{8,}$");
    }

    // Name validation (only letters and spaces allowed)
    private boolean isValidName(String name) {
        return name.matches("^[a-zA-Z\\s]+$");
    }

    // Address validation (alphanumeric with spaces)
    private boolean isValidAddress(String address) {
        return address.matches("^[a-zA-Z0-9\\s]+$");
    }

    // Phone number validation (exactly 10 digits)
    private boolean isValidPhoneNumber(String phoneNo) {
        return phoneNo.matches("\\d{10}");
    }

}
