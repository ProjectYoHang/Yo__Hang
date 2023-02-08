package com.example.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class ChatController {

	@RequestMapping("/mychat")
	public ModelAndView chat() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("book/chatting");
		return modelAndView;
	}
	
	@RequestMapping("/book1")
	public ModelAndView book1() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("book/book");
		return modelAndView;
	}
	
	@RequestMapping("/book2")
	public ModelAndView book2() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("book/book2");
		return modelAndView;
	}
}
