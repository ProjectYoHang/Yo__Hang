package com.example.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.example.model.MembersTO;

@Mapper
public interface MapperInter {
	
	@Select ( "select * from members")
	MembersTO select();
	
////////////// 로그인 
	
	@Select ( "select m_id, m_name, m_email, m_phone, m_birth  from members where m_id=#{m_id} and m_pw=#{m_pw}" )
	MembersTO login(MembersTO to);
	
////////////// 회원가입 
	void signupMember(MembersTO to);
	
	@Insert ( "insert into members values( #{m_id}, #{m_pw}, #{m_name}, #{m_email}, #{m_phone}, #{m_birth}, now(), #{m_gender}, NULL)" )
	int signupMember_ok(MembersTO to);
	
////////////// 중복체크
	@Select ( "select count(m_id) from members where m_id=#{m_id}" )
	int checkID(MembersTO to);
	
////////////// 비밀번호 찾기 - 아이디로 메일찾아서 가져오기
	@Select ( "select m_email from members where m_id=#{m_id}" )
	MembersTO pullMail(MembersTO to);
	
////////////// 비밀번호 찾기 - 해당 아이디의 비밀번호 바꾸기
	@Update ( "update members set m_pw=#{m_pw} where m_id=#{m_id}")
	int modifyPassword(MembersTO to);
	
////////////// 아이디 찾기 - 이름으로 아이디 가져오기
	@Select ( "select m_id from members where m_name=#{m_name}")
	ArrayList<MembersTO> pullId(MembersTO to);
	
////////////// 마이페이지 - 계정정보 불러오기	
	
	@Select ( "select m_id, m_name, m_email, m_phone, m_birth from members where m_id=#{m_id}" )
	MembersTO memberInfo();

////////////// 마이페이지 - 계정정보 수정	
	/////// 비밀번호 변경 x
	@Update ( "update members set m_email=#{m_email}, m_phone=#{m_phone} where m_id=#{m_id}" )
	int memberInfoModify_ok(MembersTO to);
	
	/////// 비밀번호 변경 o  
	@Update ( "update members set m_email=#{m_email}, m_phone=#{m_phone}, m_pw =#{m_pw} where m_id=#{m_id}" )
	int memberInfoModify_ok_withPassword(MembersTO to);


////////////// 마이페이지 - 회원탈퇴 

	@Delete ( "delete from members where m_id=#{m_id}" )
	int signoutMember(MembersTO to);
	
////////////// 카카오로 로그인한 아이디가 회원 목록에 저장된 정보중에서 있는지 확인 하는..
	
	@Select ( "select m_id, m_name, m_email, m_phone, m_birth from members where m_kakao_id=#{m_kakao_id}" )
	MembersTO checkKakaoId(MembersTO to);
	
////////////// 카카오 로그인으로 가져온 카카오 아이디가 회원 목록에 없는경우 회원가입 진행..
	
	@Insert ( "insert into members values( #{m_id}, #{m_pw}, #{m_name}, #{m_email}, #{m_phone}, #{m_birth}, now(), #{m_gender}, #{m_kakao_id} )" )
	int signupKakaoMember_ok(MembersTO to);
		
	
////////////// 로그인 상태에서 카카오 연동하기 
	
	@Update ( "update members set m_kakao_id=#{m_kakao_id} where m_id=#{m_id}" )
	int insertKakaoId(MembersTO to);

////////////// 멤버 목록 가져오기
	
	@Select ( "select m_id, m_name, m_email, m_phone, m_join_date from members order by  m_join_date desc" )
	ArrayList<MembersTO> list_member();
	

}
