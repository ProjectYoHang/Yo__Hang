package com.example.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.example.model.BookDAO;
import com.example.model.BookTO;
import com.example.model.RoomTO;

@RestController
public class RoomController {

	@Autowired
	private BookDAO dao;
	
	@RequestMapping("/room/standard")
	public ModelAndView book1(HttpServletRequest request, ModelAndView modelAndView) {
		BookTO to = new BookTO();
		to.setCheckin_date(request.getParameter("checkin_date"));
		to.setCheckout_date(request.getParameter("checkout_date"));
		
		ArrayList<RoomTO> bookedRoomNums = dao.bookedRoomNum(to);
				
		modelAndView.setViewName("room/room_standard");
		modelAndView.addObject("bookedRoomNums", bookedRoomNums);
		
		return modelAndView;
	}
	
	@RequestMapping("/room/suite")
	public ModelAndView book2() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("room/room_suite");
		return modelAndView;
	}
	
	@RequestMapping("/room/deluxe")
	public ModelAndView book3() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("room/room_deluxe");
		return modelAndView;
	}

}
