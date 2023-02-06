package com.example.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.mapper.BookMapperInter;

@Repository
public class BookDAO {

	@Autowired
	private BookMapperInter mapper;
	
	
}
