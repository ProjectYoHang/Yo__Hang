package com.example.model;

import java.util.ArrayList;

import lombok.Getter;
import lombok.Setter;

// qna/list paging TO : 20221118 참고
@Getter
@Setter
public class QnABoardListTO {
	private int cpage;
	private int recordPerPage;
	private int totalPage;
	private int totalRecord;
	private int startPageNum;
	private int lastPageNum;
	private int startRow;
	
	private ArrayList<QnABoardTO> qnaLists;
	
	public QnABoardListTO() {
		this.cpage = 1;
		this.recordPerPage = 10;
		this.totalPage = 1;
		this.totalRecord = 0;
	}
}
