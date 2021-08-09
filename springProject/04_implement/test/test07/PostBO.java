package com.hagulu.marondalgram.post.bo;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.hagulu.marondalgram.common.FileManagerService;
import com.hagulu.marondalgram.post.comment.bo.CommentBO;
import com.hagulu.marondalgram.post.comment.model.Comment;
import com.hagulu.marondalgram.post.dao.PostDAO;
import com.hagulu.marondalgram.post.model.Post;
import com.hagulu.marondalgram.post.model.PostWithComments;

@Service
public class PostBO {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private PostDAO postDAO;
	
	@Autowired
	private CommentBO commentBO;
	
	@Autowired
	private LikeBO likeBO;

	
	private List<PostWithComments> generatePostWithComments(int userId, List<Post> postList) {
		
		List<PostWithComments> list = new ArrayList<>();
		
		for(Post post : postList) {
			PostWithComments postWithComments = new PostWithComments();
			postWithComments.setPost(post);
			
			List<Comment> commentList = commentBO.getCommentListByPostId(post.getId());
			
			postWithComments.setCommentList(commentList);
			
			int likeCount = likeBO.getLikeCountByPostId(post.getId());
			postWithComments.setLikeCount(likeCount);
			
			if(userId != 0) {
				postWithComments.setLike(likeBO.existLike(post.getId(), userId));
			}
			
			list.add(postWithComments);
		}
		
		return list;
	}

	public int addPost(int userId, String userName, String content, MultipartFile file) {
		
		content = content.replace("\n", "<br>");
		
		String filePath = null;
		try {
			filePath = FileManagerService.saveImageFile(userId, file);
			
			if(filePath == null) {
				logger.error("file 저장 실패");
			}
			return postDAO.insertPost(userId, userName, content, filePath);
		} catch (IOException e) {
			e.printStackTrace();
			return 0;
		}
		
		
	}
	
	public List<PostWithComments> getPostListByUserId(int userId) {
		
		List<Post> postList = postDAO.selectPostList();
		
		return this.generatePostWithComments(userId, postList);
		
	}
	
	public List<PostWithComments> getPostList() {
		
		List<Post> postList = postDAO.selectPostList();
		
		return this.generatePostWithComments(0, postList);
		
	}

 }
