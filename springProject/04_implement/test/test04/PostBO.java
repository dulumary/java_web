package com.hagulu.marondalgram.post.bo;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.hagulu.marondalgram.post.dao.PostDAO;
import com.hagulu.marondalgram.post.model.Post;

@Service
public class PostBO {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private PostDAO postDAO;
	
	public List<Post> getPostList() {
		
		return postDAO.selectPostList();
	}
	
 }
