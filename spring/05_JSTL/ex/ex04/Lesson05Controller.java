package com.hagulu.lesson05;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/lesson05")
@Controller
public class Lesson05Controller {
	
	@RequestMapping("/ex01")
	public String ex01() {
		
		return "lesson05/ex01";
	}
	
	@RequestMapping("/ex02")
	public String ex02 (Model model) {
		
		// List
		List<String> fruits = new ArrayList<>();
		fruits.add("apple");
		fruits.add("melon");
		fruits.add("peach");
		fruits.add("grape");
		fruits.add("mango");
		
		model.addAttribute("fruits", fruits);
		
		// List<Map>
		List<Map<String, Object>> users = new ArrayList<>();
		Map<String, Object> map = new HashMap<>();
		map.put("name", "김인규");
		map.put("age", 28);
		map.put("hobby", "댄스");
		users.add(map);

		map = new HashMap<>();
		map.put("name", "신바다");
		map.put("age", 3);
		map.put("hobby", "사냥하기");
		users.add(map);
		
		model.addAttribute("users", users);
		
		
		return "lesson05/ex02";
	}
	
	@RequestMapping("/ex03")
	public String ex03(Model model) {
		
		Date today = new Date();
		model.addAttribute("today", today);
		
		return "lesson05/ex03";
	}
	
	@RequestMapping("/ex04") 
	public String ex04() {
		
		return "lesson05/ex04";
	}
	

}
