package com.example.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.example.model.NoticeBoardDAO;
import com.example.model.NoticeBoardListTO;
import com.example.model.NoticeBoardTO;

@RestController
public class NoticeController {

	@Autowired
	private NoticeBoardDAO dao;

	@RequestMapping("/notice/list.do")
	public ModelAndView list(ModelAndView modelAndView, @RequestParam(value="cpage", required=false, defaultValue="1") int cpage) {
		NoticeBoardListTO listTo = new NoticeBoardListTO();
		
		listTo.setCpage(cpage);
		
		Map<String, Object> map = dao.noticeList(listTo);
		
		modelAndView.setViewName("notice/notice_list");
		
		modelAndView.addObject("noticeLists", map.get("noticeLists"));
		modelAndView.addObject("cpage", map.get("cpage"));
		modelAndView.addObject("lastPage", map.get("lastPage"));
		modelAndView.addObject("startPageNum", map.get("startPageNum"));
		modelAndView.addObject("lastPageNum", map.get("lastPageNum"));
		modelAndView.addObject("totalRecord", map.get("totalRecord"));
		modelAndView.addObject("recordPerPage", map.get("recordPerPage"));
		
		return modelAndView;
	}
	
	@RequestMapping("/notice/view.do")
	public ModelAndView notice_view(HttpServletRequest request, ModelAndView modelAndView) {
		NoticeBoardTO to = new NoticeBoardTO();
		
		to.setNt_seq(request.getParameter("nt_seq"));
		to = dao.noticeView(to);
				
		modelAndView.setViewName("notice/notice_view");
		modelAndView.addObject("to", to);
		modelAndView.addObject("nt_seq", request.getParameter("nt_seq"));
		modelAndView.addObject("cpage", request.getParameter("cpage"));
		return modelAndView;
	}
	
	
	
// ------------------------------------- 관리자
	

	@RequestMapping("/Admin/notice/list.do")
	public ModelAndView admin_notice_list(ModelAndView modelAndView, @RequestParam(value="cpage", required=false, defaultValue="1") int cpage) {
		NoticeBoardListTO listTo = new NoticeBoardListTO();
		
		listTo.setCpage(cpage);
		
		Map<String, Object> map = dao.noticeList(listTo);
		
		modelAndView.setViewName("notice_admin/notice_admin_list");
		
		modelAndView.addObject("noticeLists", map.get("noticeLists"));
		modelAndView.addObject("cpage", map.get("cpage"));
		modelAndView.addObject("lastPage", map.get("lastPage"));
		modelAndView.addObject("startPageNum", map.get("startPageNum"));
		modelAndView.addObject("lastPageNum", map.get("lastPageNum"));
		modelAndView.addObject("totalRecord", map.get("totalRecord"));
		modelAndView.addObject("recordPerPage", map.get("recordPerPage"));
		
		return modelAndView;
	}

