package com.example.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class ChatController {

	@RequestMapping("/chat")
	public ModelAndView chat() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("chatting/chatting");
		return modelAndView;
	}
	
}
