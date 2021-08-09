package com.hagulu.marondalgram.post;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hagulu.marondalgram.post.bo.PostBO;
import com.hagulu.marondalgram.post.model.PostWithComments;

@Controller
@RequestMapping("/post")
public class PostController {
	
	// 로그 
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private PostBO postBO;
	
	@GetMapping("/timeline")
	public String timeline(HttpServletRequest request
			,Model model) {
		
		HttpSession session = request.getSession();
		
		Integer userId = (Integer)session.getAttribute("userId");
		
		List<PostWithComments> postList  = null;
		if(userId == null) {
			postList = postBO.getPostList();
		} else {
			postList = postBO.getPostListByUserId(userId);
		}
		
		model.addAttribute("postList", postList);
		
		return "post/timeline";
	}

}
