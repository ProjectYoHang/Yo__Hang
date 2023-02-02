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
	
	// test
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
	
	public int checkID(MemberTO to) {
		int result = mapper.checkID(to);
		
		System.out.println( result );
		return result;
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
	
	public MemberTO memberInfo(MemberTO to) {
		to = mapper.memberInfo();
		
		return to;
	}
	
	public int memberInfo_modify_ok(MemberTO to) {
		int result = mapper.memberInfoModify_ok(to);
		
		int flag = 2;
		
		if(result == 1){
			flag = 0;
		}else {
			flag = 1;
		}
		return flag;
	}
	
	public int signout_ok(MemberTO to) {
		int result = mapper.signoutMember(to);
		
		int flag = 2;
		
		if(result == 1){
			flag = 0;
		}else {
			flag = 1;
		}
		return flag;
	}
	
	public MemberTO checkKakaoId(MemberTO to) {
		to = mapper.checkKakaoId(to);
		return to;
	}
	
	public int signup_kakaoMember_ok(MemberTO to) {
		 int result = mapper.signupKakaoMember_ok(to);
		 
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
