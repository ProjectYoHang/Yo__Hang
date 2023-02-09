package com.example.model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MemberController {
	
	@Autowired
	private MembersDAO dao;
	
	@RequestMapping ( "test.do" )
	public String test() {
		return "test";
	}
	
	@RequestMapping ( "layout.do")
	public String layout() {
		return "layout";
	}
	
	@RequestMapping ( "home.do")
	public String home() {
		return "home";
	}
	@RequestMapping ( "aboutus.do")
	public String aboutus() {
		return "aboutus";
	}
	@RequestMapping ( "findus.do")
	public String findus() {
		return "findus";
	}
	
	@RequestMapping ( "/Admin/home.do")
	public String admin_home() {
		return "home_admin";
	}
	
////////////////// 로그인 /////////////////////////	
	@RequestMapping ( "login.do" )
	public String login() {
		return "login";
	}
	@RequestMapping ("login_ok.do" )
	public String login_ok(HttpServletRequest request) {
		MembersTO loginMember = new MembersTO(); 
		loginMember.setM_id( request.getParameter( "id" ) );
		loginMember.setM_pw( request.getParameter( "password" ) );
		
		/// 입력된 정보를 토대로 테이블에서 정보 가져오기
		loginMember = dao.login(loginMember);
		int flag = 2;
		
		HttpSession session = request.getSession();
		
		if ( loginMember != null) { // 가져온 정보가 있다면 세션에 등록?
			session.setAttribute( "loginMember", loginMember );
			flag = 0;
		}else {	// 가져온 정보가 없다면..
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
		return "logout_ok";
	}
	
////////////////회원가입 /////////////////////////	
	@RequestMapping ("signup.do")
	public String signup(HttpServletRequest request) {
		return "signup";
	}
	
	@RequestMapping( "signup_ok.do" )
	public String signup_ok(HttpServletRequest request) {
		String kakao_id = request.getParameter("kakao_id");
		System.out.println("kakaoid : " + kakao_id);
		MembersTO to = new MembersTO();
		int flag = 2;
		if( kakao_id != "" ) {// 카카오 로그인 사용자 회원가입
			
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
			to.setM_kakao_id(kakao_id);
			flag = dao.signup_kakaoMember_ok(to);
			
		} else {// 일반 회원가입
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
			flag = dao.signup_ok( to );
		}
		request.setAttribute( "flag", flag );
		return "signup_ok";
	}
	
	@RequestMapping ("check_id.do")
	@ResponseBody // 결과 값을 리턴할 때 사용?
	public int check_id(@RequestParam("id") String id) {
		MembersTO to = new MembersTO();
		to.setM_id( id );
		
		int result = dao.checkID( to );
		
		System.out.println( result );
		
		return result;
	}

//////////////// 회원정보 /////////////////////////
	@RequestMapping( "mypage/list.do")
	public String member_info(HttpServletRequest request) {
		MembersTO to = new MembersTO();
		to = dao.memberInfo(to);
		request.setAttribute("to", to);
		return "./member/member_info";
	}
//////////////// 정보수정 /////////////////////////	
	@RequestMapping("/mypage/member_info_modify_ok.do" )
	public String member_info_modify_ok(HttpServletRequest request) {
			MembersTO to = new MembersTO();
			int flag = 2;
			if( request.getParameter( "pw" ) == "" || request.getParameter( "pw" ) == null  ) {
				to.setM_id( request.getParameter( "id" ) );
				to.setM_email( request.getParameter( "email" ) );
				to.setM_phone( request.getParameter( "phone" ) );
				
				System.out.println( "1번 들어왔음  : " + request.getParameter( "pw") );
				flag = dao.memberInfo_modify_ok(to);
			} else {
				to.setM_id( request.getParameter( "id" ) );
				to.setM_pw( request.getParameter( "pw" ) );
				to.setM_email( request.getParameter( "email" ) );
				to.setM_phone( request.getParameter( "phone" ) );
				System.out.println( "2번 들어왔음  : " + request.getParameter( "pw") );
				flag = dao.memberInfo_modify_ok_withPassword(to);
			}
			
			request.setAttribute( "flag", flag );
			
		return "./member/member_info_modify_ok";
	}
//////////////// 탈퇴 /////////////////////////
	@RequestMapping( "mypage/member_signout_ok.do")
	public String member_signout_ok( HttpServletRequest request, HttpSession session ) {
		MembersTO to = new MembersTO();
		to.setM_id( request.getParameter( "id" ) );
		int flag = dao.signout_ok(to);
		
		request.setAttribute( "flag", flag );
		session.invalidate();
		return "./member/member_signout_ok";
	}
/////////////////// 카카오 ///
	@RequestMapping ("kakao_login.do")
	public String kakao_login(HttpServletRequest request, @RequestParam String kakao_id) {
		System.out.println( kakao_id );
		
		MembersTO to = new MembersTO();
		to.setM_kakao_id( kakao_id );
		
		System.out.println( " to.kakao_id :" + to.getM_kakao_id());
		// 로그인된 카카오 아이디를 가져와서 멤버테이블에 확인..
		to = dao.checkKakaoId(to);
		
		//해당 카카오 아이디가 등록된 회원이
		if( to != null ) {
			// 있다면 해당 정보로  세션 로그인처리? 
			HttpSession session = request.getSession();
			session.setAttribute( "loginMember", to );
			return "home";
			//return "login_ok";
		} else {
			//없다면 kakao_id가지고 회원가입...
			request.setAttribute("kakao_id", kakao_id);
			return "signup";
		}
	}
	
///// 마이페이지 - 카카오 연동 버튼 클릭
	@RequestMapping( "mypage/kakao_connect.do" )
	public String kakao_connect(@RequestParam String kakao_id,@RequestParam String m_id) {
		MembersTO to = new MembersTO();
		to.setM_id(m_id);
		to.setM_kakao_id(kakao_id);
		System.out.println(to.getM_kakao_id() );
		System.out.println(to.getM_id() );
		int flag = dao.insert_Kakao(to);
		
		if( flag != 0) {
			System.out.println( "연동실패" );
			return "/member/member_info";
		}
		return "/member/member_info";
	}
	
	/// 아이디 / 비밀번호 찾기 ///
////////// 아이디로 메일  가져오기
	@ResponseBody
	@RequestMapping ( "find_pw.do" ) // 찾으려는 아이디에 해당하는 메일은 하나
	public MembersTO pull_mail(@RequestParam String id) {
		MembersTO to = new MembersTO();
		to.setM_id(id);
		to = dao.pullMail(to);

		// 임시 비밀번호 생성 
		String tempPassword = getTempPassword();
		// 임시 비밀번호도 같이 넣어어 보내준다.
		to.setM_pw(tempPassword);
		to.setM_id(id);
		// 임시 비밀번호로 변경 
		dao.modifyPassword(to);
		
		return to;
	}
	
//////// 이름으로 id 가져오기 
	@ResponseBody
	@RequestMapping ( "find_id.do" ) //같은 이름으로 되어있는 아이디가 여럿일 수 있다.
	public ArrayList<MembersTO> pull_id(@RequestParam String name) {
		MembersTO to = new MembersTO();
		to.setM_name(name);
		
		ArrayList<MembersTO> idList = dao.pullId(to);
		
		return idList;
	}
	
////////// 회원관리  -  리스트  불러오기 ////////
	
//// 페이징.....
	@RequestMapping ( "loadList.do" )
	@ResponseBody
	public Map<String, Object> members_loadList1(@RequestParam(value="cpage", required=false, defaultValue="1") int cpage){
		MemberListTO listTo = new MemberListTO();
		listTo.setCpage(cpage);
		Map<String, Object> result = dao.list_member(listTo);
		
		return result;
	}
	
//////// 회원관리 리스트페이지 ///////
	@RequestMapping ( "members_list.do" )
	public String member_list() {
		return "/admin/members_list";
	}
	
	
	
/////// 회원관리 회원삭제 //////
	
	@RequestMapping ( "memberDelete.do" )
	@ResponseBody
	public int member_delete(@RequestParam String m_id) {
		MembersTO to = new MembersTO();
		to.setM_id(m_id);
		
		int flag = dao.signout_ok(to);
		
		return flag;
	}
	
////////////////////////////// 임시비밀번호 생성 ///////////////
	  public String getTempPassword(){
	      char[] charSet = new char[] { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F',
	              'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z',
	              '!', '@', '#', '$', '%'};

	      String str = "";

	      // 문자 배열 길이만큼  랜덤으로 10개의 값을  뽑아 구문을 작성함
	      int idx = 0;
	      for (int i = 0; i < 10; i++) {
	          idx = (int) (charSet.length * Math.random());
	          str += charSet[idx];
	       }
	       return str;
	   }
}
