package com.example.model;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.mapper.QnAMapperInter;

@Repository
public class QnABoardDAO {

	//@Autowired
	//private DataSource dataSource;
	
	@Autowired
	private QnAMapperInter mapper;
	
	public void qnaWrite() {}
	
	public int qnaWriteOk(QnABoardTO to) {
		
		int flag = 1;
		
		int result = mapper.qnaWriteOk(to);
		if(result == 1) {
			flag = 0;
		}
		
		return flag;
	}
	
	public ArrayList<QnABoardTO> qnaList() {
		
		ArrayList<QnABoardTO> qnaLists = mapper.qnaList();
		return qnaLists;
		
		// 페이징도 해야 함(몇개단위로 페이지를 끊을까...)
		
		
		/*
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ArrayList<QnABoardTO> qnaLists = new ArrayList<QnABoardTO>();
		
		
		// 페이징도 해야 함(몇개단위로 페이지를 끊을까...)
		
		
		
		
		
		
		
		try {
			conn = this.dataSource.getConnection();
			
			String sql = "select qna_seq, qna_id, qna_subject, date_format(qna_date, '%Y-%m-%d') qna_date, qna_hit, qna_reply, datediff(now(), qna_date) wgap from qna_board";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				QnABoardTO to = new QnABoardTO();
				to.setQna_seq(rs.getString("qna_seq"));
				to.setQna_id(rs.getString("qna_id"));
				to.setQna_subject(rs.getString("qna_subject"));
				to.setQna_date(rs.getString("qna_date"));
				to.setQna_hit(rs.getInt("qna_hit"));
				to.setQna_reply(rs.getInt("qna_reply"));
				to.setWgap(rs.getInt("wgap"));
				
				qnaLists.add(to);
			}
		} catch(SQLException e) {
			System.out.println("[에러] : " +e.getMessage());
		} finally {
			if(rs != null) try {rs.close();} catch(SQLException e) {}
			if(pstmt != null) try {pstmt.close();} catch(SQLException e) {}
			if(conn != null) try {conn.close();} catch(SQLException e) {}
		}
		
		return qnaLists;
		*/
	}
	
	public QnABoardTO qnaView(QnABoardTO to) {
		
		mapper.qnaViewHit(to);
		
		to = mapper.qnaView(to);
		
		// Q&A에 대한 관리자의 답댓글도 viewpage에 보여야함
		// 따라서, qna_reply 테이블 데이터도 select 해와야 함
		
		
		
		
		
		
		return to;
	}
	
	public QnABoardTO qnaModify(QnABoardTO to) {
		
		to = mapper.qnaModify(to);
		
		return to;
	}
	
	public int qnaModifyOk(QnABoardTO to) {
		
		int flag = 2;
		
		int result = mapper.qnaModifyOk(to);
		
		if(result == 0) {
			flag = 1;
		} else if(result == 1) {
			flag = 0;
		}
		
		return flag;
	}
	
	public QnABoardTO qnaDelete(QnABoardTO to) {
		
		to = mapper.qnaDelete(to);
		
		return to;
	}
	
	public int qnaDeleteOk(QnABoardTO to) {
		
		int flag = 2;
		
		int result = mapper.qnaDeleteOk(to);
		
		if(result == 0) {
			flag = 1;
		} else if(result == 1) {
			flag = 0;
		}
		
		return flag;
	}
	
	
	// Q&A 답댓글 메서드
	
	// qna 답댓글 view
	public ArrayList<QnAReplyTO> qnaReplyView(QnAReplyTO to) {
		ArrayList<QnAReplyTO> qnaReplys = mapper.qnaReplyView(to);
		
		return qnaReplys;
	}
		
	// qna 답댓글 작성
	public int qnaReplyWriteOk(QnAReplyTO to, QnABoardTO bto) {
		mapper.qnaReplyyn(bto);
		
		int flag = 1;
		
		int result = mapper.qnaReplyWrite(to);
		if(result == 1) {
			flag = 0;
		}
		
		return flag;
	}
	
	
	
	
	
	
	
	
	
	
	
}

