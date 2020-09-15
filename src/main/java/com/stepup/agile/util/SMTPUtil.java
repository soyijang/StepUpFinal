package com.stepup.agile.util;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.Properties;

@Component("smtpUtil")
public class SMTPUtil {

//    @Autowired
//    private JavaMailSender mailSender;

    private SMTPUtil() {}

    public void sendMail(String subject, String content, String fromUser, String toUser, String[] toCc, String fileName, String filePath, String imgPath) {
        try {

            Properties props = System.getProperties();
            props.put("mail.smtp.host", "smtp.naver.com");
            props.put("mail.smtp.port", 465);
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.ssl.enable", "true");
            props.put("mail.smtp.ssl.trust", "smtp.naver.com");

            Session session = Session.getInstance(props, new javax.mail.Authenticator() {
                String un = "iinoasuka@naver.com";
                String pw = "ysk!!0622";

                protected javax.mail.PasswordAuthentication getPasswordAuthentication() {
                    return new javax.mail.PasswordAuthentication(un, pw);

                }
            });

            String recipient = toUser;

            session.setDebug(true); //for debug
            Message mimeMessage = new MimeMessage(session); //MimeMessage 생성

            mimeMessage.setFrom(new InternetAddress(fromUser)); //발신자 셋팅 , 보내는 사람의 이메일주소를 한번 더 입력합니다. 이때는 이메일 풀 주소를 다 작성해주세요.
            mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(recipient)); //수신자셋팅 //.TO 외에 .CC(참조) .BCC(숨은참조) 도 있음
            mimeMessage.setSubject("agile로 초대합니다."); //제목셋팅
            mimeMessage.setText("agile로 초대합니다."); //내용셋팅
            Transport.send(mimeMessage);


        } catch (MessagingException e) {
        	e.printStackTrace();
//            throw new RuntimeException("SendMail Fail");

        } catch (Exception e) {
        	e.printStackTrace();

        }
    }
}