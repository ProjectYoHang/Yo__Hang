package com.example.model;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.mapper.MapperInter;

@Repository
@MapperScan ("com.example.mapper")
public class MemberDAO {	
	
	@Autowired
	private MapperInter mapper;
	
	public void select() {
		MemberTO to = mapper.select();
		
		System.out.println(to.getM_id());
	}
	
	public MemberTO login(MemberTO to) {
		to = mapper.login(to);
		return to;
	}
	
	public MemberTO login_ok() {
		return null;
	}
	
	public void signup() {
		
	}
	
	public void checkID(MemberTO to) {
		MemberTO checkTO = mapper.CheckID(to);
		
		System.out.println( checkTO.getM_id());
	}
	
	public int signup_ok(MemberTO to) {
		int result = mapper.signupMember_ok(to);
		int flag = 2;
		System.out.println(result);
		if(result == 1){
			flag = 0;
		}else {
			flag = 1;
		}
		
		return flag;
	}

}
