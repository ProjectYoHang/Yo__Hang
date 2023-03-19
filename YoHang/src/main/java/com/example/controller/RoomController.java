package com.example.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.example.model.BookDAO;
import com.example.model.BookListTO;
import com.example.model.BookTO;
import com.example.model.BookInfoTO;
import com.example.model.MembersTO;
import com.example.model.RoomTO;
import com.example.model.RvBoardDAO;
import com.example.model.RvBoardTO;

@RestController
public class RoomController {

	@Autowired
	private BookDAO dao;
	
	@Autowired
	private RvBoardDAO rdao;
	
	@RequestMapping("/room/standard")
	// 체크인/체크아웃 데이터 디폴트값 넣어놔야 할 듯 : home에서 날짜 안 정하면 에러발생하겠지..
	public ModelAndView book1(HttpServletRequest request, ModelAndView modelAndView) {
		BookTO to = new BookTO();
		to.setCheckin_date(request.getParameter("checkin_date"));
		to.setCheckout_date(request.getParameter("checkout_date"));
		
		ArrayList<RoomTO> bookedRoomNums = dao.bookedRoomNum(to);
				
		modelAndView.setViewName("room/room_standard");
		modelAndView.addObject("bookedRoomNums", bookedRoomNums);
		//modelAndView.addObject("checkin_date", request.getParameter("checkin_date"));
		//modelAndView.addObject("checkout_date", request.getParameter("checkout_date"));
		//modelAndView.addObject("head_count", request.getParameter("head_count"));
		
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
		//modelAndView.addObject("checkin_date", request.getParameter("checkin_date"));
		//modelAndView.addObject("checkout_date", request.getParameter("checkout_date"));
		
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
		//modelAndView.addObject("checkin_date", request.getParameter("checkin_date"));
		//modelAndView.addObject("checkout_date", request.getParameter("checkout_date"));
		
		return modelAndView;
	}

	@RequestMapping("/room/book_ok.do")
	// @RequestParam(value="room_seq", required=false) String room_seq, 
	// 객실이 복수선택 될 수 있으니까 List형으로 파라미터 받음
	public ModelAndView book_ok(@RequestParam List<String> room_seq, HttpServletRequest request, ModelAndView modelAndView) {
		BookTO to = new BookTO();
		
		HttpSession session = request.getSession();
		
		MembersTO loginMember = (MembersTO)session.getAttribute("loginMember");
		
		int flag = 1;
		
		// 체크박스에서 선택한 객실 갯수만큼 book 테이블에 예약데이터가 insert되어야 하므로 반복문 사용
		for(String seq : room_seq) {
			to.setM_id(loginMember.getM_id());
			to.setCheckin_date(request.getParameter("checkin_date"));
			to.setCheckout_date(request.getParameter("checkout_date"));
			to.setRoom_seq(seq);
			to.setBook_rooms(request.getParameter("book_rooms"));
			to.setBook_head_count(request.getParameter("book_head_count"));
			to.setBook_cs_type(request.getParameter("book_cs_type"));
			
			flag = dao.bookOk(to);
		}
		
		// 객실번호 다중선택 => bookInfo 테이블 insert
		BookInfoTO tto = new BookInfoTO();
		
		tto.setId(loginMember.getM_id());
		
		String rooms_seq1 = "";
		
		for(String seq : room_seq) {
			rooms_seq1 += seq + ",";
		}
		
		String rooms_seq = rooms_seq1.substring(0, rooms_seq1.length() - 1);
		
		tto.setRooms_seq(rooms_seq);
		
		tto.setHead_count(request.getParameter("book_head_count"));
		tto.setCheckin(request.getParameter("checkin_date"));
		tto.setCheckout(request.getParameter("checkout_date"));
		
		dao.bookInfo(tto);
		
		modelAndView.setViewName("room/book_ok");
		modelAndView.addObject("flag", flag);
		
		return modelAndView;
	}
	
	// 회원별 예약목록
	/*
	@RequestMapping("/mypage/booklist.do")
	public ModelAndView bookedList(ModelAndView modelAndView, HttpServletRequest request) {
		BookInfoTO to = new BookInfoTO();
		
		// 로그인 상태에서 session에 저장된 아이디 가져옴
		HttpSession session = request.getSession();
		
		MembersTO loginMember = (MembersTO)session.getAttribute("loginMember");
		
		to.setId(loginMember.getM_id());
		
		ArrayList<BookInfoTO> bookInfos = dao.bookInfos(to);
		
		modelAndView.setViewName("mypage/book_list");
		modelAndView.addObject("bookInfos", bookInfos);
		
		return modelAndView;
	}
	*/
	
	////////////
	@RequestMapping("/mypage/loadBookList.do")
	public Map<String, Object> bookedList(HttpServletRequest request) {
		BookInfoTO to = new BookInfoTO();
		
		// 로그인 상태에서 session에 저장된 아이디 가져옴
		HttpSession session = request.getSession();
		
		MembersTO loginMember = (MembersTO)session.getAttribute("loginMember");
		
		to.setId(loginMember.getM_id());
		
		ArrayList<BookInfoTO> bookInfos = dao.bookInfos(to);
		
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("bookInfos", bookInfos);
		
		return result;
	}
	
	@RequestMapping("/mypage/booklist.do")
	public ModelAndView bookedList() {
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.setViewName("mypage/book_list");
		return modelAndView;
	}
	
	// 예약 => 결제완료
	@RequestMapping("/mypage/updateStatus.do")
	public ModelAndView updateStatus(ModelAndView modelAndView, HttpServletRequest request) {
		BookInfoTO to = new BookInfoTO();
		
		to.setSeq(request.getParameter("seq"));
		
		dao.updateStatus(to);
		
		modelAndView.setViewName("mypage/book_list");
		
		return modelAndView;
	}
	
