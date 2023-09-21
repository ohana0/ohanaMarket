package com.ohana0.ohanaMarket.chat;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ohana0.ohanaMarket.chat.dto.ChatDetail;
import com.ohana0.ohanaMarket.chat.service.ChatService;

@Controller
public class ChatController {
	@Autowired
	private ChatService chatService;
	
	@GetMapping("/chat/main")
	public String viewMain(@RequestParam(value="id",required=false)Integer id,HttpSession session,Model model) {
		
		int userId = (int)session.getAttribute("id");
		List<ChatDetail> chatList = chatService.getChatList(userId);
		if(id !=null) {
			ChatDetail chat = chatService.getChat(id,userId);
			model.addAttribute("thisChat",chat);
		}
		model.addAttribute("chatList", chatList);
		return "/chat/chatMain";
	}
	
	
	

}
