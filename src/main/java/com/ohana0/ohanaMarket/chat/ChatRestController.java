package com.ohana0.ohanaMarket.chat;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ohana0.ohanaMarket.chat.service.ChatService;
import com.ohana0.ohanaMarket.user.domain.User;
import com.ohana0.ohanaMarket.user.service.UserService;

@RestController
public class ChatRestController {
	@Autowired
	private ChatService chatService;
	@Autowired
	private UserService userService;
	@PostMapping("/chat/new")
	public Map<String,String> newChat(HttpSession session,String guestId){
		int hostId = (int)session.getAttribute("id");
		User user = userService.getUserById(guestId);
		int guestOriginalId = user.getId();
		
		int count = chatService.addChat(hostId,guestOriginalId);
		Map<String,String> resultMap = new HashMap<>();
		if(count > 0) {
			resultMap.put("result", "success");
		}
		else {
			resultMap.put("result", "false");
		}
		
		return resultMap;
		
	}
	@PostMapping("/chat/sendMessage")
	public Map<String,String> sendMessage(int chatId, String content, HttpSession session){
		int userId = (int)session.getAttribute("id");
		int count = chatService.addMessage(chatId,userId,content);
		
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
