package com.example.model;

import java.util.ArrayList;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.mapper.MapperInter;

@Repository
@MapperScan ("com.example.mapper")
public class MembersDAO {	
	
	@Autowired
	private MapperInter mapper;
	
	// test
	public void select() {
		MembersTO to = mapper.select();
		System.out.println(to.getM_id());
	}
	
	public MembersTO login(MembersTO to) {
		to = mapper.login(to);
		return to;
	}
	
	public MembersTO login_ok() {
		return null;
	}
	
	public void signup() {
		
	}
	//// 아이디 중복 확
	public int checkID(MembersTO to) {
		int result = mapper.checkID(to);
		
		System.out.println( result );
		return result;
	}
	
	public int signup_ok(MembersTO to) {
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
	
	// 마이페이지 - 카카오 연동 
	public int insert_Kakao(MembersTO to) {
		int result = mapper.insertKakaoId(to);
		
		int flag  = 2;
		if(result == 1){
			flag = 0;
		}else {
			flag = 1;
		}
		return flag;
	}
	
	/// 내 정보 보기 
	public MembersTO memberInfo(MembersTO to) {
		to = mapper.memberInfo();
		return to;
	}
	// 정보 변경 
	public int memberInfo_modify_ok(MembersTO to) {
		int result = mapper.memberInfoModify_ok(to);
		
		int flag = 2;
		
		if(result == 1){
			flag = 0;
		}else {
			flag = 1;
		}
		return flag;
	}
	///// 비밀번호도 함께 정보 변경 
	public int memberInfo_modify_ok_withPassword(MembersTO to) {
		int result = mapper.memberInfoModify_ok_withPassword(to);
		
		int flag = 2;
		
		if(result == 1){
			flag = 0;
		}else {
			flag = 1;
		}
		return flag;
	}
	
	public int signout_ok(MembersTO to) {
		int result = mapper.signoutMember(to);
		
		int flag = 2;
		
		if(result == 1){
			flag = 0;
		}else {
			flag = 1;
		}
		return flag;
	}
	
	////// 아이디로 메일  가져오기  
	public MembersTO pullMail(MembersTO to) {
		to = mapper.pullMail(to);
		return to;
	}
	
	///// 임시비밀번호로 변경
	public int modifyPassword(MembersTO to) {
		int result = mapper.modifyPassword(to);
		
		int flag = 2;
		if(result == 1){
			flag = 0;
		}else {
			flag = 1;
		}
		return flag;
	}
	
	
	////// 이름으로 아이디 가져오기 
	public ArrayList<MembersTO> pullId(MembersTO to) {
		ArrayList<MembersTO> idList = mapper.pullId(to);
		return idList;
	}
	
	public MembersTO checkKakaoId(MembersTO to) {
		to = mapper.checkKakaoId(to);
		return to;
	}
	
	public int signup_kakaoMember_ok(MembersTO to) {
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
	
	
	////////////////////////// 회원 관리////////////////
	
	public ArrayList<MembersTO>list_member() {
		ArrayList<MembersTO> memberList = mapper.list_member();
		
		System.out.println( "memberDAO에서 확인하는 중");
		for(MembersTO to : memberList) {
			System.out.println("m_id : " + to.getM_id());
		}
		System.out.println( "memberDAO에서 확인 끝 ");
		return memberList;
	}
}
