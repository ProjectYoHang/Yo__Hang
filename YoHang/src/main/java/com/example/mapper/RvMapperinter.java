package com.example.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.example.model.room_typeTO;
import com.example.model.RvBoardListTO;
import com.example.model.RvBoardTO;

@Mapper
public interface RvMapperinter {

	// List
	@Select("select rv_seq, rv_id, rv_subject, date_format(rv_date, '%Y-%m-%d') rv_date, datediff(now(), rv_date) wgap, rv_img_name "
			+ "from reviews order by rv_seq desc "
			+ "limit #{startRow}, #{recordPerPage}")
	public abstract ArrayList<RvBoardTO> rvList(RvBoardListTO listTo);
	
	@Select("select count(*) from reviews")
	int rvAllCount();

	// view
	@Select("select rv_subject, rv_content, rv_id, rv_date, rv_img_name from reviews where rv_seq=#{rv_seq}")
	RvBoardTO rvView(RvBoardTO to);

	// write_ok
	@Insert("insert into reviews values (0, #{rv_subject}, #{rv_id}, now(), #{rv_content}, #{rv_img_name}, #{rv_img_size}, #{rv_room_seq}, #{rv_book_num}, #{rv_stars}, #{rv_like} )")
	int rvWriteOk(RvBoardTO to);
	
	// delete
	@Select("select rv_subject, rv_id from reviews where rv_seq=#{rv_seq}")
	RvBoardTO rvDelete(RvBoardTO to);
	
	// delete_ok
	@Delete("delete from reviews where rv_seq=#{rv_seq}")
	int rvDeleteOk(RvBoardTO to);
	
	// modify
	@Select("select rv_subject, rv_content, rv_id , rv_img_name, rv_img_size from reviews where rv_seq=#{rv_seq}")
	RvBoardTO rvModify(RvBoardTO to);
	
	// modify_ok
	// db에서 rv_img_name 가져오는 sql
	@Select("select rv_img_name from reviews where rv_seq=#{rv_seq}")
	String rvImgName(RvBoardTO to);
	
	// 4가지 : 기존의 파일이 있는 경우(변경O/변경x) / 기존파일이 없는 경우(파일추가/파일추가x)
	@Update("update reviews set rv_subject=#{rv_subject}, rv_content=#{rv_content}, rv_img_name=#{rv_img_name}, rv_img_size=#{rv_img_size} where rv_seq=#{rv_seq}")
	int rvModifyOk1(RvBoardTO to);
	
	@Update("update reviews set rv_subject=#{rv_subject}, rv_content=#{rv_content} where rv_seq=#{rv_seq}")
	int rvModifyOk2(RvBoardTO to);
	
	@Update("update reviews set rv_subject=#{rv_subject}, rv_content=#{rv_content}, rv_img_name=#{rv_img_name}, rv_img_size=#{rv_img_size} where rv_seq=#{rv_seq}")
	int rvModifyOk3(RvBoardTO to);
	
	@Update("update reviews set rv_subject=#{rv_subject}, rv_content=#{rv_content} where rv_seq=#{rv_seq}")
	int rvModifyOk4(RvBoardTO to);
	
	// home에 이미지 불러오는 sql문
	@Select("select * from room_type where room_name =#{room_name}")
	room_typeTO roomtype1(room_typeTO to);
}
