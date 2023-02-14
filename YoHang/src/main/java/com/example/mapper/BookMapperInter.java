package com.example.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.example.model.BookListTO;
import com.example.model.BookTO;
import com.example.model.BookInfoTO;
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
	
	// 선택된 개별 객실번호 데이터 => book 테이블 insert
	@Insert("insert into book values (0, #{m_id}, #{checkin_date}, #{checkout_date}, #{room_seq}, now(), #{book_rooms}, #{book_head_count}, #{book_cs_type}, 1)")
	int bookOk(BookTO to);
	
	// 객실이 한개씩 book 테이블에 데이터가 들어가면 하나의 예약의 경우에는 객실번호가 하나로 묶여야하므로 임시테이블 bookInfo 하나 만듬
	@Insert("insert into bookInfo values (0, #{id}, now(), #{rooms_seq}, #{head_count}, #{checkin}, #{checkout})")
	int bookInfo(BookInfoTO to);
	
	@Select("select book_num from book where m_id=#{m_id} and checkin_date=#{checkin_date} and checkout_date=#{checkout_date} and book_date=#{book_date}")
	ArrayList<String> nums(BookTO to);
	
	// 예약 취소 : 예약 데이터 삭제 + 객실번호의 예약상태를 변경해야 함
	@Delete("delete from book where checkin_date=#{checkin_date} and checkout_date=#{checkout_date} and room_seq=#{room_seq}")
	int bookDeleteOk(BookTO to);
	
	// 예약 취소 : 한 예약을 하나로 묶어놓은 bookInfo 테이블의 데이터 삭제
	@Delete("delete from bookInfo where seq=#{seq}")
	void bookInfoDelete(BookInfoTO to);
	
	// 회원별 예약정보
	@Select("select * from bookInfo where id=#{id} order by seq desc")
	ArrayList<BookInfoTO> bookInfos(BookInfoTO to);
	
	// 전체 예약정보
	//@Select("select book_num, m_id, room_seq, date_format(checkin_date, '%Y-%m-%d') checkin_date, date_format(checkout_date, '%Y-%m-%d') checkout_date, book_date from book order by book_num desc limit #{startRow}, #{recordPerPage}")
	@Select("select * from bookInfo order by seq desc limit #{startRow}, #{recordPerPage}")
	ArrayList<BookInfoTO> bookInfoAll(BookListTO listTo);
	
	// 예약건 총 갯수
	@Select("select count(*) from bookInfo")
	int bookAllCount();
	
}
