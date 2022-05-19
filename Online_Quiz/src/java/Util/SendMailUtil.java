/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Util;

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

    private static Message htmlForm(Session session, String account, String to) {
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
                + "                <a href=\"https://www.google.com/\">Click here</a> to join\n"
                + "            </p>\n"
                + "\n"
                + "            <p>Online Quiz Group</p>\n"
                + "        </div>\n"
                + "    </div>\n"
                + "</body>\n"
                + "</html>";

        try {
//            File file = new File("");
//            String currentDirectory = file.getAbsolutePath();

            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(account));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
            message.setSubject("Test!");
//
//            File myObj = new File("filename.txt");
//            Scanner myReader = new Scanner(myObj);
//            while (myReader.hasNextLine()) {
//                String data = myReader.nextLine();
//                System.out.println(data);
//            }
//            myReader.close();
            message.setContent(content, "text/html; charset=UTF-8");
            return message;
        } catch (MessagingException mex) {
            System.out.println(mex);
        }
        return null;
    }

    public void sendHTMLEmail(final String to) throws MessagingException {
        final String account = "onlinequizo275@gmail.com";

        Properties properties = System.getProperties();
        properties.put("mail.smtp.host", "smtp.gmail.com");
        properties.put("mail.smtp.port", "587");
        properties.put("mail.smtp.starttls.enable", "true");
        properties.put("mail.smtp.auth", "true");

        Session session = Session.getInstance(properties, new javax.mail.Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication("onlinequizo275@gmail.com", "admin@123s");
            }
        });

        session.setDebug(true);
        Message message = htmlForm(session, account, to);
        Transport.send(message);
    }

    public static void main(String[] args) throws MessagingException {
        SendMailUtil send = new SendMailUtil();
            send.sendHTMLEmail("onlinequizo275@gmail.com");

//        File file = new File("");
//        String currentDirectory = file.getAbsolutePath();
//        System.out.println("Current working directory : " + currentDirectory);
    }
}
