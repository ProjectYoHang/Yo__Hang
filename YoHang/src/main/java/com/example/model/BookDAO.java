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
	
	// 하나의 예약에 대한 종합 예약정보 : bookInfo 테이블 insert
	public void bookInfo(BookInfoTO to) {
		mapper.bookInfo(to);
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
	
	// 예약정보 삭제 : bookInfo 테이블
	public void bookInfoDelete(BookInfoTO to) {
		mapper.bookInfoDelete(to);
	}
	
	// 회원별 예약목록
	public ArrayList<BookInfoTO> bookInfos(BookInfoTO to) {
		String id = to.getId();
		
		to.setId(id);
		
		ArrayList<BookInfoTO> bookInfos = mapper.bookInfos(to);
		
		return bookInfos;
	}
	
	// 마이페이지에 보여줄 내 최근예약 3건의 데이터
	public ArrayList<BookInfoTO> bookInfosMin(BookInfoTO to) {
		String id = to.getId();
		
		to.setId(id);
		
		ArrayList<BookInfoTO> bookInfosMin = mapper.bookInfosMin(to);
		
		return bookInfosMin;
	}
	
	// 관리자페이지 예약목록
	public Map<String, Object> bookInfoAll(BookListTO listTo) {
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
		
		ArrayList<BookInfoTO> bookInfoAll = mapper.bookInfoAll(listTo);
		
		int lastPage = (int)(Math.ceil(totalRecord/recordPerPage))+1;
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("bookInfoAll", bookInfoAll);
		resultMap.put("cpage", cpage);
		resultMap.put("lastPage", lastPage);
		resultMap.put("startPageNum", startPageNum);
		resultMap.put("lastPageNum", lastPageNum);
		resultMap.put("totalRecord", totalRecord);
		resultMap.put("recordPerPage", recordPerPage);
		
		return resultMap;
	}
}
