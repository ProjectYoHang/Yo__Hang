package com.example.model;

import java.util.ArrayList;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class FaqBoardListTO {
	private int cpage;
	private int recordPerPage;
	private int totalPage;
	private int totalRecord;
	private int startPageNum;
	private int lastPageNum;
	private int startRow;
	
	private ArrayList<FaqBoardTO> faqLists;
	
	public FaqBoardListTO() {
		this.cpage = 1;
		this.recordPerPage = 10;
		this.totalPage = 1;
		this.totalRecord = 0;
	}
}
