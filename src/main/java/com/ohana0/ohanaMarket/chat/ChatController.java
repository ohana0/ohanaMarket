package com.ohana0.ohanaMarket.chat;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.ohana0.ohanaMarket.chat.dto.ChatDetail;
import com.ohana0.ohanaMarket.chat.service.ChatService;

@Controller
public class ChatController {
	@Autowired
	private ChatService chatService;
	
	@GetMapping("/chat/main")
	public String viewMain(HttpSession session) {
		int userId = (int)session.getAttribute("id");
		List<ChatDetail> chatList = chatService.getChatList(userId);
		
		return "/chat/chatMain";
	}
	
	
	

}
