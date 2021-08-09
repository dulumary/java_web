package com.hagulu.marondalgram.post.model;

import java.util.List;

import com.hagulu.marondalgram.post.comment.model.Comment;

public class PostWithComments {
	
	private Post post;
	private int likeCount;
	private boolean isLike;
	private List<Comment> commentList;
	
	public Post getPost() {
		return post;
	}
	public void setPost(Post post) {
		this.post = post;
	}
	public int getLikeCount() {
		return likeCount;
	}
	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}
	
	public boolean isLike() {
		return isLike;
	}
	public void setLike(boolean isLike) {
		this.isLike = isLike;
	}
	public List<Comment> getCommentList() {
		return commentList;
	}
	public void setCommentList(List<Comment> commentList) {
		this.commentList = commentList;
	} 

	
}
