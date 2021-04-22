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
	
	
	// SELECT 다루기 
	
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
	
	
	// INSERT 다루기 
	
	// 1. 객체로 insert 하기 
	public int insertRealEstate(RealEstate realEstate) {
		return realEstateDAO.insertRealEstate(realEstate);
	}
	
	// 2. field로 insert 하기 
	public int insertRealEstateAsField(
			int realtorId, String address, int area, String type, int price, int rentPrice) {
		
		return realEstateDAO.insertRealEstateAsField(realtorId, address, area, type, price, rentPrice);
	}
	
	// UPDATE 다루기 
	public int updateRealEstateById(int id, String type, int price) {
		return realEstateDAO.updateRealEstateById(id, type, price);
	}
	
	// DELETE 다루기 
	public int deleteRealEstateById(int id) {
		return realEstateDAO.deleteRealEstateById(id);
	}
	
	
	
	
}
