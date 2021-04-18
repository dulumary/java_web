package com.hagulu.lesson01.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@RequestMapping("/lesson01/test01")
@Controller
public class Test01Controller {
	
	// String 출력하기 
	// 요청 URL : http://localhost:8080/lesson01/test01/1
	
	@ResponseBody
	@RequestMapping("/1")
	public String printString() {
		
		return "<h1>테스트 프로젝트 완성</h1> <h3>해당 프로젝트를 통해서 문제 풀이를 진행 합니다.</h3>";
	}
	
	// json 출력
	// 요청 URL : http://localhost:8080/lesson01/test01/2
	@ResponseBody
	@RequestMapping("/2")
	public Map<String, Object> printMap() {
		Map<String, Object> scoreMap = new HashMap<>();
		
		scoreMap.put("국어", 80);
		scoreMap.put("수학", 90);
		scoreMap.put("영어", 85);
		
		return scoreMap;
		
	}
	

}
