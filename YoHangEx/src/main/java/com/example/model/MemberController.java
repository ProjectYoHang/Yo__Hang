package com.example.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MemberController {
	
	@Autowired
	private MemberDAO dao;
	
	@RequestMapping ( "home.do")
	public String home() {
		return "home";
	}
	
	@RequestMapping ( "layout.do")
	public String layout() {
		return "layout";
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
		int flag = 2;
		
		HttpSession session = request.getSession();
		if ( to != null) {
			session.setAttribute( "to", to );
			flag = 0;
		}else {
			session.setAttribute( "to", null );
			flag = 1;
		}
		
		request.setAttribute("flag", flag);
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
	
	@RequestMapping ("check_id.do")
	@ResponseBody // 결과 값을 리턴할 때 사용?
	public int check_id(@RequestParam("id") String id) {
		MemberTO to = new MemberTO();
		to.setM_id( id );
		
		int result = dao.checkID( to );
		
		System.out.println( result );
		
		return result;
	}
	
	@RequestMapping( "signup_ok.do" )
	public String signup_ok(HttpServletRequest request) {
		MemberTO to = new MemberTO();
		to.setM_id( request.getParameter( "id" ) );
		to.setM_name( request.getParameter( "name" ) );
		to.setM_pw( request.getParameter( "password" ) );
		String phone = request.getParameter( "phone");
		phone = phone.replace("-","");
		System.out.println(phone.trim());
		to.setM_phone( phone.trim() );
		to.setM_email( request.getParameter( "mail" ) );
		to.setM_birth( request.getParameter( "birth" ) );
		to.setM_gender( request.getParameter( "gender" ) );
		//to.setM_kakao_id( request.getParameter( "NULL" ));
		
		int flag = dao.signup_ok( to );
		
		request.setAttribute( "flag", flag );
		
		return "signup_ok";
	}
	
	@RequestMapping( "login_kakao.do" )
	public String login_kakao() {
		
		return "login_kakao";
	}
	
	
}
