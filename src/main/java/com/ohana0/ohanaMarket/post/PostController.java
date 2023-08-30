package com.ohana0.ohanaMarket.post;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class PostController {
	@GetMapping("/board/post")
	public String postView() {
		return "/post/main";
	}
}
