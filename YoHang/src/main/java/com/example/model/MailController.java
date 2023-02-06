package com.example.model;

import javax.servlet.http.HttpServletRequest;

import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.AllArgsConstructor;


@AllArgsConstructor
@Controller
public class MailController {
	
	private JavaMailSender javaMailSender;
	
	@RequestMapping ("/sendMail.do")
	public String sendMail(MemberTO to , HttpServletRequest request) {
		SimpleMailMessage message = new SimpleMailMessage();
		message.setTo( request.getParameter( "mail_to" ) );
		message.setText( request.getParameter( "mail_content" ) );
		message.setSubject( request.getParameter( "mail_title" ) );
		javaMailSender.send( message );
		
		return "home";
	}
	
	
	@ResponseBody
	@RequestMapping( "sendPw.do" )
	public void sendPw(@RequestParam String mail) {
		SimpleMailMessage message = new SimpleMailMessage();
		message.setTo( mail );
		message.setText( "111" );
		message.setSubject( "YoHang에서.." );
		javaMailSender.send( message );

	}
}
