package com.hagulu.test.lesson04;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hagulu.test.lesson04.bo.RealtorBO;
import com.hagulu.test.lesson04.model.Realtor;

@RequestMapping("/lesson04/test02")
@Controller
public class RealtorController {
	
	@Autowired
	private RealtorBO realtorBO;
	
	// 요청 URL : http://localhost/lesson04/test02/1
	@GetMapping("/1")
	public String addRealtorView() {
		return "lesson04/addRealtor";
	}
	
	// 요청 URL : http://localhost/lesson04/test02/add_realtor
	@PostMapping("/add_realtor")
	public String addRealtor(
			@ModelAttribute Realtor realtor, 
			Model model
			) {
		
		realtorBO.addRealtor(realtor);
		
		Realtor result = realtorBO.getRealtor(realtor.getId());
		
		model.addAttribute("title", "공인중개사 정보");
		model.addAttribute("result", result);
		
		return "lesson04/realtorInfo";
	}
	

}
