package com.hagulu.lesson04;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hagulu.lesson04.bo.NewStudentBO;
import com.hagulu.lesson04.model.NewStudent;

@RequestMapping("/lesson04")
@Controller
public class NewStudentController {
	
	@Autowired
	private NewStudentBO newStudentBO;

	// 요청 URL : http://localhost/lesson04/ex02/1
	@GetMapping("/ex02/1")
	public String addStudentView() {
		return "lesson04/addStudent";
	}
	
	// 요청 URL : http://localhost/lesson04/ex02/add_student
	@PostMapping("/ex02/add_student")
	public String addStudent(
			@ModelAttribute NewStudent newStudent, // form name 값과 일치하는 필드에 값이 저장된다.
			Model model) {
		
		// 1. DB 에 학생정보 추가 
		newStudentBO.addNewStudent(newStudent);  // MyBatis에서 usedGeneratedKey를 설정하여 추가된 데이터의 PK를 얻어낸다.
		
		// 2. jsp view에 객체 담기 
		model.addAttribute("result", newStudent); // usedGeneratedKey와 keyProperty로 인해 id값이 객체에 채워진 상태가 된다. 
		model.addAttribute("subject", "학생 정보");
		
		return "lesson04/studentInfo";
	}
			
	
	
}
