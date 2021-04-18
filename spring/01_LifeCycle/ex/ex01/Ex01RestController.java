package com.hagulu.lesson01;

import java.util.HashMap;
import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RequestMapping("lesson01/ex01")
@RestController  // @Controller + @ResponseBody
public class Ex01RestController {
	
	// 요청 URL : http://localhost:8080/lesson01/ex01/3
	@RequestMapping("/3")
	public String printString() {
		
		return "@RestController 사용한 String 리턴";
	}
	
	// 요청 URL : http://localhost:8080/lesson01/ex01/4
	@RequestMapping("/4")
	public Map<String, String> printMap() {
		Map<String, String> map = new HashMap<>();
		
		map.put("김인규", "강사");
		map.put("유재석", "개그맨");
		map.put("아이유", "가수");
		
		return map;
	}
	
	// 요청 URL : http://localhost:8080/lesson01/ex01/5
	@RequestMapping("/5")
	public Data printData() {
		Data data = new Data();   // 일반 자바 bean
		data.setId(1);
		data.setName("김인규");
		return data;    // 일반 bean 객체도 JSON 으로 내려간다 
	}
	
	// 요청 URL : http://localhost:8080/lesson01/ex01/6
	@RequestMapping("/6")
	public ResponseEntity<Data> entity() {
		Data data = new Data();
		data.setId(1);
		data.setName("신보람");
		
		// 크롬 개발자 도구 network tab 응답값 확인 
		// status 코드 와 함께 전송 
		// 클라이언트에서 status code를 확인하고 처리 방식을 결정하게 한다. 
//		return new ResponseEntity<>(data, HttpStatus.OK);  // 200 ok
		return new ResponseEntity<>(data, HttpStatus.INTERNAL_SERVER_ERROR); // 500 error
	}
	
	
	
	
}
