package com.example.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.example.model.MemberTO;

@Mapper
public interface MapperInter {
	
	@Select ( "select * from members")
	MemberTO select();
	
////////////// 로그인 
	
	@Select ( "select m_id, m_name, m_email, m_phone, m_birth  from members where m_id=#{m_id} and m_pw=#{m_pw}" )
	MemberTO login(MemberTO to);
	
////////////// 회원가입 
	void signupMember(MemberTO to);
	
	@Insert ( "insert into members values( #{m_id}, #{m_pw}, #{m_name}, #{m_email}, #{m_phone}, #{m_birth}, now(), #{m_gender}, NULL)" )
	int signupMember_ok(MemberTO to);
	
/////////////// 중복체크
	@Select ( "select count(m_id) from members where m_id=#{m_id}" )
	int checkID(MemberTO to);
	
///////////////  마이페이지 - 계정정보 불러오기	
	
	@Select ( "select m_id, m_name, m_email, m_phone, m_birth from members where m_id=#{m_id}" )
	MemberTO memberInfo();

//////////////	마이페이지 - 계정정보 수정	

	@Update ( "update members set m_email=#{m_email}, m_phone=#{m_phone}, m_pw =#{m_pw} where m_id=#{m_id}" )
	int memberInfoModify_ok(MemberTO to);


////////////// 마이페이지 - 회원탈퇴 

	@Delete ( "delete from members where m_id=#{m_id}" )
	int signoutMember(MemberTO to);
	
////////////// 카카오로 로그인한 아이디가 회원 목록에 저장된 정보중에서 있는지 확인 하는..
	
	@Select ( "select m_id, m_name, m_email, m_phone, m_birth from members where m_kakao_id=#{m_kakao_id}" )
	MemberTO checkKakaoId(MemberTO to);
	
///////////// 카카오 로그인으로 가져온 카카오 아이디가 회원 목록에 없는경우 회원가입 진행..
	
	@Insert ( "insert into members values( #{m_id}, #{m_pw}, #{m_name}, #{m_email}, #{m_phone}, #{m_birth}, now(), #{m_gender}, #{m_kakao_id} )" )
	int signupKakaoMember_ok(MemberTO to);
		
	
///////////// 로그인 상태에서 카카오 연동하기?
	
	@Update ( "update members set m_kakao_id=#{m_kakao_id}" )
	MemberTO insertKakaoId(MemberTO to);

//////////// 멤버 목록 가져오기
	
	@Select ( "select m_id, m_name, m_email, m_phone, m_join_date from members order by  m_join_date desc" )
	ArrayList<MemberTO> list_member();
	

}
