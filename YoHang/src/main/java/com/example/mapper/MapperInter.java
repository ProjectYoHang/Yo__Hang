package com.example.mapper;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.example.model.MemberTO;

@Mapper
public interface MapperInter {
	
	@Select ( "select * from members")
	MemberTO select();
	
////////////// 로그인 ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	@Select ( "select m_id, m_name, m_email, m_phone, m_birth  from members where m_id=#{m_id} and m_pw=#{m_pw}" )
	MemberTO login(MemberTO to);
	
////////////// 회원가입 /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	void signUpMember(MemberTO to);
	
	@Insert ( "insert into members values( 0, #{m_id}, #{m_pw}, #{m_name}, #{m_email}, #{m_phone}, #{m_birth}, now(), #{m_gender} ) " )
	int signupMember_ok(MemberTO to);
	// 중복체크
	@Select ( "select m_id from members where m_id=#{m_id}" )
	MemberTO CheckID(MemberTO to);
	
////////////// 회원탈퇴/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	@Delete ( "delete from members where m_id=#{m_id} and m_pw=#{m_pw}" )
	void signoutMember(MemberTO to);
	
	

}
