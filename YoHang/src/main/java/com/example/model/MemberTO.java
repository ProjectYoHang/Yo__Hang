package com.example.model;

import lombok.Data;

@Data
public class MemberTO {
	private String m_id;
	private String m_pw;
	private String m_name;
	private String m_email;
	private String m_phone;
	private String m_birth;
	private String m_gender;
}
