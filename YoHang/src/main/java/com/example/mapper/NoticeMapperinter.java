package com.example.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.example.model.NoticeBoardListTO;
import com.example.model.NoticeBoardTO;

@Mapper
public interface NoticeMapperinter {
	// 공지사항
	
	// list
	@Select("select nt_seq, nt_subject, nt_id, date_format(nt_date, '%Y-%m-%d') nt_date, nt_hit, datediff(now(), nt_date) nt_wgap, nt_content, nt_file_name "
			+ "from notice order by nt_seq desc "
			+ "limit #{startRow}, #{recordPerPage}")
	public abstract ArrayList<NoticeBoardTO> noticeList(NoticeBoardListTO listTo);
	
	// 게시글 총 갯수
	@Select("select count(*) from notice")
	int noticeAllCount();
	
	// view - 조회수 증가
	@Update("update notice set nt_hit=nt_hit+1 where nt_seq=#{nt_seq}")
	void noticeViewHit(NoticeBoardTO to); 
	
	// view 
	@Select("select nt_subject, nt_id, nt_date, nt_hit, nt_content, nt_file_name from notice where nt_seq=#{nt_seq}")
	NoticeBoardTO noticeView(NoticeBoardTO to);
	
	// write_ok
	@Insert("insert into notice values (0, #{nt_subject}, #{nt_id}, now(), #{nt_hit}, #{nt_content}, #{nt_file_name}, #{nt_file_size})")
	int noticeWriteOk(NoticeBoardTO to);
	
	// modify
	@Select("select nt_subject, nt_id, nt_content, nt_file_name, nt_file_size from notice where nt_seq=#{nt_seq}")
	NoticeBoardTO noticeModify(NoticeBoardTO to);
	
	// modify_ok
	// db에서 nt_file_name 가져오는 sql
	@Select("select nt_file_name from notice where nt_seq=#{nt_seq}")
	String noticeFileName(NoticeBoardTO to);
	
	// 4가지 : 기존의 파일이 있는 경우(변경O/변경x) / 기존파일이 없는 경우(파일추가/파일추가x)
	@Update("update notice set nt_subject=#{nt_subject}, nt_content=#{nt_content}, nt_file_name=#{nt_file_name}, nt_file_size=#{nt_file_size} where nt_seq=#{nt_seq}")
	int noticeModifyOk1(NoticeBoardTO to);
	
	@Update("update notice set nt_subject=#{nt_subject}, nt_content=#{nt_content} where nt_seq=#{nt_seq}")
	int noticeModifyOk2(NoticeBoardTO to);
	
	@Update("update notice set nt_subject=#{nt_subject}, nt_content=#{nt_content}, nt_file_name=#{nt_file_name}, nt_file_size=#{nt_file_size} where nt_seq=#{nt_seq}")
	int noticeModifyOk3(NoticeBoardTO to);
	
	@Update("update notice set nt_subject=#{nt_subject}, nt_content=#{nt_content} where nt_seq=#{nt_seq}")
	int noticeModifyOk4(NoticeBoardTO to);
	
	// delete
	@Select("select nt_subject, nt_id from notice where nt_seq=#{nt_seq}")
	NoticeBoardTO noticeDelete(NoticeBoardTO to);
	
	// delete_ok
	@Delete("delete from notice where nt_seq=#{nt_seq}")
	int noticeDeleteOk(NoticeBoardTO to);
}
