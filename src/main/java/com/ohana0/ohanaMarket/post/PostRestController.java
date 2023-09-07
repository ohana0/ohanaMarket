package com.ohana0.ohanaMarket.post;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.ohana0.ohanaMarket.image.service.ImageService;
import com.ohana0.ohanaMarket.post.service.PostService;

@RestController
public class PostRestController {
	@Autowired
	private PostService postService;
	
	@PostMapping("/board/post/new/input")
	public Map<String,String> createPost(
			@RequestParam("title")String title
			,@RequestParam("content")String content
			,HttpSession session){
		int userId = (Integer) session.getAttribute("id");
		int count = postService.addPost(userId,title,content);
		
		Map<String,String> resultMap = new HashMap<>();
		if(count > 0) {
			resultMap.put("result", "success");
		}
		else {
			resultMap.put("result", "false");
		}
		
		return resultMap;

	}


	@DeleteMapping("/board/post/delete")
	public Map<String,String> deletePost(@RequestParam("postId")int postId){
		int count = postService.deletePost(postId);
		Map<String,String> resultMap = new HashMap<>();
		if(count > 0) {
			resultMap.put("result", "success");
		}
		else {
			resultMap.put("result", "false");
		}
		
		return resultMap;
		
		
	}
	
	@PostMapping("/board/post/update/input")
	public Map<String,String> updatePost(
			@RequestParam("postId") int postId
			,@RequestParam("title") String title
			,@RequestParam("content") String content){
		
		int count = postService.updatePost(postId,title,content);
		
		Map<String,String> resultMap = new HashMap<>();
		if(count > 0) {
			resultMap.put("result", "success");
		}
		else {
			resultMap.put("result", "false");
		}
		
		return resultMap;
	}
	
	

}
