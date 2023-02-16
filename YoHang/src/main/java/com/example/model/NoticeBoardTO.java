package com.example.model;

import java.util.ArrayList;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class NoticeBoardTO {
	private String nt_seq;
	private String nt_subject;
	private String nt_id;
	private String nt_date;
	private String nt_content;
	private int nt_hit;
	private String nt_file_name;
	private int nt_wgap;
	private long nt_file_size;
}