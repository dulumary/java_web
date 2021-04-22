package com.hagulu.test.lesson03.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hagulu.test.lesson03.dao.RealEstateDAO;
import com.hagulu.test.lesson03.model.RealEstate;

@Service
public class RealEstateBO {
	
	@Autowired
	private RealEstateDAO realEstateDAO;
	
	//	1. id 로 select 하기 
	public RealEstate getRealEstate(int id) {
		
		return realEstateDAO.selectRealEstate(id);
	}
	
	// 2. 월세 조건 select
	public List<RealEstate> getRealEstateAsRent(int rentPrice) {
		return realEstateDAO.selectRealEstateAsRent(rentPrice);
	}
	
	//	3. 복합조건 select
	public List<RealEstate> getRealEstateAsArea(int area, int price) {
		return realEstateDAO.selectRealEstateAsArea(area, price);
	}
}
