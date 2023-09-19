package com.ohana0.ohanaMarket.chat.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ohana0.ohanaMarket.chat.domain.Chat;
import com.ohana0.ohanaMarket.chat.dto.ChatDetail;
import com.ohana0.ohanaMarket.chat.repository.ChatRepository;
import com.ohana0.ohanaMarket.chat.repository.MessageRepository;
import com.ohana0.ohanaMarket.user.service.UserService;

@Service
public class ChatService {
	@Autowired
	private ChatRepository chatRepository;
	@Autowired
	private MessageRepository messageRepository;
	@Autowired
	private UserService userService;
	
	public int addChat(int hostId, int guestId) {
		int count =  chatRepository.insertChat(hostId,guestId);
		return count;
	}

	public int addMessage(int chatId, int userId, String content) {
		int count = messageRepository.insertMessage(chatId,userId,content);
		chatRepository.insertMessage(chatId);
		return count;
	}

	public List<ChatDetail> getChatList(int userId) {
		List<Chat> originalChatList = chatRepository.selectChatByUserId(userId);
		List<ChatDetail> chatList = new ArrayList<>();
		for(Chat chat:originalChatList) {
			ChatDetail chatDetail = ChatDetail.builder()
					.id(chat.getId())
					.host(userService.getUserById(chat.getHostId()))
					.guest(userService.getUserById(chat.getGuestId()))
					.updatedAt(chat.getUpdatedAt())
					.messageList(messageRepository.selectMessageByUserId(userId))
					.build();
			chatList.add(chatDetail);
			
			
		}
		
		
		
		return chatList;
	}

}
