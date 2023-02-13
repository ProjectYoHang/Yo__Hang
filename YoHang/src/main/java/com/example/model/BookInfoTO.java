package com.example.model;

import lombok.Data;

@Data
public class BookInfoTO {
	private String seq;
	private String id;
	private String date;
	private String rooms_seq;
	private String head_count;
	private String checkin;
	private String checkout;
}
