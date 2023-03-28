package com.example.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.example.model.FaqBoardListTO;
import com.example.model.FaqBoardTO;
import com.example.model.QnABoardTO;

@Mapper
public interface FaqMapperinter {
	// 공지사항
	
	// list
	@Select("select faq_seq, faq_subject, faq_content "
			+ "from faq order by faq_seq desc "
			+ "limit #{startRow}, #{recordPerPage}")
	public abstract ArrayList<FaqBoardTO> faqList(FaqBoardListTO listTo);
	
	// 게시글 총 갯수
	@Select("select count(*) from faq")
	int faqAllCount();
	
	// view 
	@Select("select faq_subject, faq_content from faq where faq_seq=#{faq_seq}")
	FaqBoardTO faqView(FaqBoardTO to);
	
	// write_ok
	@Insert("insert into faq values (0, #{faq_subject}, #{faq_content})")
	int faqWriteOk(FaqBoardTO to);
	
	// modify
	@Select("select faq_subject, faq_content from faq where faq_seq=#{faq_seq}")
	FaqBoardTO faqModify(FaqBoardTO to);
	
	//modify_ok
	@Update("update faq set faq_subject=#{faq_subject}, faq_content=#{faq_content} where faq_seq=#{faq_seq}")
	int faqModifyOk(FaqBoardTO to);
	
	// delete
	@Select("select faq_subject from faq where faq_seq=#{faq_seq}")
	FaqBoardTO faqDelete(FaqBoardTO to);
	
	// delete_ok
	@Delete("delete from faq where faq_seq=#{faq_seq}")
	int faqDeleteOk(FaqBoardTO to);
}
