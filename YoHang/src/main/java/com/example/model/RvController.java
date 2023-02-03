package com.example.model;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;


import com.example.model.RvBoardDAO;
import com.example.model.RvBoardTO;

@RestController
public class RvController {

	@Autowired
	private RvBoardDAO dao;
	
	@RequestMapping("/")
	public ModelAndView index() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("../../index");
		return modelAndView;
	}
	
	@RequestMapping("/list.do")
	public ModelAndView list(ModelAndView modelAndView) {
		ArrayList<RvBoardTO> rvLists = dao.rvList();
		
		modelAndView.setViewName("/review/board_list1");
		modelAndView.addObject("rvLists", rvLists);
		return modelAndView;
	}
	
	@RequestMapping("/view.do")
	public ModelAndView view(HttpServletRequest request, ModelAndView modelAndView) {
	
		RvBoardTO to = new RvBoardTO();
		
		to.setRv_seq(request.getParameter("rv_seq"));
		
		to = dao.rvView(to);
				
		modelAndView.setViewName("/review/board_view1");
		modelAndView.addObject("to", to);
		modelAndView.addObject("rv_seq", request.getParameter("rv_seq"));
		return modelAndView;
	}
	
	@RequestMapping("/write.do")
	public ModelAndView write(HttpServletRequest request, ModelAndView modelAndView) {
		modelAndView.setViewName("/review/board_write1");
		return modelAndView;
		
	}
	
	@RequestMapping("/write_ok.do")
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
		
		modelAndView.setViewName("/review/board_write1_ok");
		modelAndView.addObject("flag", flag);
		return modelAndView;
		
	}
}
