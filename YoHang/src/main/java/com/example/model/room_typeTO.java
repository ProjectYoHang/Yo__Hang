package com.example.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class room_typeTO {
	private String room_name;
	private String room_image;
	private long room_price;
	private int room_capacity;
	private int bed;
	private String bed_size;
	private int room_baths;
	private int room_rooms;
	private int room_floor;
	private long room_size;
	private String room_view;
}
