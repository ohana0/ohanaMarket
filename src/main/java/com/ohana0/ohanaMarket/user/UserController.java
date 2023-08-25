package com.ohana0.ohanaMarket.user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class UserController {
	
	@GetMapping("/user/login")
	public String login(){
		return "/user/login";
	}
	
	@GetMapping("/user/join")
	public String join() {
		return "/user/join";
	}

}
