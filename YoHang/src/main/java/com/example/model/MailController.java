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
	public String sendMail(MembersTO to , HttpServletRequest request) {
		SimpleMailMessage message = new SimpleMailMessage();
		message.setTo( request.getParameter( "mail_to" ) );
		message.setText( request.getParameter( "mail_content" ) );
		message.setSubject( request.getParameter( "mail_title" ) );
		javaMailSender.send( message );
		
		return "home";
	}
	
	
	@ResponseBody
	@RequestMapping( "sendPw.do" )
	public void sendPw(@RequestParam String mail, String tempPassword) {
		SimpleMailMessage message = new SimpleMailMessage();
		//String tempPassword = getTempPassword();
		
		message.setTo( mail );
		message.setSubject( "YoHang 임시비밀번호 안내 메일입니다." );
		message.setText( "YoHang 임시비밀번호 안내 메일입니다.\n 귀하의 임시비밀번호는[ " + tempPassword + " ]입니다.\n 로그인 후 변경해 주세요." );
		
		javaMailSender.send( message );

	}
	
}
