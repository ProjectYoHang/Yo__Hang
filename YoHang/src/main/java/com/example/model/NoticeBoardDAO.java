package com.example.model;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.mapper.NoticeMapperinter;
import com.example.mapper.RvMapperinter;

@Repository
public class NoticeBoardDAO {

	//private String uploadPath = "/Users/hyobinjin/git/Yo__Hang/YoHang/src/main/webapp/upload/notices";
	private String uploadPath = "/wjddnr0709/tomcat/webapps/ROOT/upload/reviews";
	@Autowired
	private NoticeMapperinter mapper;

	public void noticeWrite() {}

	public int noticeWriteOk( NoticeBoardTO to ) {
		int flag = 1;
		int result = mapper.noticeWriteOk(to);
		
		if(result == 1 ) {
			flag = 0;
		}

		return flag;
	}
	
	// paging한 list 페이지
	public Map<String, Object> noticeList(NoticeBoardListTO listTo) {
		listTo.setTotalRecord(mapper.noticeAllCount());
		int totalRecord = listTo.getTotalRecord();
		
		// 현재 페이지
		int cpage = listTo.getCpage();
		
		// 한 페이지에 보여줄 데이터 갯수 = 10
		int recordPerPage = listTo.getRecordPerPage();
		
		// 처음 보여줄 첫번째 페이지 번호
		listTo.setStartPageNum(1);
		int startPageNum = listTo.getStartPageNum();
		
		listTo.setLastPageNum(recordPerPage);
		// 한 페이지에 보여줄 마지막 페이지번호
		int lastPageNum = listTo.getLastPageNum();
		
		
		int startRow = (cpage - 1) * recordPerPage;
		
		listTo.setStartRow(startRow);
		listTo.setRecordPerPage(recordPerPage);
		
		ArrayList<NoticeBoardTO> noticeLists = mapper.noticeList(listTo);
		
		// 마지막 페이지번호 = lastPage
		int lastPage = (int)(Math.ceil(totalRecord / recordPerPage)) + 1;

		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("noticeLists", noticeLists);
		resultMap.put("cpage", cpage);
		resultMap.put("lastPage", lastPage);
		resultMap.put("startPageNum", startPageNum);
		resultMap.put("lastPageNum", lastPageNum);
		resultMap.put("totalRecord", totalRecord);
		resultMap.put("recordPerPage", recordPerPage);
		
		return resultMap;
	}
	
	public NoticeBoardTO noticeView(NoticeBoardTO to) {
		mapper.noticeViewHit(to);
		to = mapper.noticeView(to);
	
		return to;
	}
	
	public NoticeBoardTO noticeDelete(NoticeBoardTO to) {
		to = mapper.noticeDelete(to);
		return to;
	}

	public int noticeDeleteOk(NoticeBoardTO to) {	
		String oldFilename = mapper.noticeFileName(to);
		int flag = 2;
		int result = mapper.noticeDeleteOk(to);
		
		if(result == 0) {
			flag = 1;
		} else if(result == 1) {
			flag = 0;
			
			File file = new File(uploadPath, oldFilename);
			file.delete();
		}
		return flag;
	}
	
	public NoticeBoardTO noticeModify(NoticeBoardTO to) {	
		to = mapper.noticeModify(to);	
		return to;
	}
	
	public int noticeModifyOk(NoticeBoardTO to) {
		String oldFilename = mapper.noticeFileName(to);
		int flag = 2;
		System.out.println( "0" + flag );
		
		// 기존 파일이 있는 경우
		if(oldFilename != null) {
			// 기존 파일이 있으면서 파일 변경이 있는 경우
			if(to.getNt_file_name() != null) {
				int result = mapper.noticeModifyOk1(to);
				
				System.out.println( "1" + flag );
				if(result == 1) {
					flag = 0;
					
					File file = new File(uploadPath, oldFilename);
					file.delete();
					
				} else {
					flag = 1;
					
					File file = new File(uploadPath, to.getNt_file_name());
					file.delete();	
				}
				
			// 기존 파일 있으면서 파일변경 X
			} else {
				int result = mapper.noticeModifyOk2(to);
				
				if(result == 1) {
					flag = 0;
				} else {
					flag = 1;
				}
			}
		
		// 기존 파일이 없는 경우
		} else {
			// 파일을 새로 업로드하는 경우
			if(to.getNt_file_name() != null) {
				int result = mapper.noticeModifyOk3(to);
				
				if(result == 1) {
					flag = 0;
				} else {
					flag = 1;
					
					File file = new File(uploadPath, to.getNt_file_name());
					file.delete();
				}
			} else {
				int result = mapper.noticeModifyOk4(to);
				
				if(result == 1) {
					flag = 0;
				} else {
					flag = 1;
				}	
			}
		}
		
		return flag;
	}
	
}