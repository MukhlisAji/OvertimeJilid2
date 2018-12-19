/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Email;

import controllers.EmployeeController;
import controllers.EmployeeControllerInterface;
import java.io.IOException;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import org.hibernate.Hibernate;
import org.hibernate.SessionFactory;
import tools.HibernateUtil;

/**
 *
 * @author Mukhlish
 */
public class sendEmail {
    private SessionFactory factory = HibernateUtil.getSessionFactory();
    
    public void sent(boolean confirm){
        
        try {
            String text = "";
            Properties properties = new Properties();
            properties.put("mail.smtp.host", "smtp.gmail.com");
            properties.put("mail.smtp.auth", "true");
            properties.put("mail.smtp.ssl.enable", "true");
            properties.put("mail.smtp.port", "465");//default port smptp

            Session session = Session.getInstance(properties);
            session.setDebug(true);
            EmployeeControllerInterface eci = new EmployeeController(factory);

            MimeMessage message = new MimeMessage(session);
            message.setFrom("bccamp.21@gmail.com");
            String email = "";
            message.setRecipient(Message.RecipientType.TO, new InternetAddress("mukhlish.purnomo@gmail.com"));
            message.setSubject("Overtime Confirmation");
            if (confirm) {
                text = "Congratulaton, your overtime request has been approved, please check the following url for the details https://www.google.com/ ";
                System.out.println(text);
            }else {
                text = "Sorry, your overtime request has been denied. please recheck your application";
                System.out.println(text);
            }
            message.setText(text);
            String username = "bccamp.21@gmail.com"; 
            String password = "!Bootcamp2018";
            Transport.send(message, username, password);
        } catch (MessagingException ex) {
            ex.printStackTrace();
        }
    }

  
}
