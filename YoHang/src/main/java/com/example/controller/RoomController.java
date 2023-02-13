package com.example.controller;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.example.model.BookDAO;
import com.example.model.BookListTO;
import com.example.model.BookTO;
import com.example.model.MembersTO;
import com.example.model.RoomTO;

@RestController
public class RoomController {

	@Autowired
	private BookDAO dao;
	
	@RequestMapping("/room/standard")
	// 체크인/체크아웃 데이터 디폴트값 넣어놔야 할 듯 : home에서 날짜 안 정하면 에러발생하겠지..
	public ModelAndView book1(HttpServletRequest request, ModelAndView modelAndView) {
		BookTO to = new BookTO();
		to.setCheckin_date(request.getParameter("checkin_date"));
		to.setCheckout_date(request.getParameter("checkout_date"));
		
		ArrayList<RoomTO> bookedRoomNums = dao.bookedRoomNum(to);
				
		modelAndView.setViewName("room/room_standard");
		modelAndView.addObject("bookedRoomNums", bookedRoomNums);
		modelAndView.addObject("checkin_date", request.getParameter("checkin_date"));
		modelAndView.addObject("checkout_date", request.getParameter("checkout_date"));
		
		return modelAndView;
	}
	
	@RequestMapping("/room/suite")
	public ModelAndView book2(HttpServletRequest request, ModelAndView modelAndView) {
		BookTO to = new BookTO();
		to.setCheckin_date(request.getParameter("checkin_date"));
		to.setCheckout_date(request.getParameter("checkout_date"));
		
		ArrayList<RoomTO> bookedRoomNums = dao.bookedRoomNum(to);
		
		modelAndView.setViewName("room/room_suite");
		modelAndView.addObject("bookedRoomNums", bookedRoomNums);
		return modelAndView;
	}
	
	@RequestMapping("/room/deluxe")
	public ModelAndView book3(HttpServletRequest request, ModelAndView modelAndView) {
		BookTO to = new BookTO();
		to.setCheckin_date(request.getParameter("checkin_date"));
		to.setCheckout_date(request.getParameter("checkout_date"));
		
		ArrayList<RoomTO> bookedRoomNums = dao.bookedRoomNum(to);
				
		modelAndView.setViewName("room/room_deluxe");
		modelAndView.addObject("bookedRoomNums", bookedRoomNums);
		return modelAndView;
	}

	@RequestMapping("/room/book_ok.do")
	// @RequestParam(value="room_seq", required=false) String room_seq, 
	public ModelAndView book_ok(HttpServletRequest request, ModelAndView modelAndView) {
		BookTO to = new BookTO();
		
		HttpSession session = request.getSession();
		
		MembersTO loginMember = (MembersTO)session.getAttribute("loginMember");
		
		to.setM_id(loginMember.getM_id());
		to.setCheckin_date(request.getParameter("checkin_date"));
		to.setCheckout_date(request.getParameter("checkout_date"));
		to.setRoom_seq(request.getParameter("room_seq"));
		to.setBook_rooms(request.getParameter("book_rooms"));
		to.setBook_head_count(request.getParameter("book_head_count"));
		to.setBook_cs_type(request.getParameter("book_cs_type"));
		
		int flag = dao.bookOk(to);
		
		modelAndView.setViewName("room/book_ok");
		modelAndView.addObject("flag", flag);
		return modelAndView;
	}
	
	// 회원별 예약목록
	@RequestMapping("/mypage/booklist.do")
	public ModelAndView bookedList(ModelAndView modelAndView, HttpServletRequest request) {
		BookTO to = new BookTO();
		
		// 로그인 상태에서 session에 저장된 아이디 가져옴
		HttpSession session = request.getSession();
		
		MembersTO loginMember = (MembersTO)session.getAttribute("loginMember");
		
		to.setM_id(loginMember.getM_id());
		
		ArrayList<BookTO> bookedList = dao.bookedList(to);
		
		modelAndView.setViewName("mypage/book_list");
		modelAndView.addObject("bookedList", bookedList);
		
		return modelAndView;
	}
	
	@RequestMapping("/mypage/bookDeleteOk.do")
	public ModelAndView bookDeleteOk1(ModelAndView modelAndView, HttpServletRequest request) {
		BookTO to = new BookTO();
		
		to.setBook_num(request.getParameter("book_num"));
		
		int flag = dao.bookDeleteOk(to);
		
		modelAndView.setViewName("mypage/book_delete_ok");
		modelAndView.addObject("flag", flag);
		return modelAndView;
	}
	
	// 관리자 예약관리 페이지 예약전체목록
	@RequestMapping("/Admin/book/list.do")
	public ModelAndView bookedListAll(ModelAndView modelAndView, @RequestParam(value="cpage", required=false, defaultValue="1") int cpage) {
		BookListTO listTo = new BookListTO();
		
		listTo.setCpage(cpage);
		
		Map<String, Object> map = dao.bookedListAll(listTo);
		
		modelAndView.setViewName("book_admin/book_list");
		
		modelAndView.addObject("bookedListAll", map.get("bookedListAll"));
		modelAndView.addObject("cpage", map.get("cpage"));
		modelAndView.addObject("lastPage", map.get("lastPage"));
		modelAndView.addObject("startPageNum", map.get("startPageNum"));
		modelAndView.addObject("lastPageNum", map.get("lastPageNum"));
		modelAndView.addObject("totalRecord", map.get("totalRecord"));
		modelAndView.addObject("recordPerPage", map.get("recordPerPage"));
		
		return modelAndView;
	}
	
	// 예약 취소
	@RequestMapping("/Admin/book/bookDeleteOk.do")
	public ModelAndView bookDeleteOk2(ModelAndView modelAndView, HttpServletRequest request) {
		BookTO to = new BookTO();
		
		to.setBook_num(request.getParameter("book_num"));
		
		int flag = dao.bookDeleteOk(to);
		
		modelAndView.setViewName("book_admin/book_delete_ok");
		modelAndView.addObject("flag", flag);
		return modelAndView;
	}
	
	
	// 마이페이지 임시
	@RequestMapping("/mypage")
	public ModelAndView mypage(ModelAndView modelAndView, HttpServletRequest request) {
		modelAndView.setViewName("mypage/mypage");
		
		return modelAndView;
	}
}
