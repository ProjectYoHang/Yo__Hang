package com.example.demo;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan(basePackages = {"com.example.demo", "com.example.controller", "com.example.model"})
@MapperScan(basePackages = {"com.example.mapper"})
public class YoHangApplication {
	
	public static void main(String[] args) {
		SpringApplication.run(YoHangApplication.class, args);
	}

}
