package com.hagulu.lesson01.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/lesson01/test03")
@Controller
public class Test03Controller {
	
	@RequestMapping("/1")
	public String view() {
		
		return "lesson01/test03";
	}

}
