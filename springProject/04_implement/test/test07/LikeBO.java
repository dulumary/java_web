package com.hagulu.marondalgram.post.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hagulu.marondalgram.post.dao.LikeDAO;

@Service
public class LikeBO {
	@Autowired
	private LikeDAO likeDAO;
	
	
	public boolean like(int postId, int userId) {
		if(this.existLike(postId, userId)) {
			likeDAO.deleteLikeByPostIdUserId(postId, userId);
			return false;
		} else {
			likeDAO.insertLike(postId, userId);
			return true;
		}
	}
	
	public boolean existLike(int postId, int userId) {
		int count = likeDAO.selectLikeByPostIdUserId(postId, userId);
		if(count > 0) {
			return true;
		} else {
			return false;
		}
	}
	
	public int getLikeCountByPostId(int postId) {
		
		return likeDAO.selectLikeCountByPostId(postId);
	}
	

}
