package com.ohana0.ohanaMarket.post;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.ohana0.ohanaMarket.post.domain.Post;
import com.ohana0.ohanaMarket.post.service.PostService;

@Controller
public class PostController {
	@Autowired
	private PostService postService;
	
	@GetMapping("/board/post")
	public String postView(Model model) {
		List<Post> postList = postService.getPostInfo();
		model.addAttribute("postList",postList);
		return "/post/main";
	}
	
	@GetMapping("/board/post/new")
	public String newPost() {

		
		return "/post/newPost";

	}
	

}
