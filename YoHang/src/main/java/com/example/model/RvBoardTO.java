package com.example.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class RvBoardTO {
	private String rv_seq;
	private String rv_subject;
	private String rv_id;
	private String rv_date;
	private String rv_content;
	private String rv_img_name;
	private int wgap;
	private long rv_img_size;
	private int rv_room_seq;
	private int rv_book_num;
	private long rv_stars;
	private int rv_like;
}
