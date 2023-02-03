package com.example.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.example.model.RvBoardTO;

@Mapper
public interface RvMapperinter {

	// List
	@Select( "select rv_seq, rv_id, rv_subject, date_format(rv_date, '%Y-%m-%d') rv_date, datediff(now(), rv_date) wgap, rv_img_name from reviews order by rv_seq desc")
	public abstract ArrayList<RvBoardTO> rvList();
	
	// view
	@Select("select rv_subject, rv_content, rv_id, rv_date, rv_img_name from reviews where rv_seq=#{rv_seq}")
	RvBoardTO rvView(RvBoardTO to);
	
	// write_ok
	@Insert("insert into reviews values (0, #{rv_subject}, #{rv_id}, now(), #{rv_content}, #{rv_img_name}, #{rv_img_size}, #{rv_room_seq}, #{rv_book_num}, #{rv_stars}, #{rv_like} )")
	int rvwriteOk(RvBoardTO to);
}
