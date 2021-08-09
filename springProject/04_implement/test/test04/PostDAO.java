package com.hagulu.marondalgram.post.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.hagulu.marondalgram.post.model.Post;

@Repository
public interface PostDAO {
	
	public List<Post> selectPostList();
	
}
