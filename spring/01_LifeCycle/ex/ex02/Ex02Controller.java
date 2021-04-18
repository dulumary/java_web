package com.hagulu.lesson01;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller	//@RestController 가 아
public class Ex02Controller {
	
	// 요청 URL : http://localhost/lesson01/ex02/1
	@RequestMapping("/lesson01/ex02/1")
	public String view() {
		// ResponseBody 가 아닌 상태로 String 을 리턴하면
		// ViewResolver에 의해서, 리턴된 String 이름의 view를 찾고 view화면이 구성된다. 
		
		return "lesson01/ex02";
		
	}

}
