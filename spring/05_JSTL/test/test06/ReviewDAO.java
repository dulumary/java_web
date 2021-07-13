package com.hagulu.test.lesson05.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.hagulu.test.lesson05.model.Review;

@Repository
public interface ReviewDAO {
	
	public List<Review> selectReviewByStoreId(@Param("storeId") int storeId);

}
