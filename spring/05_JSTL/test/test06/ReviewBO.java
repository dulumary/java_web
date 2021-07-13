package com.hagulu.test.lesson05.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hagulu.test.lesson05.dao.ReviewDAO;
import com.hagulu.test.lesson05.model.Review;

@Service
public class ReviewBO {
	
	@Autowired
	private ReviewDAO reviewDAO;
	
	public List<Review> getReviewByStoreId(int storeID) {
		return    reviewDAO.selectReviewByStoreId(storeID); 
	}
	

}
