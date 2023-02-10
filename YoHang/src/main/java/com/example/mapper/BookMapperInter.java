package com.example.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.example.model.BookTO;
import com.example.model.RoomTO;

@Mapper
public interface BookMapperInter {

	// 해당 날짜에 예약되어있는 방번호를 select => 객실 상세페이지에서 이미 예약되어있는 상태의 객실번호는 disabled 처리 해야되니까
	@Select("select rooms.room_seq from book left outer join rooms on book.room_seq=rooms.room_seq where book.checkin_date>='#{checkin_date}' and book.checkout_date<='#{checkout_date}'")
	public abstract ArrayList<RoomTO> bookedRoomNum(BookTO to);
	
	// 선택한 객실번호로 예약이 되어야 함
	@Update("update rooms set room_status=1 where room_seq=#{room_seq}")
	int roomStatus(RoomTO to);
	
	@Insert("insert into book values (0, )")
	int bookOk(BookTO to);
	
	// 예약 취소 : 예약 데이터 삭제 + 객실번호의 예약상태를 변경해야 함
	
	
	
}
