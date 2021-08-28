package com.bteam.test.service;

import java.util.Random;

import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.bteam.test.model.User;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class MailService {

	private JavaMailSender mailSender;
	private static final String FROM_ADDRESS = "yekim801@gmail.com";
	
	private final int pwdLength = 10;
	private final char[] pwdCode = {
			'a','b','c','d','e','f','g','2','3','4','5','!','#','^','+'
	};
	
	public void mailSend(String email, String username, User user) {
			
		SimpleMailMessage message = new SimpleMailMessage();
		
		message.setTo(email);
		message.setFrom(MailService.FROM_ADDRESS);
		message.setSubject("서비스 임시 비밀번호입니다.");
		message.setText(username + "님의 임시 비밀번호는 " + createPw() + " 입니다.");
		
		mailSender.send(message);
		
		user.setPassword(createPw());
	}
	
	public String createPw() {
		
		Random random = new Random(System.currentTimeMillis());
		
		int codeLength = pwdCode.length;
		
		StringBuffer buf = new StringBuffer(); 
		
		for(int i = 0; i < pwdLength; i++) {
			buf.append(pwdCode[random.nextInt(codeLength)]);
		}
		
		return buf.toString(); 
	}
}
