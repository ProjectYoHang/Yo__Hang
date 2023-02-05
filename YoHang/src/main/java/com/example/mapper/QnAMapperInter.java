package com.example.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.example.model.QnABoardListTO;
import com.example.model.QnABoardTO;
import com.example.model.QnAReplyTO;

@Mapper
public interface QnAMapperInter {

	// 사용자 Q&A
	
	// list
	@Select("select qna_seq, qna_id, qna_subject, date_format(qna_date, '%Y-%m-%d') qna_date, qna_hit, qna_reply, datediff(now(), qna_date) wgap "
			+ "from qna_board order by qna_seq desc "
			+ "limit #{startRow}, #{recordPerPage}")
	public abstract ArrayList<QnABoardTO> qnaList(QnABoardListTO listTo);
	
	// 게시글 총 갯수
	@Select("select count(*) from qna_board")
	int qnaAllCount();
	
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
	
	// reply_list : 사용자의 qna list가 보일 것
	@Select("select qna_seq, qna_id, qna_subject, date_format(qna_date, '%Y-%m-%d') qna_date from qna_board order by qna_seq desc")
	ArrayList<QnABoardTO> qnaReplyList();
	
	// reply_view에서 사용자의 qna
	@Select("select qna_seq, qna_id, qna_subject, qna_content, date_format(qna_date, '%Y-%m-%d') qna_date from qna_board where qna_seq=#{qna_seq}")
	QnABoardTO qnaReplyView1(QnABoardTO to);
	
	// reply_view에서 관리자의 답댓글
	@Select("select qrpl_id, qrpl_content, qrpl_date from qna_reply where qna_seq=#{qna_seq}")
	QnAReplyTO qnaReplyView2(QnAReplyTO to);
	
	// reply_write
	@Insert("insert into qna_reply values (0, #{qna_seq}, #{qrpl_id}, #{qrpl_content}, now())")
	int qnaReplyWrite(QnAReplyTO to);
	
	// 답변여부
	@Update("update qna_board set qna_reply=1 where qna_seq=#{qna_seq}")
	void qnaReplyy(QnABoardTO to);
	
	// 답변여부
	@Update("update qna_board set qna_reply=0 where qna_seq=#{qna_seq}")
	void qnaReplyn(QnABoardTO to);
	
	// 답댓글 삭제
	@Delete("delete from qna_reply where qna_seq=#{qna_seq}")
	int qnaReplyDeleteOk(QnAReplyTO to);
	
	// 답댓글이 있는 경우를 조건으로 먼저 답댓글이 삭제된 다음 본 게시글이 삭제되게 만들어야 함
	@Select("select qna_reply from qna_board where qna_seq=#{qna_seq}")
	int qnaReplyNum(QnABoardTO to);
	
	
}
