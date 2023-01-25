package com.example.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MemberController {
	
	@Autowired
	private MemberDAO dao;
	
	@RequestMapping ( "home.do")
	public String home() {
		return "home";
	}
	
	@RequestMapping ( "login.do" )
	public String login() {
		return "login";
	}
	
	@RequestMapping ("login_ok.do" )
	public String login_ok(HttpServletRequest request) {
		MemberTO to = new MemberTO(); 
		to.setM_id( request.getParameter( "id" ) );
		to.setM_pw( request.getParameter( "password" ) );
		
		to = dao.login(to);
		
		HttpSession session = request.getSession();
		
		if ( to != null) {
			session.setAttribute( "to", to );
		}else {
			session.setAttribute( "to", null );
		}
		
		return "login_ok";
	}
	
	@RequestMapping ("logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		System.out.println( "session연결 종료");
		return "home";
	}

	@RequestMapping ("signup.do")
	public String signup(HttpServletRequest request) {
		
		
		return "signup";
	}
	
	@RequestMapping( "signup_ok.do" )
	public String signup_ok(HttpServletRequest request) {
		MemberTO to = new MemberTO();
		to.setM_id( request.getParameter( "id" ) );
		to.setM_name( request.getParameter( "name" ) );
		to.setM_pw( request.getParameter( "password" ) );
		to.setM_phone( request.getParameter( "phone") );
		to.setM_email( request.getParameter( "mail1" ) + "@" + request.getParameter( "email" ) );
		to.setM_birth( request.getParameter( "birth" ) );
		to.setM_gender( request.getParameter( "gender" ) );
		
		int flag = dao.signup_ok( to );
		
		request.setAttribute( "flag", flag );
		
		return "signup_ok";
	}
	
	@RequestMapping( "login_kakao.do" )
	public String login_kakao() {
		
		return "login_kakao";
	}
	
	
}
