package com.laptrinhjavaweb.util;

import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class EmailUtils {
	// Email: quangtrinhhuynh02@gmail.com
	// Password: snvrqopjhhrptbgb
	
	final static String from = "quangtrinhhuynh02@gmail.com";
	final static String password = "snvrqopjhhrptbgb";
	
	public static void sendEmail(String to, String tieuDe, String noiDung) {
		

		// Properties : khai báo các thuộc tính

		Properties props = new Properties();
		props.put("mail.smtp.host", "smtp.gmail.com"); // SMTP HOST
		props.put("mail.smtp.port:", "587"); // TLS:587, SSL:465
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");

		// create Authenticator
		Authenticator auth = new Authenticator() {

			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(from, password);
			}
		};

		// Session của Email (để gửi mail)
		Session session = Session.getInstance(props, auth);
		// Thông qua thuộc tính "props" và tài khoản "auth" (để gửi email)

		// Bắt đầu Gửi Email

		// Tạo một tin nhắn
		MimeMessage msg = new MimeMessage(session);
		try {
			// Kiểu nội dung
			msg.addHeader("Content-type", "text/HTML; charset=UTF-8");
			// Người gửi
			msg.setFrom(from);
			// Người nhận
			msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to, false));
			// Tiêu đề email
			msg.setSubject(tieuDe, "UTF-8");
			// Quy định ngày gửi
			msg.setSentDate(new Date());

			// Quy định email nhận phản hồi
//			msg.setReplyTo(InternetAddress.parse(from, false));
			
			// Nội dung email
			msg.setContent(noiDung, "text/html; charset=UTF-8");
			// Gửi email
			Transport.send(msg);
			System.out.println("Gửi email thành công");
		} catch (MessagingException e) {
			e.printStackTrace();
			System.out.println("Gửi email thất bại");	
		}
	}

}
