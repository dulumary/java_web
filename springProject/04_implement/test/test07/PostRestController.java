package com.hagulu.marondalgram.post;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.hagulu.marondalgram.post.bo.LikeBO;
import com.hagulu.marondalgram.post.bo.PostBO;

@RestController
@RequestMapping("/post")
public class PostRestController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private PostBO postBO;
	
	@Autowired
	private LikeBO likeBO;
	
	
	@PostMapping("/create")
	public Map<String, String> create(
			@RequestParam("content") String content
			, @RequestParam("file") MultipartFile file
			, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		int userId = (Integer) session.getAttribute("userId");
		String userName = (String) session.getAttribute("userName");
		
		int count = postBO.addPost(userId, userName, content, file);
		
		Map<String, String> result = new HashMap<>();
		
		if(count == 0) {
			result.put("result", "fail");	
			
			logger.error("post crate 실패");
		} else {
			result.put("result", "success");
		}
		
		return result;
	}
	
	@GetMapping("/like")
	public Map<String, Object> like(
			@RequestParam("postId") int postId
			, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		int userId = (Integer) session.getAttribute("userId");
		
		Map<String, Object> result = new HashMap<>();
		if(likeBO.like(postId, userId)) {
			result.put("result", "like");
		} else {
			result.put("result", "unlike");
		}
		
		result.put("likeCount", likeBO.getLikeCountByPostId(postId));
		
		return result;
	}
	

}
