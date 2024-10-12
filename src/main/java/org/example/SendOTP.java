package org.example;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.io.PrintWriter;
import java.util.Properties;
import java.util.Random;

public class SendOTP {

    public static String getOtp() {
        return otp;
    }

    static String otp;
    public static void email(String email){

        try {
//            String userEmail = "ravithakur1872003@gmail.com";
//            String userEmail = "saxerjt790@gmail.com";

            String userEmail =email;
            final String username = "rajatsaxena139@gmail.com"; // Set your Gmail username
            final String password = "wtcv iact zkhl wewy"; // Set your Gmail password

            Properties props = new Properties();
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.starttls.enable", "true");
            props.put("mail.smtp.host", "smtp.gmail.com");
            props.put("mail.smtp.port", "587");

            Session session = Session.getInstance(props, new Authenticator() {
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(username, password);
                }
            });

            otp = generateOTP();
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(username));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(userEmail));
            message.setSubject("Your OTP for Verification");
            message.setText("Your OTP is: " + otp);

            Transport.send(message);

        } catch (MessagingException e) {
            e.printStackTrace();

        } finally {

        }
    }
    private static String generateOTP() {
        Random random = new Random();
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < 6; i++) {
            sb.append(random.nextInt(10));
        }
        return sb.toString();
    }
}
