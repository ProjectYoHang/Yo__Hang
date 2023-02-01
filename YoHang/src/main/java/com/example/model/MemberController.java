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
	
	@RequestMapping ( "layout.do")
	public String layout() {
		return "layout";
	}
	
	@RequestMapping ( "home.do")
	public String home() {
		return "home";
	}
////////////////// 로그인 /////////////////////////	
	@RequestMapping ( "login.do" )
	public String login() {
		return "login";
	}
	@RequestMapping ("login_ok.do" )
	public String login_ok(HttpServletRequest request) {
		MemberTO loginMember = new MemberTO(); 
		loginMember.setM_id( request.getParameter( "id" ) );
		loginMember.setM_pw( request.getParameter( "password" ) );
		
		loginMember = dao.login(loginMember);
		int flag = 2;
		
		HttpSession session = request.getSession();
		if ( loginMember != null) {
			session.setAttribute( "loginMember", loginMember );
			flag = 0;
		}else {
			session.setAttribute( "loginMember", null );
			flag = 1;
		}
		
		request.setAttribute("flag", flag);
		return "login_ok";
	}
////////////////로그아웃 /////////////////////////
	@RequestMapping ("logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		System.out.println( "session연결 종료");
		return "home";
		
	}

	
////////////////회원가입 /////////////////////////	
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
//////////////// 회원정보 /////////////////////////
	@RequestMapping( "member_info.do")
	public String member_info(HttpServletRequest request) {
		MemberTO to = new MemberTO();
		to = dao.memberInfo(to);
		request.setAttribute("to", to);
		return "./member/member_info";
	}
//////////////// 정보수정 /////////////////////////	
	@RequestMapping( "member_info_modify_ok.do" )
	public String member_info_modify_ok(HttpServletRequest request) {
			MemberTO to = new MemberTO();
			to.setM_id( request.getParameter( "id" ) );
			to.setM_pw( request.getParameter( "pw" ) );
			to.setM_email( request.getParameter( "email" ) );
			to.setM_phone( request.getParameter( "phone" ) );
			int flag = dao.memberInfo_modify_ok(to);
			request.setAttribute( "flag", flag );
			
		return "./member/member_info_modify_ok";
	}
//////////////// 탈퇴 /////////////////////////
	@RequestMapping( "member_signout_ok.do")
	public String member_signout_ok( HttpServletRequest request, HttpSession session ) {
		MemberTO to = new MemberTO();
		to.setM_id( request.getParameter( "id" ) );
		int flag = dao.signout_ok(to);
		
		request.setAttribute( "flag", flag );
		session.invalidate();
		return "./member/member_signout_ok";
	}
/////////////////// 카카오 ///
	@RequestMapping ("kakao_login.do")
	public String kakao_login(HttpServletRequest request) {
		
		System.out.println( request.getParameter( "id" ) );
		
		MemberTO to = new MemberTO();
		to.setM_kakao_id( request.getParameter( "id" ) );
		////////// 정보있으면 뭐든하기
		
		return "kakao_login_ok";
	}
	
}
