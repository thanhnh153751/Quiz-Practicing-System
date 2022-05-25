/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package util;

import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;



/**
 *
 * @author PREDATOR
 */
public class SendMailUtil {
    
    private static Message htmlForm(Session session, String account, String to, String subject, String link) {
        final String content = "<!DOCTYPE html>\n"
                + "<html lang=\"en\">\n"
                + "<head>\n"
                + "    <meta charset=\"UTF-8\">\n"
                + "    \n"
                + "</head>\n"
                + "<body>\n"
                + "    <div class=\"form\">\n"
                + "        <div class=\"content\">\n"
                + "            <h1>Online Quiz</h1>\n"
                + "            <p>Please active your account first to join with us!\n"
                + "                <a href=\""+link+"\">Click here</a> to join\n"
                + "            </p>\n"
                + "\n"
                + "            <p>Quiz Online</p>\n"
                + "        </div>\n"
                + "    </div>\n"
                + "</body>\n"
                + "</html>";

        try {
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(account));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
            message.setSubject(subject);
            message.setContent(content, "text/html; charset=UTF-8");
            return message;
        } catch (MessagingException mex) {
            System.out.println(mex);
        }
        return null;
    }

    public void sendHTMLEmail(final String to, final String subject, final String link) throws MessagingException {
        final String account = "onlinequizo275@gmail.com";
        final String password = "admin@123s";
        Properties properties = System.getProperties();
        properties.put("mail.smtp.host", "smtp.gmail.com");
        properties.put("mail.smtp.port", "587");
        properties.put("mail.smtp.starttls.enable", "true");
        properties.put("mail.smtp.auth", "true");

        Session session = Session.getInstance(properties, new javax.mail.Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(account, password);
            }
        });

//        session.setDebug(true);
        Message message = htmlForm(session, account, to, subject, link);
        Transport.send(message);
    }

//    public static void main(String[] args) throws MessagingException {
//        SendMailUtil send = new SendMailUtil();
//        send.sendHTMLEmail("onlinequizo275@gmail.com", "Online Quiz - Confirm Account", "https://www.youtube.com/watch?v=37-70wUrEDs");
//
//    }
}