	@RequestMapping("/Admin/notice/write.do")
	public ModelAndView write() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("notice_admin/notice_admin_write");
		return modelAndView;
	}

	@RequestMapping("/Admin/notice/write_ok.do")
	public ModelAndView write_ok(MultipartFile upload, HttpServletRequest request, ModelAndView modelAndView) {
		NoticeBoardTO to = new NoticeBoardTO();
		
		to.setNt_id(request.getParameter("nt_id"));
		to.setNt_subject(request.getParameter("nt_subject"));
		to.setNt_content(request.getParameter("nt_content"));
		
		UUID uuid = UUID.randomUUID();

		try {
//			if( !upload.isEmpty() ) {
//				to.setNt_file_name( upload.getOriginalFilename() );	
//				to.setNt_file_size( upload.getSize() );
//
//				upload.transferTo( new File( upload.getOriginalFilename() ) );
//			}
			if( !upload.isEmpty() ) {
				String extention = upload.getOriginalFilename().substring(upload.getOriginalFilename().indexOf("."));		
				String filename = upload.getOriginalFilename().substring(0, upload.getOriginalFilename().indexOf("."));
				to.setNt_file_name( filename + uuid.toString() + extention);
				
				to.setNt_file_size( upload.getSize() );
				upload.transferTo( new File( to.getNt_file_name()) );
			}
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch( IOException e ) {
			e.printStackTrace();			
		}

		int flag = dao.noticeWriteOk( to );

		modelAndView.setViewName("notice_admin/notice_admin_write_ok");
		modelAndView.addObject("flag", flag);
		
		return modelAndView;
	}
	
	@RequestMapping("/Admin/notice/view.do")
	public ModelAndView view(HttpServletRequest request, ModelAndView modelAndView ) {
		NoticeBoardTO to = new NoticeBoardTO();

		to.setNt_seq(request.getParameter("nt_seq"));

		to = dao.noticeView(to);

		modelAndView.setViewName("notice_admin/notice_admin_view");
		modelAndView.addObject("to", to);
		modelAndView.addObject("nt_seq", request.getParameter("nt_seq"));
		modelAndView.addObject("cpage", request.getParameter("cpage"));
		return modelAndView;
	}
	
	@RequestMapping("/Admin/notice/delete.do")
	public ModelAndView delete(HttpServletRequest request, ModelAndView modelAndView) {
		NoticeBoardTO to = new NoticeBoardTO();
		
		to.setNt_seq(request.getParameter("nt_seq"));
		
		to = dao.noticeDelete(to);
		
		modelAndView.setViewName("notice_admin/notice_admin_delete");
		modelAndView.addObject("to", to);
		modelAndView.addObject("nt_seq", request.getParameter("nt_seq"));
		modelAndView.addObject("cpage", request.getParameter("cpage"));
		return modelAndView;
	}
	
	@RequestMapping("/Admin/notice/delete_ok.do")
	public ModelAndView delete_ok(HttpServletRequest request, ModelAndView modelAndView) {
		NoticeBoardTO to = new NoticeBoardTO();
		
		to.setNt_seq(request.getParameter("nt_seq"));
		
		int flag = dao.noticeDeleteOk(to);
		
		modelAndView.setViewName("notice_admin/notice_admin_delete_ok");
		modelAndView.addObject("flag", flag);
		modelAndView.addObject("cpage", request.getParameter("cpage"));
		return modelAndView;
	}
	
	@RequestMapping("/Admin/notice/modify.do")
	public ModelAndView modify(HttpServletRequest request, ModelAndView modelAndView) {
		NoticeBoardTO to = new NoticeBoardTO();
		
		to.setNt_seq(request.getParameter("nt_seq"));
		
		to = dao.noticeModify(to);
		
		modelAndView.setViewName("notice_admin/notice_admin_modify");
		modelAndView.addObject("to", to);
		modelAndView.addObject("nt_seq", request.getParameter("nt_seq"));
		modelAndView.addObject("cpage", request.getParameter("cpage"));
		return modelAndView;
	}
	
	@RequestMapping("/Admin/notice/modify_ok.do")
	public ModelAndView modify_ok(MultipartFile upload, HttpServletRequest request, ModelAndView modelAndView) {
		NoticeBoardTO to = new NoticeBoardTO();
		
		to.setNt_seq(request.getParameter("nt_seq"));
		to.setNt_subject(request.getParameter("nt_subject"));
		to.setNt_content(request.getParameter("nt_content"));
		
		UUID uuid = UUID.randomUUID();
		
		try {
//			if( !upload.isEmpty() ) {
//				to.setNt_file_name( upload.getOriginalFilename() );	
//				to.setNt_file_size( upload.getSize() );
//
//				upload.transferTo( new File( upload.getOriginalFilename() ) );
//			}
			if( !upload.isEmpty() ) {
				String extention = upload.getOriginalFilename().substring(upload.getOriginalFilename().indexOf("."));		
				String filename = upload.getOriginalFilename().substring(0, upload.getOriginalFilename().indexOf("."));
				to.setNt_file_name( filename + uuid.toString() + extention);
				
				to.setNt_file_size( upload.getSize() );
				upload.transferTo( new File( to.getNt_file_name()) );
			}
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch( IOException e ) {
			e.printStackTrace();
		}
		
		int flag = dao.noticeModifyOk(to);
		
		modelAndView.setViewName("notice_admin/notice_admin_modify_ok");
		modelAndView.addObject("flag", flag);
		modelAndView.addObject("nt_seq", request.getParameter("nt_seq"));
		modelAndView.addObject("cpage", request.getParameter("cpage"));

		return modelAndView;
		
	}	
	
	
	
// ------------- 파일 다운로드
    // 파일 다운로드 처리
    @RequestMapping("/fileDownload/{file}")
    public void fileDownload(@PathVariable String file, HttpServletResponse response) throws IOException {
        File f = new File("/Users/hyobinjin/git/Yo__Hang/YoHang/src/main/webapp/upload/reviews/", file);
        // file 다운로드 설정
        response.setContentType("application/download");
        response.setContentLength((int)f.length());
        response.setHeader("Content-disposition", "attachment;filename=\"" + file + "\"");
        // response 객체를 통해서 서버로부터 파일 다운로드
        OutputStream os = response.getOutputStream();
        // 파일 입력 객체 생성
        FileInputStream fis = new FileInputStream(f);
        FileCopyUtils.copy(fis, os);
        fis.close();
        os.close();
    }
    
    
}