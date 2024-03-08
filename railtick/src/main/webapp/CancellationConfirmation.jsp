<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="javax.mail.*" %>
<%@ page import="javax.mail.internet.*" %>
<%@ page import="java.util.Properties" %>
<%@ page import="java.io.IOException" %>

<%
    // Assume you have set the email credentials and host details in your application.
     String email = (String) session.getAttribute("mailid"); // Replace "userEmail" with your session attribute name

    
   
    String from = "railtick0@gmail.com";
    String to = email;
    String subject = "Cancellation Confirmation";

    // Get the cancellation status from the request or session attribute
    String cancellationStatus = (String) request.getAttribute("cancellationStatus");

    // HTML content for the email
    String emailContent = "<h2>Cancellation Confirmation</h2>"
            + "<p>" + cancellationStatus + "</p>"
            + "<p><a href='index.jsp'>Back to Home</a></p>";

    // Set up JavaMail properties
    Properties properties = new Properties();
    properties.put("mail.smtp.host", "smtp.gmail.com");
    properties.put("mail.smtp.auth", "true");
    properties.put("mail.smtp.starttls.enable", "true");
    properties.put("mail.smtp.port", "587");

    // Get the default Session object for sending emails
    Session mailSession = Session.getInstance(properties,
        new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication("railtick0@gmail.com", "goif tdyu qanl yhgj");
            }
        });

    try {
        // Create a default MimeMessage object.
        MimeMessage message = new MimeMessage(mailSession);

        // Set From: header field of the header.
        message.setFrom(new InternetAddress(from));

        // Set To: header field of the header.
        message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));

        // Set Subject: header field
        message.setSubject(subject);

        // Now set the actual message
        message.setContent(emailContent, "text/html");

        // Send message
        Transport.send(message);
    } catch (MessagingException e) {
        // Handle the exception appropriately
        e.printStackTrace();
    }
%>

<html>
<head>
    <title>RT-Cancellation Confirmation</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }

        h2 {
            color: #333;
        }

        p {
            font-size: 16px;
            margin-bottom: 15px;
        }

        a {
            text-decoration: none;
            color: #007BFF;
        }
    </style>
</head>
<body>
    <h2>Cancellation Confirmation</h2>
    
    <p>${cancellationStatus}</p>
    
    <p><a href="HomePage.jsp">Back to Home</a></p>
</body>
</html>
