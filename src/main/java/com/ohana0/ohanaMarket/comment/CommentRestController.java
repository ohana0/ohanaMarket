package com.ohana0.ohanaMarket.comment;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ohana0.ohanaMarket.comment.service.CommentService;

@RestController
public class CommentRestController {
	
	@Autowired
	private CommentService commentService;
	
	@PostMapping("/board/post/new/comment")
	public Map<String,String> createComment(
			@RequestParam("id") int id
			,@RequestParam("postId")int postId
			,@RequestParam("content") String content){
		
		int count = commentService.addComment(id,postId,content);
		
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
