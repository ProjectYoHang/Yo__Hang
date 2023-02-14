package com.example.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.example.model.AdminsDAO;
import com.example.model.AdminsTO;
import com.example.model.room_typeTO;

@Controller
public class AdminController {

	@Autowired
	private AdminsDAO dao;
	
	
	//@RequestMapping ("/admin/admin_home.do")
	//public String admin_home() {
		//return "/admin/admin_home";
	//}
	

	@RequestMapping("/admin/admin_login.do")
	public String admin_login() {
		return "/admin/admin_login";
	}
	
	@RequestMapping("/admin/admin_login_ok.do")
	public String admin_login_ok( HttpServletRequest request) {
		
		AdminsTO loginAdmin = new AdminsTO();
		loginAdmin.setAdmin_id( request.getParameter( "admin_id" ) );
		loginAdmin.setAdmin_pw( request.getParameter( "admin_pw" ) );
		int flag = dao.admin_login(loginAdmin); 
		
		HttpSession session = request.getSession();

		
		if ( flag == 1) { // 가져온 정보가 있다면 세션에 등록?
			session.setAttribute( "loginAdmin", loginAdmin );
		}else {	// 가져온 정보가 없다면..
			session.setAttribute( "loginAdmin", null );
		}
		
		request.setAttribute("flag", flag);
		return "/admin/admin_login_ok";
	}
	
	@RequestMapping("/Admin/logout.do")
	public String admin_logout_ok(HttpSession session) {
		session.invalidate();
		
		return "/admin/admin_logout_ok";
	}
	
	
	// 관리자측 객실관리 메뉴 - 객실목록
	@RequestMapping("/Admin/room/list.do")
	public ModelAndView roomType(HttpServletRequest request, ModelAndView modelAndView) {
		ArrayList<room_typeTO> roomType = dao.roomType();
		
		modelAndView.setViewName("room_admin/room_admin_list");
		modelAndView.addObject("roomType", roomType);
		
		return modelAndView;
	}
}