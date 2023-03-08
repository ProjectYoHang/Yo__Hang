package com.example.model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.mapper.FaqMapperinter;

@Repository
public class FaqBoardDAO {
	
	@Autowired
	private FaqMapperinter mapper;

	public void faqWrite() {}

	public int faqWriteOk( FaqBoardTO to ) {
		int flag = 1;
		int result = mapper.faqWriteOk(to);
		
		if(result == 1 ) {
			flag = 0;
		}

		return flag;
	}
	
	// paging한 list 페이지
	public Map<String, Object> faqList(FaqBoardListTO listTo) {
		listTo.setTotalRecord(mapper.faqAllCount());
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
		
		ArrayList<FaqBoardTO> faqLists = mapper.faqList(listTo);
		
		// 마지막 페이지번호 = lastPage
		int lastPage = (int)(Math.ceil(totalRecord / recordPerPage)) + 1;

		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("faqLists", faqLists);
		resultMap.put("cpage", cpage);
		resultMap.put("lastPage", lastPage);
		resultMap.put("startPageNum", startPageNum);
		resultMap.put("lastPageNum", lastPageNum);
		resultMap.put("totalRecord", totalRecord);
		resultMap.put("recordPerPage", recordPerPage);
		
		return resultMap;
	}
	
	public FaqBoardTO faqView(FaqBoardTO to) {
		//mapper.faqViewHit(to);
		to = mapper.faqView(to);
	
		return to;
	}
	
	public FaqBoardTO faqDelete(FaqBoardTO to) {
		to = mapper.faqDelete(to);
		return to;
	}

	public int faqDeleteOk(FaqBoardTO to) {	
		int flag = 2;
		int result = mapper.faqDeleteOk(to);
		
		if(result == 0) {
			flag = 1;
		} else if(result == 1) {
			flag = 0;
		}
		return flag;
	}
	
	public FaqBoardTO faqModify(FaqBoardTO to) {	
		to = mapper.faqModify(to);	
		return to;
	}
	
	public int faqModifyOk(FaqBoardTO to) {
		int flag = 1;
		
		int result = mapper.faqModifyOk(to);
		
		if(result == 0) {
			flag = 1;
		} else if(result == 1) {
			flag = 0;
		}
		
		return flag;
	}
	
}