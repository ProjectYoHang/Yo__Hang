package com.example.model;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.mapper.RvMapperinter;

@Repository
public class RvBoardDAO {
	
	@Autowired
	private RvMapperinter mapper;
	
	public void rvWrite() {}
	
	public int rvWriteOk( RvBoardTO to ) {
		
		int flag = 1;
		
		int result = mapper.rvwriteOk(to);
		if(result == 1 ) {
			flag = 0;
		}
		
		return flag;
	}
	
	public ArrayList<RvBoardTO> rvList() {
		
		ArrayList<RvBoardTO> rvLists = mapper.rvList();
		return rvLists;
	}
	
	public RvBoardTO rvView(RvBoardTO to) {
		
		to = mapper.rvView(to);
		
		return to;
	}
	
}