	// 환불 신청
	@RequestMapping("/mypage/refundReq.do")
	public ModelAndView refundReq(ModelAndView modelAndView, HttpServletRequest request) {
		BookInfoTO to = new BookInfoTO();
		
		to.setSeq(request.getParameter("seq"));
		
		dao.refundReq(to);
		
		modelAndView.setViewName("mypage/book_list");
		
		return modelAndView;	
	}
	
	// 관리자가 환불신청 확인 후 환불완료
	// bookInfo 테이블 status 컬럼값을 4로 변경 & book 테이블에서 예약된 객실 데이터 삭제
	@RequestMapping("/Admin/book/refundOk.do")
	public ModelAndView refundOk(ModelAndView modelAndView, HttpServletRequest request) {
		BookInfoTO to = new BookInfoTO();
		
		to.setSeq(request.getParameter("seq"));
		
		dao.refundOk(to);
		
		String rooms_seq = request.getParameter("rooms_seq");
		
		String[] room_seq = rooms_seq.split(",");
		
		int flag = 1;
		
		for(int i = 0; i<room_seq.length; i++) {
			BookTO bto = new BookTO();
			
			bto.setCheckin_date(request.getParameter("checkin"));
			bto.setCheckout_date(request.getParameter("checkout"));
			bto.setRoom_seq(room_seq[i]);
			
			flag = dao.bookDeleteOk(bto);
		}
		
		modelAndView.setViewName("book_admin/refundOk");
		modelAndView.addObject("flag", flag);
		
		return modelAndView;
	}
	
	// 회원측의 예약취소
	@RequestMapping("/mypage/bookDeleteOk.do")
	public ModelAndView bookDeleteOk1(ModelAndView modelAndView, HttpServletRequest request) {
		// 내 예약정보에 보이는 데이터 삭제(bookInfo) & book 테이블의 예약된 객실번호 정보 삭제 
		String rooms_seq = request.getParameter("rooms_seq");
		
		String[] room_seq = rooms_seq.split(",");
		
		int flag = 1;
		
		for(int i = 0; i<room_seq.length; i++) {
			BookTO to = new BookTO();
			
			to.setCheckin_date(request.getParameter("checkin"));
			to.setCheckout_date(request.getParameter("checkout"));
			to.setRoom_seq(room_seq[i]);
			
			flag = dao.bookDeleteOk(to);
		}
		
		BookInfoTO tto = new BookInfoTO();
		tto.setSeq(request.getParameter("seq"));
		
		dao.bookInfoDelete(tto);
		
		modelAndView.setViewName("mypage/book_delete_ok");
		modelAndView.addObject("flag", flag);
		return modelAndView;
	}
	
	// 관리자 예약관리 페이지 예약전체목록
	@RequestMapping("/Admin/book/list.do")
	public ModelAndView bookedListAll(ModelAndView modelAndView, @RequestParam(value="cpage", required=false, defaultValue="1") int cpage) {
		BookListTO listTo = new BookListTO();
		
		listTo.setCpage(cpage);
		
		Map<String, Object> map = dao.bookInfoAll(listTo);
		
		modelAndView.setViewName("book_admin/book_list");
		
		modelAndView.addObject("bookInfoAll", map.get("bookInfoAll"));
		modelAndView.addObject("cpage", map.get("cpage"));
		modelAndView.addObject("lastPage", map.get("lastPage"));
		modelAndView.addObject("startPageNum", map.get("startPageNum"));
		modelAndView.addObject("lastPageNum", map.get("lastPageNum"));
		modelAndView.addObject("totalRecord", map.get("totalRecord"));
		modelAndView.addObject("recordPerPage", map.get("recordPerPage"));
		
		return modelAndView;
	}
	
	// 관리자측 예약 취소
	@RequestMapping("/Admin/book/bookDeleteOk.do")
	public ModelAndView bookDeleteOk2(ModelAndView modelAndView, HttpServletRequest request) {
		String rooms_seq = request.getParameter("rooms_seq");
		
		String[] room_seq = rooms_seq.split(",");
		
		int flag = 1;
		
		for(int i = 0; i<room_seq.length; i++) {
			BookTO to = new BookTO();
			
			to.setCheckin_date(request.getParameter("checkin"));
			to.setCheckout_date(request.getParameter("checkout"));
			to.setRoom_seq(room_seq[i]);
			
			flag = dao.bookDeleteOk(to);
		}
		
		BookInfoTO tto = new BookInfoTO();
		tto.setSeq(request.getParameter("seq"));
		
		dao.bookInfoDelete(tto);
		
		modelAndView.setViewName("book_admin/book_delete_ok");
		modelAndView.addObject("flag", flag);
		return modelAndView;
	}
	
	
	// 마이페이지 임시
	@RequestMapping("/mypage")
	public ModelAndView mypage(ModelAndView modelAndView, HttpServletRequest request) {
		BookInfoTO to = new BookInfoTO();
		
		// 로그인 상태에서 session에 저장된 아이디 가져옴
		HttpSession session = request.getSession();
		
		MembersTO loginMember = (MembersTO)session.getAttribute("loginMember");
		
		to.setId(loginMember.getM_id());
		
		ArrayList<BookInfoTO> bookInfosMin = dao.bookInfosMin(to);
		

		RvBoardTO rto = new RvBoardTO();
		
		rto.setRv_id(loginMember.getM_id());
		
		ArrayList<RvBoardTO> rvInfo = rdao.rvInfo(rto);
		
		modelAndView.setViewName("mypage/mypage");
		modelAndView.addObject("bookInfosMin", bookInfosMin);
		modelAndView.addObject("rvInfo", rvInfo);

		
		return modelAndView;
	}
	


}

