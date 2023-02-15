package com.example.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.example.model.room_typeTO;
import com.example.model.BookInfoTO;
import com.example.model.MembersTO;
import com.example.model.RvBoardDAO;
import com.example.model.RvBoardListTO;
import com.example.model.RvBoardTO;

@RestController
public class RvController {

	@Autowired
	private RvBoardDAO dao;


	@RequestMapping("/rv/list.do")
	public ModelAndView list(ModelAndView modelAndView, @RequestParam(value="cpage", required=false, defaultValue="1") int cpage) {
		RvBoardListTO listTo = new RvBoardListTO();
		
		listTo.setCpage(cpage);
		
		Map<String, Object> map = dao.rvList(listTo);
		
		modelAndView.setViewName("/rv/board_list1");
		
		modelAndView.addObject("rvLists", map.get("rvLists"));
		modelAndView.addObject("cpage", map.get("cpage"));
		modelAndView.addObject("lastPage", map.get("lastPage"));
		modelAndView.addObject("startPageNum", map.get("startPageNum"));
		modelAndView.addObject("lastPageNum", map.get("lastPageNum"));
		modelAndView.addObject("totalRecord", map.get("totalRecord"));
		modelAndView.addObject("recordPerPage", map.get("recordPerPage"));
		
		return modelAndView;
	}

	@RequestMapping("/rv/view.do")
	public ModelAndView view(HttpServletRequest request, ModelAndView modelAndView ) {

		RvBoardTO to = new RvBoardTO();

		to.setRv_seq(request.getParameter("rv_seq"));

		to = dao.rvView(to);

		modelAndView.setViewName("/rv/board_view1");
		modelAndView.addObject("to", to);
		modelAndView.addObject("rv_seq", request.getParameter("rv_seq"));
		modelAndView.addObject("cpage", request.getParameter("cpage"));
		return modelAndView;
	}

	@RequestMapping("/rv/write.do")
	public ModelAndView write(HttpServletRequest request, ModelAndView modelAndView) {
		modelAndView.setViewName("/rv/board_write1");
		return modelAndView;

	}

