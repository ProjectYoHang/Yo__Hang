package com.example.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class QnABoardTO {
	private String qna_seq;
	private String qna_id;
	private String qna_subject;
	private String qna_content;
	private String qna_date;
	private int wgap;
	private int qna_hit;
	private int qna_reply;
	private String qna_pw;
}
