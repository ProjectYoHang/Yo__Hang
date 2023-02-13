package com.example.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.example.model.BookListTO;
import com.example.model.BookTO;
import com.example.model.RoomTO;

@Mapper
public interface BookMapperInter {

	// 해당 날짜에 예약되어있는 방번호를 select => 객실 상세페이지에서 이미 예약되어있는 상태의 객실번호는 disabled 처리 해야되니까
	//@Select("select rooms.room_seq from book left outer join rooms on book.room_seq=rooms.room_seq where book.checkin_date>=#{checkin_date} and book.checkout_date<=#{checkout_date}")
	@Select("select rooms.room_seq from book left outer join rooms on book.room_seq=rooms.room_seq "
			+ "where (book.checkin_date<=#{checkin_date} and book.checkout_date>=#{checkout_date}) "
			+ "or (book.checkin_date<=#{checkin_date} and (book.checkout_date<=#{checkout_date} and book.checkout_date>=#{checkin_date})) "
			+ "or (book.checkin_date>=#{checkin_date} and book.checkout_date>=book.checkin_date and book.checkout_date<=#{checkout_date}) "
			+ "or ((book.checkin_date>=#{checkin_date} and book.checkin_date<=#{checkout_date}) and book.checkout_date>=#{checkout_date})")
	public abstract ArrayList<RoomTO> bookedRoomNum(BookTO to);
	
	// 선택한 객실번호로 예약이 되어야 함
	//@Update("update rooms set room_status=1 where room_seq=#{room_seq}")
	//int roomStatus(RoomTO to);
	
	@Insert("insert into book values (0, #{m_id}, #{checkin_date}, #{checkout_date}, #{room_seq}, now(), #{book_rooms}, #{book_head_count}, #{book_cs_type}, 1)")
	int bookOk(BookTO to);
	
	// 예약 취소 : 예약 데이터 삭제 + 객실번호의 예약상태를 변경해야 함
	@Delete("delete from book where book_num=#{book_num}")
	int bookDeleteOk(BookTO to);
	
	// 회원별 예약정보
	@Select("select * from book where m_id=#{m_id}")
	ArrayList<BookTO> bookedList(BookTO to);
	
	// 전체 예약정보
	@Select("select book_num, m_id, room_seq, date_format(checkin_date, '%Y-%m-%d') checkin_date, date_format(checkout_date, '%Y-%m-%d') checkout_date, book_date from book order by book_num desc limit #{startRow}, #{recordPerPage}")
	ArrayList<BookTO> bookedListAll(BookListTO listTo);
	
	// 예약건 총 갯수
	@Select("select count(*) from book")
	int bookAllCount();
	
}
