/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Util;

import static Util.ReadFileUtil.getDirPath;
import static Util.ReadFileUtil.readFileToString;
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
 * @author hongd
 */
public class SendMailUtil {

    private static Message htmlForm(Session session, String account, String to, String filename) {
        String path = getDirPath().trim() + "\\web\\"+filename;
        final String content = readFileToString(path);
        
        try {
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(account));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
            message.setSubject("Hello");
            message.setContent(content, "text/html; charset=UTF-8");
            return message;
        } catch (MessagingException mex) {
            System.out.println(mex);
        }
        return null;
    }

    public void sendHTMLEmail(final String to, String filename) throws MessagingException {
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

        session.setDebug(true);
        Message message = htmlForm(session, account, to, filename);
        Transport.send(message);
    }

    public static void main(String[] args) throws MessagingException {
        SendMailUtil send = new SendMailUtil();
            send.sendHTMLEmail("onlinequizo275@gmail.com","mail.html");

    }
}
