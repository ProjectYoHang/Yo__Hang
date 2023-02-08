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
	
	public int qnaDeleteOk(QnABoardTO to, QnAReplyTO rto) {
		
		int flag = 2;
		
		// 답댓글이 달려있는 상태의 글을 삭제하는 경우 답댓글이 먼저 삭제되어야 함
		if(mapper.qnaReplyNum(to) == 1) {
			mapper.qnaReplyDeleteOk(rto);
		}
		
		int result = mapper.qnaDeleteOk(to);
		
		if(result == 0) {
			flag = 1;
		} else if(result == 1) {
			flag = 0;
		}
		
		return flag;
	}
	
	
	// Q&A 답댓글 메서드
	
	// 관리자측 qna list
	public Map<String, Object> qnaReplyList(QnABoardListTO listTo) {
		listTo.setTotalRecord(mapper.qnaAllCount());
		int totalRecord = listTo.getTotalRecord();
		
		int cpage = listTo.getCpage();
		
		int recordPerPage = listTo.getRecordPerPage();
		
		listTo.setStartPageNum(1);
		int startPageNum = listTo.getStartPageNum();
		
		listTo.setLastPageNum(recordPerPage);
		int lastPageNum = listTo.getLastPageNum();
		
		int startRow = (cpage - 1) * recordPerPage;
		
		listTo.setStartRow(startRow);
		listTo.setRecordPerPage(recordPerPage);
		
		ArrayList<QnABoardTO> qnaLists = mapper.qnaList(listTo);
		
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
	

	// qna 답댓글 view에서 사용자의 qna 부분
	public QnABoardTO qnaReplyView1(QnABoardTO to) {
		
		QnABoardTO qna = mapper.qnaReplyView1(to);
		
		return qna;
	}
	
	// qna 답댓글 view에서 답댓글 부분
	public QnAReplyTO qnaReplyView2(QnAReplyTO to) {
		
		QnAReplyTO qnaReplys = mapper.qnaReplyView2(to);
		
		return qnaReplys;
	}
		
	// qna 답댓글 작성
	public int qnaReplyWriteOk(QnAReplyTO to, QnABoardTO bto) {
		mapper.qnaReplyy(bto);
		
		int flag = 1;
		
		int result = mapper.qnaReplyWrite(to);
		if(result == 1) {
			flag = 0;
		}
		
		return flag;
	}
	
	// qna 답댓글 삭제
	public int qnaReplyDeleteOk(QnAReplyTO rto, QnABoardTO to) {
		int flag = 1;
		
		int result = mapper.qnaReplyDeleteOk(rto);
		
		if(result == 0) {
			flag = 1;
		} else if(result == 1) {
			flag = 0;
			
			// 답댓글 삭제되면 사용자 게시판에 다시 답변대기 상태로 변경
			mapper.qnaReplyn(to);
		}
		
		return flag;
	}
	
	// qna 답댓글 수정
	public int qnaReplyModifyOk(QnAReplyTO to) {
		int flag = 1;
		
		int result = mapper.qnaReplyModifyOk(to);
		
		if(result == 0) {
			flag = 1;
		} else if(result == 1) {
			flag = 0;
		}
		
		return flag;
	} 
	
	
	
	
}

