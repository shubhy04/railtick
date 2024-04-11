<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="javax.mail.*" %>
<%@ page import="javax.mail.internet.*" %>
<%@ page import="java.util.Properties" %>
<%@ page import="java.io.IOException" %>

<%
     String email = (String) session.getAttribute("mailid"); 
    String from = "railtick0@gmail.com";
    String to = email;
    String subject = "Cancellation Confirmation";

    String cancellationStatus = (String) request.getAttribute("cancellationStatus");
    String emailContent = "<h2>Cancellation Confirmation</h2>"
            + "<p>" + cancellationStatus + "</p>";
    Properties properties = new Properties();
    properties.put("mail.smtp.host", "smtp.gmail.com");
    properties.put("mail.smtp.auth", "true");
    properties.put("mail.smtp.starttls.enable", "true");
    properties.put("mail.smtp.port", "587");

    Session mailSession = Session.getInstance(properties,
        new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication("railtick0@gmail.com", "goif tdyu qanl yhgj");
            }
        });

    try {
        MimeMessage message = new MimeMessage(mailSession);
        message.setFrom(new InternetAddress(from));
        message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
        message.setSubject(subject);
        message.setContent(emailContent, "text/html");
        Transport.send(message);
    } catch (MessagingException e) {
        e.printStackTrace();
    }
%>
<html>

<head>
    <title>RT-Cancellation Confirmation</title>
    <style>
        body {
            background-color: #FFF7F1;
            color: #403d39;
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }
  .conti {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin-top: 50px;
        }

        .conti h2 {
            color: #403d39;
            margin-bottom: 20px;
            text-align:center;
        }


        .footer {
            background-color: #403d39;
            color: #fffcf2;
            padding: 20px 0;
            text-align: center;
            position: absolute;
            width: 100%;
            bottom: 0;
        }

        .content {
            margin-top: 30px;
        }

        .content-info {
            background-color: #f2f2f2;
            padding: 15px;
            border-radius: 8px;
            margin-bottom: 20px;
        }

        .content-info p {
            margin: 0;
            text-align:center;
        }
        p {
            margin: 0;
            text-align:center;
        }
    </style>
</head>
<body>
<%@include file="global/navbar.jsp"%>

<div class="conti">
    <h2>Cancellation Confirmation</h2>
    <div class="content-info">
        <p>Your ticket cancellation request has been processed successfully.</p>
        <p>A confirmation email has been sent to your registered Email </p>
    </div>
    <p >${cancellationStatus}</p>
    <p><a href="HomePage.jsp">Back to Home</a></p>
</div>

<footer class="footer">
    <div class="container">
        <p>&copy; 2024 RailTick. All rights reserved.</p>
    </div>
</footer>

</body>

</html>
