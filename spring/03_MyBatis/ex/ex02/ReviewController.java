package com.hagulu.lesson03;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.hagulu.lesson03.bo.ReviewBO;
import com.hagulu.lesson03.model.Review;

@RestController
public class ReviewController {
	
	@Autowired
	private ReviewBO reviewBO;
	
	// 요청 URL : http://localhost/lesson03/ex01?id=5
	@RequestMapping("/lesson03/ex01")
	public Review ex01(
			//@RequestParam(value="id") int id// 필수 파라미터
//			@RequestParam(value="id", required=true) int id// 필수 파라미터
//			@RequestParam(value="id", required=true) Integer id// 비 필수 파라미터
			@RequestParam(value="id", defaultValue="1") int id
	) {
		
		System.out.println("#### id " + id);
		return reviewBO.getReview(id);
		
	}
	
	//요청 URL : http://localhost/lesson03/ex02
	@RequestMapping("lesson03/ex02")
	public String ex02() {
		
		Review review = new Review();
		
		review.setStoreId(2);
		review.setMenu("뿌링클");
		review.setUserName("김인규");
		review.setPoint(4.0);
		review.setReview("역시 뿌리클은 진리 입니다!!");
		
//		int row = reviewBO.addReview(review);
		int row = reviewBO.addReviewAsField(4, "콤비네이션피자", "김바다", 4.5, "할인도 많이 받고 잘먹었습니다.");
		
		return "insert row count " + row;
		
	}

}
