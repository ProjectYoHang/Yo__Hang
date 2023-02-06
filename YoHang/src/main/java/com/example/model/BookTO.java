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
	private int book_rooms;
	private int book_head_count;
	private String book_cs_type;
	private int room_status;
}
