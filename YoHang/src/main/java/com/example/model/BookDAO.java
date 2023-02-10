package com.example.model;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.mapper.BookMapperInter;

@Repository
public class BookDAO {

	@Autowired
	private BookMapperInter mapper;
	
	// 이미 해당 체크인, 체크아웃 날짜에 예약되어 있는 객실번호 추출
	public ArrayList<RoomTO> bookedRoomNum(BookTO to) {
		to.setCheckin_date(null);
		to.setCheckout_date(null);
		
		ArrayList<RoomTO> bookedRoomNums = mapper.bookedRoomNum(to);
		
		return bookedRoomNums;
	}
	
	
	
}
