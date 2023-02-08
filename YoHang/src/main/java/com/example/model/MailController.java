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
	public String sendMail( HttpServletRequest request) {
		SimpleMailMessage message = new SimpleMailMessage();
		
		MailTO to = new MailTO();
		to.setTitle( request.getParameter( "title") );
		to.setAddress( request.getParameter( "email" ) );
		to.setContent( request.getParameter( "content" ) );
		
		System.out.println( "to.getAddress" + to.getAddress() );
		message.setSubject( to.getTitle() );
		message.setTo( to.getAddress() );
		message.setText( to.getContent() );
		
		javaMailSender.send( message );
		
		return "/admin/members_list";
	}
	
	@ResponseBody
	@RequestMapping( "sendPw.do" )
	public void sendPw(@RequestParam String mail, String tempPassword) {
		SimpleMailMessage message = new SimpleMailMessage();
		
		message.setTo( mail );
		message.setSubject( "YoHang 임시비밀번호 안내 메일입니다." );
		message.setText( "YoHang 임시비밀번호 안내 메일입니다.\n 귀하의 임시비밀번호는[ " + tempPassword + " ]입니다.\n 로그인 후 변경해 주세요." );
		
		javaMailSender.send( message );
	}
	
	////////회원 리스트에서 메일 보내기 
	@RequestMapping( "writeMail.do" )
	public String writeMail() {
			
		return "admin/mail_write";
	}
}
