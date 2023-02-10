package com.example.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class RoomController {

	@RequestMapping("/room/standard")
	public ModelAndView book1() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("room/room_standard");
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
