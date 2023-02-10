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
	
}
