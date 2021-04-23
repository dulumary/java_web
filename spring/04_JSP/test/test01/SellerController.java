package com.hagulu.test.lesson04;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hagulu.test.lesson04.bo.SellerBO;
import com.hagulu.test.lesson04.model.Seller;

@RequestMapping("/lesson04/test01")
@Controller
public class SellerController {
	
	@Autowired
	private SellerBO sellerBO;
	
	
	// 1. seller 추가 
	@RequestMapping("/1")
	public String addSellerView() {
		return "lesson04/addSeller";
	}
	
	@RequestMapping("/add_seller")
	public String addSeller(
			@RequestParam("nickname") String nickname,
			@RequestParam("profileImageUrl") String profileImageUrl,
			@RequestParam("temperature") double temperature) {
		
		sellerBO.addSeller(nickname, profileImageUrl, temperature);
		
		return "lesson04/afterAddSeller";
	}
	
	// 2. seller 출력 
	// 3. seller 검색 출력
	@RequestMapping("/seller_info")
	public String sellerInfo(
			// 3. seller 검색 출력 id를 비필수 parameter로 받음
			@RequestParam(value = "id", required = false) Integer id,
			Model model) {
		
		Seller seller = null;
		if(id == null) {
			seller = sellerBO.getLastSeller();
		} else {
			seller = sellerBO.getSellerById(id);
		}
		
		model.addAttribute("title", "판매자 정보");
		model.addAttribute("result", seller);
		
		return "lesson04/sellerInfo";
	}
	
	
}
