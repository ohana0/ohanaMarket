package com.ohana0.ohanaMarket.post;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

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

	@PostMapping("/uploadSummernoteImageFile")
	public Map<String,String> uploadImage(@RequestParam("file") MultipartFile file
			, HttpSession session
			, Model model) {
		String loginId = (String)session.getAttribute("loginId");
		String imagePath = postService.uploadImage(loginId,file);
		Map<String,String> resultMap = new HashMap<>();		
		if(!imagePath.isEmpty()) {
			resultMap.put("result", "success");
			resultMap.put("url", imagePath);
			
		}
		else {
			resultMap.put("result", "fail");
		}
		
		return resultMap;
		
	}
	
	

}
