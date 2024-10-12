<%@ page import="javax.mail.*,javax.mail.internet.InternetAddress,javax.mail.internet.MimeMessage,java.util.Properties" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String useremail =(String) session.getAttribute("email");

    String senderEmail = "rajatsaxena139@gmail.com";
    String recipientEmail = useremail; // Use the email retrieved from the session

    final String username = "rajatsaxena139@gmail.com"; // Set your Gmail username
    final String password = "wtcv iact zkhl wewy"; // Set your Gmail password

    Properties props = new Properties();
    props.put("mail.smtp.auth", "true");
    props.put("mail.smtp.starttls.enable", "true");
    props.put("mail.smtp.host", "smtp.gmail.com");
    props.put("mail.smtp.port", "587");

    Session mailSession = Session.getInstance(props, new Authenticator() {
        protected PasswordAuthentication getPasswordAuthentication() {
            return new PasswordAuthentication(username, password);
        }
    });

    try {
        Message message = new MimeMessage(mailSession);
        message.setFrom(new InternetAddress(senderEmail)); // Set sender's email
        message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(recipientEmail));
        message.setSubject("Leave Confirmation");
        message.setText("Your leave request has been accepted.");

        Transport.send(message);
        out.println("Email sent successfully to: " + recipientEmail);

        // Redirect after the email is sent
        response.sendRedirect("leaveAdmin.jsp");
    } catch (MessagingException e) {
        e.printStackTrace();
        out.println("Failed to send email.");
    }
%>
