package com.hagulu.marondalgram.post;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hagulu.marondalgram.post.bo.PostBO;

@Controller
@RequestMapping("/post")
public class PostController {
	
	// 로그 
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private PostBO postBO;
	
	@GetMapping("/timeline")
	public String timeline(Model model) {
		
		List<Post> postList  =  postBO.getPostList();
		
		model.addAttribute("postList", postList);
		
		return "post/timeline";
	}

}
