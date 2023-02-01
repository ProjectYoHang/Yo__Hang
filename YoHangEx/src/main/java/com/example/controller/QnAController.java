package com.example.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.example.model.QnABoardDAO;
import com.example.model.QnABoardTO;
import com.example.model.QnAReplyTO;

@RestController
public class QnAController {

	@Autowired
	private QnABoardDAO dao;
	
	@RequestMapping("/")
	public ModelAndView index() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("../../index");
		return modelAndView;
	}
	
	// 다른 게시판들도 있으니까 구분을 위해 qna 경로를 추가해줌
	/*
	@RequestMapping("/qna/list.do")
	public ModelAndView list(ModelAndView modelAndView) {
		ArrayList<QnABoardTO> qnaLists = dao.qnaList();
		
		modelAndView.setViewName("qna/qna_list");
		modelAndView.addObject("qnaLists", qnaLists);
		return modelAndView;
	}
	*/
	
	@RequestMapping("/qna/list.do") 
	public ModelAndView list(ModelAndView modelAndView) {
		
		
		modelAndView.setViewName("qna/qna_list");
		return modelAndView;
	}
	
	@RequestMapping("/qna/write.do")
	public String write() {
		return "qna/qna_write";
	}
	
	@RequestMapping("/qna/write_ok.do")
	public ModelAndView write_ok(HttpServletRequest request, ModelAndView modelAndView) {
		QnABoardTO to = new QnABoardTO();
		
		to.setQna_id(request.getParameter("qna_id"));
		to.setQna_subject(request.getParameter("qna_subject"));
		to.setQna_content(request.getParameter("qna_content"));
		to.setQna_pw(request.getParameter("qna_pw"));
		
		int flag = dao.qnaWriteOk(to);
		
		modelAndView.setViewName("qna/qna_write_ok");
		modelAndView.addObject("flag", flag);
		return modelAndView;
	}
	
	@RequestMapping("/qna/view.do")
	public ModelAndView view(HttpServletRequest request, ModelAndView modelAndView) {
	
		QnABoardTO to = new QnABoardTO();
		
		to.setQna_seq(request.getParameter("qna_seq"));
		
		to = dao.qnaView(to);
		
		QnAReplyTO rplTo = new QnAReplyTO();
		rplTo.setQna_seq(request.getParameter("qna_seq"));
		
		ArrayList<QnAReplyTO> qnaReplys = dao.qnaReplyView(rplTo);
				
		modelAndView.setViewName("qna/qna_view");
		modelAndView.addObject("to", to);
		modelAndView.addObject("qnaReplys", qnaReplys);
		modelAndView.addObject("qna_seq", request.getParameter("qna_seq"));
		return modelAndView;
	}
	
	@RequestMapping("/qna/modify.do")
	public ModelAndView modify(HttpServletRequest request, ModelAndView modelAndView) {
		QnABoardTO to = new QnABoardTO();
		
		to.setQna_seq(request.getParameter("qna_seq"));
		
		to = dao.qnaModify(to);
		
		modelAndView.setViewName("qna/qna_modify");
		modelAndView.addObject("to", to);
		modelAndView.addObject("qna_seq", request.getParameter("qna_seq"));
		return modelAndView;
	}
	
	@RequestMapping("/qna/modify_ok.do")
	public ModelAndView modify_ok(HttpServletRequest request, ModelAndView modelAndView) {
		QnABoardTO to = new QnABoardTO();
		
		to.setQna_subject(request.getParameter("qna_subject"));
		to.setQna_content(request.getParameter("qna_content"));
		to.setQna_seq(request.getParameter("qna_seq"));
		to.setQna_pw(request.getParameter("qna_pw"));
		
		int flag = dao.qnaModifyOk(to);
		
		modelAndView.setViewName("qna/qna_modify_ok");
		modelAndView.addObject("flag", flag);
		modelAndView.addObject("qna_seq", request.getParameter("qna_seq"));
		return modelAndView;
	}
	
	@RequestMapping("/qna/delete.do")
	public ModelAndView delete(HttpServletRequest request, ModelAndView modelAndView) {
		QnABoardTO to = new QnABoardTO();
		
		to.setQna_seq(request.getParameter("qna_seq"));
		
		to = dao.qnaDelete(to);
		
		modelAndView.setViewName("qna/qna_delete");
		modelAndView.addObject("to", to);
		modelAndView.addObject("qna_seq", request.getParameter("qna_seq"));
		return modelAndView;
	}
	
	@RequestMapping("/qna/delete_ok.do")
	public ModelAndView delete_ok(HttpServletRequest request, ModelAndView modelAndView) {
		QnABoardTO to = new QnABoardTO();
		
		to.setQna_seq(request.getParameter("qna_seq"));
		to.setQna_pw(request.getParameter("qna_pw"));
		
		int flag = dao.qnaDeleteOk(to);
		
		modelAndView.setViewName("qna/qna_delete_ok");
		modelAndView.addObject("flag", flag);
		return modelAndView;
	}
	
	// 답댓글 쓰기
	@RequestMapping("/qna/reply_write.do")
	public ModelAndView reply_write(HttpServletRequest request, ModelAndView modelAndView) {
		QnAReplyTO to = new QnAReplyTO();
		QnABoardTO bto = new QnABoardTO();
		
		to.setQna_seq(request.getParameter("qna_seq"));
		to.setQrpl_id(request.getParameter("qrpl_id"));
		to.setQrpl_content(request.getParameter("qrpl_content"));
		
		bto.setQna_seq(request.getParameter("qna_seq"));
				
		int flag = dao.qnaReplyWriteOk(to, bto);
		
		String qna_seq = request.getParameter("qna_seq");
		
		modelAndView.setViewName("qna_master/qna_master_reply_write");
		modelAndView.addObject("flag", flag);
		modelAndView.addObject("qna_seq", qna_seq);
		
		return modelAndView;
				
	}
}
