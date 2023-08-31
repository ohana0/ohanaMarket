package com.ohana0.ohanaMarket.user;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class UserController {
	
	@GetMapping("/user/login/view")
	public String login(){
		return "/user/login";
	}
	
	@GetMapping("/user/join/view")
	public String join() {
		return "/user/join";
	}
	
	@GetMapping("/user/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("loginId");
		session.removeAttribute("profileImagePath");
		session.removeAttribute("id");
		
		return "redirect:/user/login/view";
	}
}
