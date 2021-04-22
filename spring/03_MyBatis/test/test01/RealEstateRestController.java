package com.hagulu.test.lesson03;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.hagulu.test.lesson03.bo.RealEstateBO;
import com.hagulu.test.lesson03.model.RealEstate;

@RestController
@RequestMapping("/lesson03")
public class RealEstateRestController {
	
	@Autowired
	private RealEstateBO realEstateBO;
	
	// 1. id 로 select 하기 
	// 요청 URL 예시 : http://localhost/lesson03/test01/1?id=22
	@RequestMapping("/test01/1")
	public RealEstate test01_1(
			@RequestParam(value="id") int id
			) {
		
		return realEstateBO.getRealEstate(id);
	}
	
	// 2. 월세 조건 select
	// 요청 URL 예시 : http://localhost/lesson03/test01/2?rent=90
	@RequestMapping("/test01/2")
	public  List<RealEstate> test02_2 (
			@RequestParam(value="rent") int rentPrice
			) {
		return realEstateBO.getRealEstateAsRent(rentPrice);
	}
	
	//	3. 복합조건 select
	// 요청 URL 예시 : http://localhost/lesson03/test01/3?area=90&price=130000
	@RequestMapping("/test01/3")
	public List<RealEstate> test03_3 (
			@RequestParam(value="area") int area,
			@RequestParam(value="price") int price
			) {
		return realEstateBO.getRealEstateAsArea(area, price);
	}

}
