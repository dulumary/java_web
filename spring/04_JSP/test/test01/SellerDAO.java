package com.hagulu.test.lesson04.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.hagulu.test.lesson04.model.Seller;

@Repository
public interface SellerDAO {
	
	// 1. seller 추가
	public int insertSeller(
			@Param("nickname") String nickname,
			@Param("profileImageUrl") String profileImageUrl,
			@Param("temperature") double temperature);

	// 2. seller 출력
	public Seller selectLastSeller();
	
	// 3. seller 검색 출력
	public Seller selectSellerById(@Param("id") int id);
}
