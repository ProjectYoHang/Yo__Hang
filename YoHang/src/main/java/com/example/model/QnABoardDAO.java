package com.example.model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.mapper.QnAMapperInter;

@Repository
public class QnABoardDAO {

	@Autowired
	private QnAMapperInter mapper;
	
	public void qnaWrite() {}
	
	public int qnaWriteOk(QnABoardTO to) {
		
		int flag = 1;
		
		int result = mapper.qnaWriteOk(to);
		if(result == 1) {
			flag = 0;
		}
		
		return flag;
	}
	
	// paging한 list 페이지
	public Map<String, Object> qnaList(QnABoardListTO listTo) {
		
		listTo.setTotalRecord(mapper.qnaAllCount());
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
		
		ArrayList<QnABoardTO> qnaLists = mapper.qnaList(listTo);
		
		// 마지막 페이지번호 = lastPage
		int lastPage = (int)(Math.ceil(totalRecord / recordPerPage)) + 1;

		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("qnaLists", qnaLists);
		resultMap.put("cpage", cpage);
		resultMap.put("lastPage", lastPage);
		resultMap.put("startPageNum", startPageNum);
		resultMap.put("lastPageNum", lastPageNum);
		resultMap.put("totalRecord", totalRecord);
		resultMap.put("recordPerPage", recordPerPage);
		
		return resultMap;
	}
	
	public QnABoardTO qnaView(QnABoardTO to) {
		
		mapper.qnaViewHit(to);
		
		to = mapper.qnaView(to);
		
		// Q&A에 대한 관리자의 답댓글도 viewpage에 보여야함
		// 따라서, qna_reply 테이블 데이터도 select 해와야 함
		
		
		return to;
	}
	
	public QnABoardTO qnaModify(QnABoardTO to) {
		
		to = mapper.qnaModify(to);
		
		return to;
	}
	
	public int qnaModifyOk(QnABoardTO to) {
		
		int flag = 2;
		
		int result = mapper.qnaModifyOk(to);
		
		if(result == 0) {
			flag = 1;
		} else if(result == 1) {
			flag = 0;
		}
		
		return flag;
	}
	
	public QnABoardTO qnaDelete(QnABoardTO to) {
		
		to = mapper.qnaDelete(to);
		
		return to;
	}
	
	public int qnaDeleteOk(QnABoardTO to) {
		
		int flag = 2;
		
		int result = mapper.qnaDeleteOk(to);
		
		if(result == 0) {
			flag = 1;
		} else if(result == 1) {
			flag = 0;
		}
		
		return flag;
	}
	
	
	// Q&A 답댓글 메서드
	
	// qna 답댓글 view
	public ArrayList<QnAReplyTO> qnaReplyView(QnAReplyTO to) {
		ArrayList<QnAReplyTO> qnaReplys = mapper.qnaReplyView(to);
		
		return qnaReplys;
	}
		
	// qna 답댓글 작성
	public int qnaReplyWriteOk(QnAReplyTO to, QnABoardTO bto) {
		mapper.qnaReplyyn(bto);
		
		int flag = 1;
		
		int result = mapper.qnaReplyWrite(to);
		if(result == 1) {
			flag = 0;
		}
		
		return flag;
	}
	
	
	
	
	
	
	
	
	
	
	
}

