package com.example.model;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.mapper.MapperInter;

@Repository
public class AdminsDAO {
	@Autowired 
	private MapperInter mapper;
	
	public int admin_login ( AdminsTO to ) {
		int result = mapper.loginAdmin(to);
		return result;
	}
	
	// 관리자측 객실관리 메뉴 중 겍실목록 페이지
	public ArrayList<room_typeTO> roomType() {
		ArrayList<room_typeTO> roomType = mapper.roomType();
		return roomType;
	}
}