	@RequestMapping("/rv/write_ok.do")
	public ModelAndView write_ok(MultipartFile upload, HttpServletRequest request, ModelAndView modelAndView) {

		RvBoardTO to = new RvBoardTO();
		to.setRv_id(request.getParameter("rv_id"));
		to.setRv_subject(request.getParameter("rv_subject"));
		to.setRv_content(request.getParameter("rv_content"));
		to.setRv_room_seq( Integer.parseInt(request.getParameter("rv_room_seq")));
		to.setRv_book_num(Integer.parseInt(request.getParameter("rv_book_num")));
		to.setRv_stars(Integer.parseInt(request.getParameter("rv_stars")));
		to.setRv_like(Integer.parseInt(request.getParameter("rv_like")));

		try {
			if( !upload.isEmpty() ) {
				to.setRv_img_name( upload.getOriginalFilename() );	
				to.setRv_img_size( upload.getSize() );

				upload.transferTo( new File( upload.getOriginalFilename() ) );
			}
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch( IOException e ) {
			e.printStackTrace();			
		}

		int flag = dao.rvWriteOk( to );

		modelAndView.setViewName("/rv/board_write1_ok");
		modelAndView.addObject("flag", flag);
		return modelAndView;

	}
	
	@RequestMapping("/rv/delete.do")
	public ModelAndView delete(HttpServletRequest request, ModelAndView modelAndView) {
		RvBoardTO to = new RvBoardTO();
		
		to.setRv_seq(request.getParameter("rv_seq"));
		
		to = dao.rvDelete(to);
		
		modelAndView.setViewName("/rv/board_delete1");
		modelAndView.addObject("to", to);
		modelAndView.addObject("rv_seq", request.getParameter("rv_seq"));
		modelAndView.addObject("cpage", request.getParameter("cpage"));
		return modelAndView;
	}
	
	@RequestMapping("/rv/delete_ok.do")
	public ModelAndView delete_ok(HttpServletRequest request, ModelAndView modelAndView) {
		RvBoardTO to = new RvBoardTO();
		
		to.setRv_seq(request.getParameter("rv_seq"));
		
		int flag = dao.rvDeleteOk(to);
		
		modelAndView.setViewName("/rv/board_delete1_ok");
		modelAndView.addObject("flag", flag);
		modelAndView.addObject("cpage", request.getParameter("cpage"));
		return modelAndView;
	}
	@RequestMapping("/rv/modify.do")
	public ModelAndView modify(HttpServletRequest request, ModelAndView modelAndView) {
		RvBoardTO to = new RvBoardTO();
		
		to.setRv_seq(request.getParameter("rv_seq"));
		
		to = dao.rvModify(to);
		
		modelAndView.setViewName("/rv/board_modify1");
		modelAndView.addObject("to", to);
		modelAndView.addObject("rv_seq", request.getParameter("rv_seq"));
		modelAndView.addObject("cpage", request.getParameter("cpage"));
		return modelAndView;
	}
	
	@RequestMapping("/rv/modify_ok.do")
	public ModelAndView modify_ok(MultipartFile upload, HttpServletRequest request, ModelAndView modelAndView) {
		
		RvBoardTO to = new RvBoardTO();
		
		to.setRv_seq(request.getParameter("rv_seq"));
		to.setRv_subject(request.getParameter("rv_subject"));
		to.setRv_content(request.getParameter("rv_content"));
		
		//to.setRv_img_name(request.getParameter("rv_img_name"));
		//to.setRv_img_size(Integer.parseInt(request.getParameter("rv_img_size")));
		
		try {
			if( !upload.isEmpty() ) {
				to.setRv_img_name( upload.getOriginalFilename() );	
				to.setRv_img_size( upload.getSize() );

				upload.transferTo( new File( upload.getOriginalFilename() ) );
			}
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch( IOException e ) {
			e.printStackTrace();			
		}
		
		int flag = dao.rvModifyOk(to);
		
		modelAndView.setViewName("/rv/board_modify1_ok");
		modelAndView.addObject("flag", flag);
		modelAndView.addObject("rv_seq", request.getParameter("rv_seq"));
		modelAndView.addObject("cpage", request.getParameter("cpage"));
		return modelAndView;
		
	}
	

	
	@RequestMapping("/search.do")
	public room_typeTO serach(@RequestParam String roomname,@RequestParam String head_count) {
		room_typeTO to = new room_typeTO();
		
		
		to.setRoom_name(roomname);
		
		to = dao.Search(to);
		
		System.out.println( roomname );
		
		return to;
		
	}
	
	@RequestMapping("/mypage/review.do")
	public ModelAndView rvlist(ModelAndView modelAndView, HttpServletRequest request) {
		RvBoardTO to = new RvBoardTO();
		
		HttpSession session = request.getSession();
		
		MembersTO loginMember = (MembersTO)session.getAttribute("loginMember");
		
		to.setRv_id(loginMember.getM_id());
		
		ArrayList<RvBoardTO> rvInfos = dao.rvInfo(to);
		
		modelAndView.setViewName("mypage/review_list");
		modelAndView.addObject("rvInfos", rvInfos);
		return modelAndView;
	}
	
	// 회원측 리뷰 삭제
	@RequestMapping("/mypage/rvDeleteOk.do")
	public ModelAndView rvdeleteOk(ModelAndView modelAndView, HttpServletRequest request) {
		RvBoardTO to = new RvBoardTO();
		
		to.setRv_seq(request.getParameter("rv_seq"));
		
		int flag = dao.reviewDelete(to);
		
		modelAndView.setViewName("mypage/review_delete_ok");
		modelAndView.addObject("flag", flag);
		
		return modelAndView;
	}

}