package com.example.model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.mapper.BookMapperInter;

@Repository
public class BookDAO {

	@Autowired
	private BookMapperInter mapper;
	
	// 이미 해당 체크인, 체크아웃 날짜에 예약되어 있는 객실번호 추출
	public ArrayList<RoomTO> bookedRoomNum(BookTO to) {
		
		String checkin_date = to.getCheckin_date();
		String checkout_date = to.getCheckout_date();
		
		to.setCheckin_date(checkin_date);
		to.setCheckout_date(checkout_date);
		
		ArrayList<RoomTO> bookedRoomNums = mapper.bookedRoomNum(to);
		
		return bookedRoomNums;
	}
	
	// 예약
	public int bookOk(BookTO to) {
		
		int flag = 1;

		int result = mapper.bookOk(to);
		if(result == 1) {
			flag = 0;
		}
		
		return flag;
	}
	
	// 예약 삭제
	public int bookDeleteOk(BookTO to) {
		int flag = 1;
		
		int result = mapper.bookDeleteOk(to);
		if(result == 1) {
			flag = 0;
		}
		
		return flag;
	}
	
	// 회원별 예약목록
	public ArrayList<BookTO> bookedList(BookTO to) {
		String m_id = to.getM_id();
		
		to.setM_id(m_id);
		
		ArrayList<BookTO> bookedList = mapper.bookedList(to);
		
		return bookedList;
	}
	
	
	
	// 관리자페이지 예약목록
	public Map<String, Object> bookedListAll(BookListTO listTo) {
		listTo.setTotalRecord(mapper.bookAllCount());
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
		
		ArrayList<BookTO> bookedListAll = mapper.bookedListAll(listTo);
		
		int lastPage = (int)(Math.ceil(totalRecord/recordPerPage))+1;
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("bookedListAll", bookedListAll);
		resultMap.put("cpage", cpage);
		resultMap.put("lastPage", lastPage);
		resultMap.put("startPageNum", startPageNum);
		resultMap.put("lastPageNum", lastPageNum);
		resultMap.put("totalRecord", totalRecord);
		resultMap.put("recordPerPage", recordPerPage);
		
		return resultMap;
	}
}
