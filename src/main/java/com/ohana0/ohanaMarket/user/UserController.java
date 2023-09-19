package com.ohana0.ohanaMarket.user;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ohana0.ohanaMarket.post.dto.PostDetail;
import com.ohana0.ohanaMarket.post.service.PostService;
import com.ohana0.ohanaMarket.trade.dto.TradeDetail;
import com.ohana0.ohanaMarket.trade.service.TradeService;
import com.ohana0.ohanaMarket.user.domain.User;
import com.ohana0.ohanaMarket.user.service.UserService;

@Controller
public class UserController {
	@Autowired
	private UserService userService;
	@Autowired
	private PostService postService;
	@Autowired
	private TradeService tradeService;
	
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
	@GetMapping("/user/profile")
	public String profileView(@RequestParam("userId")String userId,Model model) {
		User user = userService.getUserById(userId);
		if(user==null) {
			return"/user/profile";
		}
		int id = user.getId();
		List<PostDetail> postList = postService.getPostDetailByUserId(id);
		List<TradeDetail> tradeList = tradeService.getTradeDetailByUserId(id);
		
		model.addAttribute("user",user);
		model.addAttribute("postList",postList);
		model.addAttribute("tradeList", tradeList);
		return "/user/profile";
	}
}
