package com.example.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.example.model.QnABoardTO;
import com.example.model.QnAReplyTO;

@Mapper
public interface QnAMapperInter {

	// 사용자 Q%A
	
	// list
	@Select("select qna_seq, qna_id, qna_subject, date_format(qna_date, '%Y-%m-%d') qna_date, qna_hit, qna_reply, datediff(now(), qna_date) wgap "
			+ "from qna_board order by qna_seq desc"
			+ "limit (#{startNum}, #{recordPerPage})")
	public abstract ArrayList<QnABoardTO> qnaList();
	
	// view
	@Update("update qna_board set qna_hit=qna_hit+1 where qna_seq=#{qna_seq}")
	void qnaViewHit(QnABoardTO to); 
	
	@Select("select qna_subject, qna_content, qna_id, qna_hit, qna_date from qna_board where qna_seq=#{qna_seq}")
	QnABoardTO qnaView(QnABoardTO to);
	
	// write_ok
	@Insert("insert into qna_board values (0, #{qna_id}, #{qna_subject}, #{qna_content}, now(), 0, 0, #{qna_pw})")
	int qnaWriteOk(QnABoardTO to);
	
	// modify
	@Select("select qna_subject, qna_content, qna_id from qna_board where qna_seq=#{qna_seq}")
	QnABoardTO qnaModify(QnABoardTO to);
	
	//modify_ok
	@Update("update qna_board set qna_subject=#{qna_subject}, qna_content=#{qna_content} where qna_seq=#{qna_seq} and qna_pw=#{qna_pw}")
	int qnaModifyOk(QnABoardTO to);
	
	// delete
	@Select("select qna_subject, qna_id from qna_board where qna_seq=#{qna_seq}")
	QnABoardTO qnaDelete(QnABoardTO to);
	
	// delete_ok
	@Delete("delete from qna_board where qna_seq=#{qna_seq} and qna_pw=#{qna_pw}")
	int qnaDeleteOk(QnABoardTO to);
	
	// 관리자 - 답댓글
	
	// reply_view
	@Select("select qrpl_id, qrpl_content, qrpl_date from qna_reply where qna_seq=#{qna_seq}")
	ArrayList<QnAReplyTO> qnaReplyView(QnAReplyTO to);
	
	// reply_write
	@Insert("insert into qna_reply values (0, #{qna_seq}, #{qrpl_id}, #{qrpl_content}, now())")
	int qnaReplyWrite(QnAReplyTO to);
	
	// 답변여부
	@Update("update qna_board set qna_reply=1 where qna_seq=#{qna_seq}")
	void qnaReplyyn(QnABoardTO to);
	
	
}
