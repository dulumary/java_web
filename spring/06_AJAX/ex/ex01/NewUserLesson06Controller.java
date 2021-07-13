package com.hagulu.lesson06;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hagulu.lesson06.bo.NewUserLesson06BO;

@RequestMapping("/lesson06")
@Controller
public class NewUserLesson06Controller {
	
	@Autowired
	private NewUserLesson06BO newUserBO;
	
	// 유저 추가 화면
	// 요청 URL : http://localhost/lesson06/add_user_view
	@RequestMapping("/add_user_view")
	public String ex01() {
		return "lesson06/addNewUser";
	}
	
	// 유저 추가 
	// 요청 URL : http://localhost/lesson06/add_user
	@PostMapping("/add_user")
	@ResponseBody
	public String addUser(
			@RequestParam("name") String name, 
			@RequestParam("yyyymmdd") String yyyymmdd,
			@RequestParam(value = "introduce", required=false) String introduce, 
			@RequestParam(value="email", required=false) String email) {
		
		newUserBO.addNewUser(name, yyyymmdd, introduce, email);
		return "success";
	}
	
	
	// 추가된 유저 정보 화면
	// 요청 URL : http://localhost/lesson06/get_user
	@RequestMapping("/get_user")
	public String getUser() {
		return "lesson06/getNewUser";
	}
}
