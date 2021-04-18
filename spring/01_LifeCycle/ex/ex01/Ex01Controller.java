package com.hagulu.lesson01;
// 기본 패키치 com.hagulu.ex 에서 lesson01로 변경되어 404발생 
// 설정 클래스에서 @ComponentScan 으로 기본패키지를 다시 잡아 준다. 

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@RequestMapping("/lesson01/ex01")  // 메소드에 포함된 mapping 보다 먼저 적용 
@Controller
public class Ex01Controller {
	
	// String 으로 출력하기 
	// 요청 URL  : http://localhost:8080/lesson01/ex01/1
	@ResponseBody // 리턴되는 String 을 HTML Response로 보낸다.
	@RequestMapping("/1")
	public String printString() {
		String htmlText = "예제 1번 <br> 문자열을 reponse body로 전달 합니다.";
		return htmlText;
	}
	
	
	// Map 출력하기 JSON 출력 
	// 요청 URL :	http://localhost:8080/lesson01/ex01/2
	@RequestMapping("/2")
	public @ResponseBody Map<String, Object> printMap() {
		Map<String, Object> map = new HashMap<>();
		map.put("apple", 1500);
		map.put("banana", 5000);
		map.put("orange", 1000);
		map.put("grape", 3000);
		
		// 맵을 리턴하면 json으로 나타난다. web starter에 jackson이라는 라이브러리가 포함되어 있기 때
		return map;
	}
	
	
	
}
