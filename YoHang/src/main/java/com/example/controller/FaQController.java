package com.example.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.example.model.FaqBoardDAO;
import com.example.model.FaqBoardListTO;
import com.example.model.FaqBoardTO;

@RestController
public class FaQController {

	@Autowired
	private FaqBoardDAO dao;

	@RequestMapping("/faq/list.do")
	public ModelAndView list(ModelAndView modelAndView, @RequestParam(value="cpage", required=false, defaultValue="1") int cpage) {
		FaqBoardListTO listTo = new FaqBoardListTO();
		
		listTo.setCpage(cpage);
		
		Map<String, Object> map = dao.faqList(listTo);
		
		modelAndView.setViewName("faq/faq_list");
		
		modelAndView.addObject("faqLists", map.get("faqLists"));
		modelAndView.addObject("cpage", map.get("cpage"));
		modelAndView.addObject("lastPage", map.get("lastPage"));
		modelAndView.addObject("startPageNum", map.get("startPageNum"));
		modelAndView.addObject("lastPageNum", map.get("lastPageNum"));
		modelAndView.addObject("totalRecord", map.get("totalRecord"));
		modelAndView.addObject("recordPerPage", map.get("recordPerPage"));
		
		return modelAndView;
	}

	
// ------------------------------------- 관리자
	

	@RequestMapping("/Admin/faq/list.do")
	public ModelAndView admin_notice_list(ModelAndView modelAndView, @RequestParam(value="cpage", required=false, defaultValue="1") int cpage) {
		FaqBoardListTO listTo = new FaqBoardListTO();
		
		listTo.setCpage(cpage);
		
		Map<String, Object> map = dao.faqList(listTo);
		
		modelAndView.setViewName("faq_admin/faq_admin_list");
		
		modelAndView.addObject("faqLists", map.get("faqLists"));
		modelAndView.addObject("cpage", map.get("cpage"));
		modelAndView.addObject("lastPage", map.get("lastPage"));
		modelAndView.addObject("startPageNum", map.get("startPageNum"));
		modelAndView.addObject("lastPageNum", map.get("lastPageNum"));
		modelAndView.addObject("totalRecord", map.get("totalRecord"));
		modelAndView.addObject("recordPerPage", map.get("recordPerPage"));
		
		return modelAndView;
	}

	@RequestMapping("/Admin/faq/write.do")
	public ModelAndView write() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("faq_admin/faq_admin_write");
		return modelAndView;
	}

	@RequestMapping("/Admin/faq/write_ok.do")
	public ModelAndView write_ok(MultipartFile upload, HttpServletRequest request, ModelAndView modelAndView) {
		FaqBoardTO to = new FaqBoardTO();

		to.setFaq_subject(request.getParameter("faq_subject"));
		to.setFaq_content(request.getParameter("faq_content"));

		int flag = dao.faqWriteOk( to );

		modelAndView.setViewName("faq_admin/faq_admin_write_ok");
		modelAndView.addObject("flag", flag);
		
		return modelAndView;
	}
	
	@RequestMapping("/Admin/faq/view.do")
	public ModelAndView view(HttpServletRequest request, ModelAndView modelAndView ) {
		FaqBoardTO to = new FaqBoardTO();

		to.setFaq_seq(request.getParameter("faq_seq"));

		to = dao.faqView(to);

		modelAndView.setViewName("faq_admin/faq_admin_view");
		modelAndView.addObject("to", to);
		modelAndView.addObject("faq_seq", request.getParameter("faq_seq"));
		modelAndView.addObject("cpage", request.getParameter("cpage"));
		return modelAndView;
	}
	
	@RequestMapping("/Admin/faq/delete.do")
	public ModelAndView delete(HttpServletRequest request, ModelAndView modelAndView) {
		FaqBoardTO to = new FaqBoardTO();
		
		to.setFaq_seq(request.getParameter("faq_seq"));
		
		to = dao.faqDelete(to);
		
		modelAndView.setViewName("faq_admin/faq_admin_delete");
		modelAndView.addObject("to", to);
		modelAndView.addObject("faq_seq", request.getParameter("faq_seq"));
		modelAndView.addObject("cpage", request.getParameter("cpage"));
		return modelAndView;
	}
	
	@RequestMapping("/Admin/faq/delete_ok.do")
	public ModelAndView delete_ok(HttpServletRequest request, ModelAndView modelAndView) {
		FaqBoardTO to = new FaqBoardTO();
		
		to.setFaq_seq(request.getParameter("faq_seq"));
		
		int flag = dao.faqDeleteOk(to);
		
		modelAndView.setViewName("faq_admin/faq_admin_delete_ok");
		modelAndView.addObject("flag", flag);
		modelAndView.addObject("cpage", request.getParameter("cpage"));
		return modelAndView;
	}
	@RequestMapping("/Admin/faq/modify.do")
	public ModelAndView modify(HttpServletRequest request, ModelAndView modelAndView) {
		FaqBoardTO to = new FaqBoardTO();
		
		to.setFaq_seq(request.getParameter("faq_seq"));
		
		to = dao.faqModify(to);
		
		modelAndView.setViewName("faq_admin/faq_admin_modify");
		modelAndView.addObject("to", to);
		modelAndView.addObject("faq_seq", request.getParameter("faq_seq"));
		modelAndView.addObject("cpage", request.getParameter("cpage"));
		return modelAndView;
	}
	
	@RequestMapping("/Admin/faq/modify_ok.do")
	public ModelAndView modify_ok(HttpServletRequest request, ModelAndView modelAndView) {
		FaqBoardTO to = new FaqBoardTO();
		
		to.setFaq_seq(request.getParameter("faq_seq"));
		to.setFaq_subject(request.getParameter("faq_subject"));
		to.setFaq_content(request.getParameter("faq_content"));
		
		int flag = dao.faqModifyOk(to);
		
		modelAndView.setViewName("faq_admin/faq_admin_modify_ok");
		modelAndView.addObject("flag", flag);
		modelAndView.addObject("faq_seq", request.getParameter("faq_seq"));
		modelAndView.addObject("cpage", request.getParameter("cpage"));
		return modelAndView;
		
	}
	
}
