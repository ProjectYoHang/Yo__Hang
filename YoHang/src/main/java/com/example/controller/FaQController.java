package com.example.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class FaQController {

	@RequestMapping("/faq/list.do")
	public ModelAndView faq() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("faq/faq_list");
		return modelAndView;
	}
	
}
