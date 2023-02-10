package com.example.model;

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
	
}
