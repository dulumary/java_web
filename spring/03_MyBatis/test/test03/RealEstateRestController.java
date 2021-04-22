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
	
	
	// SELECT 다루기 
	
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
	public  List<RealEstate> test01_2 (
			@RequestParam(value="rent") int rentPrice
			) {
		return realEstateBO.getRealEstateAsRent(rentPrice);
	}
	
	//	3. 복합조건 select
	// 요청 URL 예시 : http://localhost/lesson03/test01/3?area=100&price=130000
	@RequestMapping("/test01/3")
	public List<RealEstate> test01_3 (
			@RequestParam(value="area") int area,
			@RequestParam(value="price") int price
			) {
		return realEstateBO.getRealEstateAsArea(area, price);
	}
	
	// INSERT 다루기
	// 1. 객체로 insert 하기 

	// 요청 URL : http://localhost/lesson03/test02/1
	@RequestMapping("/test02/1")
	public String test02_1() {
		RealEstate realEstate = new RealEstate();
		realEstate.setRealtorId(3);
		realEstate.setAddress("푸르지용 리버 303동 1104호");
		realEstate.setArea(89);
		realEstate.setType("매매");
		realEstate.setPrice(100000);
		
		int row = realEstateBO.insertRealEstate(realEstate);
		
		return "입력 성공 : " + row;
	}
	
	// 2. field 로 insert 하기 
	// 요청 URL 예시 : http://localhost/lesson03/test02/2?realtorid=5
	
	@RequestMapping("/test02/2")
	public String test02_2(@RequestParam(value="realtorid") int realtorId) {
		
		int row = realEstateBO.insertRealEstateAsField(realtorId, "썅떼빌리버 오피스텔 814호", 45, "월세", 100000, 120);
		return "입력 성공 : " + row;
	}
	
	// UPDATE 다루기 
	// 요청 URL :  http://localhost/lesson03/test03
	@RequestMapping("/test03")
	public String test03() {
		
		int row = realEstateBO.updateRealEstateById(33, "전세", 70000);
		return "수정 성공 : " + row;
	}

}
