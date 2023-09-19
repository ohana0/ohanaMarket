package com.ohana0.ohanaMarket.post;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ohana0.ohanaMarket.post.dto.PostDetail;
import com.ohana0.ohanaMarket.post.service.PostService;

@Controller
public class PostController {
	@Autowired
	private PostService postService;
	
	@GetMapping("/board/post/main")
	public String postMainView(Model model) {
		List<PostDetail> postList = postService.getPostInfo();
		model.addAttribute("postList",postList);
		return "/post/main";
	}
	
	@GetMapping("/board/post/new")
	public String newPost() {

		
		return "/post/newPost";

	}
	@GetMapping("/board/post")
	public String postDetailView(@RequestParam("id")int id, Model model) {
		PostDetail post = postService.getPostDetailById(id);
		model.addAttribute("post", post);
		return "/post/postDetail";
	}
	@GetMapping("/board/post/update")
	public String updatePostView(@RequestParam("id") int id,Model model) {
		PostDetail post = postService.getPostDetailById(id);
		model.addAttribute("post",post);
		return"/post/updatePost";
		
	}
	@GetMapping("/board/post/search")
	public String searchPost(@RequestParam("keyWord")String keyWord,Model model) {
		List<PostDetail> postList = postService.getPostDetailByKeyWord(keyWord);
		model.addAttribute("postList", postList);
		return "/post/main";
	}
	
	
	
	

}
