package com.hagulu.test.lesson05;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hagulu.test.lesson02.bo.StoreBO;
import com.hagulu.test.lesson05.bo.ReviewBO;

@RequestMapping("/lesson05/test06")
@Controller
public class StoreReviewController {
	
	@Autowired
	private StoreBO storeBO;
	
	@Autowired
	private ReviewBO reviewBO;

	@RequestMapping("/stores") 
	public String stores(Model model) {
		
		model.addAttribute("storesInfo", storeBO.getStore());
		
		return "lesson05/test06/stores";
		
	}
	
	@RequestMapping("/reviews")
	public String reviews(
			@RequestParam("storeId") int storeId
			,@RequestParam("storeName") String storeName
			, Model model)  {
		model.addAttribute("storeName", storeName);
		model.addAttribute("reviews", reviewBO.getReviewByStoreId(storeId));
		
		return "lesson05/test06/reviews";
	}
}
