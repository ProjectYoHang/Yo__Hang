package com.example.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Update;

import com.example.model.BookTO;

@Mapper
public interface BookMapperInter {

	// 예약 관련 sql
	
	// 특정 객실번호를 선택해서 room_status를 0:예약전/1:예약중/2:예약완료로 변경하는 sql
	// 일단 예약중인 상태의 데이터가 들어와야 함 = 특정 객실번호가 선택되면 바로 room_status가 1로 변경
	@Insert("insert into book values (0, #{m_id}, #{checkin_date}, #{checkout_date}, 1)")
	int booking(BookTO to);

	// 특정 객실번호 선택을 해제했다면 room_status가 다시 0으로 변경
	@Update("")
	
	// 특정 객실번호를 선택한 상태에서 예약하기 버튼을 클릭하면 room_status가 2를 변경
	@Update("update book set room_status=2 where room_status=1")
	void booked();
	

	
}
