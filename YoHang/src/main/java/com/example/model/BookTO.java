package com.example.model;

import lombok.Data;

@Data
public class BookTO {
	private String book_num;
	private String m_id;
	private String checkin_date;
	private String checkout_date;
	private String room_seq;
	private String book_date;
	private String book_rooms;
	private String book_head_count;
	private String book_cs_type;
	private String room_status;
}
