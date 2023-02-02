package com.example.demo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan (basePackages =  {"com.example.demo", "com.example.mapper", "com.example.model" } )
public class YoHangApplication {

	public static void main(String[] args) {
		SpringApplication.run(YoHangApplication.class, args);
	}
}