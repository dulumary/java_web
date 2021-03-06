package com.hagulu.marondalgram.post.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface LikeDAO {

	public int selectLikeByPostIdUserId(@Param("postId") int postId, @Param("userId") int userId);
	
	public int insertLike(@Param("postId") int postId, @Param("userId") int userId);
	public int deleteLikeByPostIdUserId(@Param("postId") int postId, @Param("userId") int userId);
	
	public int selectLikeCountByPostId(@Param("postId") int postId);
	
	
}
