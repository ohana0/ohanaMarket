package com.ohana0.ohanaMarket.chat;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ohana0.ohanaMarket.chat.domain.Chat;
import com.ohana0.ohanaMarket.chat.service.ChatService;
import com.ohana0.ohanaMarket.user.domain.User;
import com.ohana0.ohanaMarket.user.service.UserService;

@RestController
public class ChatRestController {
	@Autowired
	private ChatService chatService;

	@PostMapping("/chat/new")
	public Map<String,String> newChat(HttpSession session,@RequestParam("guestId")int guestId){
		int hostId = (int)session.getAttribute("id");
		if(hostId == guestId) {
			Map<String,String> resultMap = new HashMap<>();
			resultMap.put("result", "false");
			return resultMap;
		}
		
		Chat chat = Chat.builder()
				.hostId(hostId)
				.guestId(guestId)
				.build();
		int count = chatService.addChat(chat);
		
		Map<String,String> resultMap = new HashMap<>();
		if(count > 0) {
			resultMap.put("result", "success");
			resultMap.put("chatId", String.valueOf(chat.getId()));
		}
		else {
			resultMap.put("result", "false");
		}
		
		return resultMap;
		
	}
	@PostMapping("/chat/sendMessage")
	public Map<String,String> sendMessage(@RequestParam(value="chatId",required=false)Integer chatId, @RequestParam("content")String content, HttpSession session){
		if(chatId == null) {
			Map<String,String> resultMap = new HashMap<>();
			resultMap.put("result", "false");
		}
		
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