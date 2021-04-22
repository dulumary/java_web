package com.hagulu.test.lesson03.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.hagulu.test.lesson03.model.RealEstate;

@Repository
public interface RealEstateDAO {

	// 1. id 로 select 하기 
	public RealEstate selectRealEstate(@Param("id") int id);
	
	// 2. 월세 조건 select
	public List<RealEstate> selectRealEstateAsRent (@Param("rentPrice") int rentPrice);
	
	//	3. 복합조건 select
	public List<RealEstate> selectRealEstateAsArea(
			@Param("area") int area,
			@Param("price") int price);
}
