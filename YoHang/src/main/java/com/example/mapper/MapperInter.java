package com.example.mapper;

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
	

}
