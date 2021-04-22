package com.hagulu.test.lesson03.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.hagulu.test.lesson03.model.RealEstate;

@Repository
public interface RealEstateDAO {

	// SELECT 다루기 
	
	// 1. id 로 select 하기 
	public RealEstate selectRealEstate(@Param("id") int id);
	
	// 2. 월세 조건 select
	public List<RealEstate> selectRealEstateAsRent (@Param("rentPrice") int rentPrice);
	
	//	3. 복합조건 select
	public List<RealEstate> selectRealEstateAsArea(
			@Param("area") int area,
			@Param("price") int price);
	
	
	// INSERT 다루기 
	
	// 1. 객체로 insert 하기 
	public int insertRealEstate(RealEstate realEstate);
	
	// 2. field 로 insert 하기
	public int insertRealEstateAsField(
			@Param("realtorId") int realtorId,
			@Param("address") String address,
			@Param("area") int area,
			@Param("type") String type,
			@Param("price") int price,
			@Param("rentPrice") int rentPrice); 
	
	// UPDATE 다루기 
	public int updateRealEstateById(
			@Param("id") int id,
			@Param("type") String type, 
			@Param("price") int price);
}
