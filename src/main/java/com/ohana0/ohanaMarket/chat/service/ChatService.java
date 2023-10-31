package com.ohana0.ohanaMarket.chat.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ohana0.ohanaMarket.chat.domain.Chat;
import com.ohana0.ohanaMarket.chat.domain.Message;
import com.ohana0.ohanaMarket.chat.dto.ChatDetail;
import com.ohana0.ohanaMarket.chat.repository.ChatRepository;
import com.ohana0.ohanaMarket.chat.repository.MessageRepository;
import com.ohana0.ohanaMarket.user.domain.User;
import com.ohana0.ohanaMarket.user.service.UserService;

@Service
public class ChatService {
	@Autowired
	private ChatRepository chatRepository;
	@Autowired
	private MessageRepository messageRepository;
	@Autowired
	private UserService userService;
	
	public int addChat(Chat chat) {
		int count = chatRepository.insertChat(chat);
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
			int id = chat.getId();
			Date date = new Date();
			long millisecond = date.getTime()- chat.getUpdatedAt().getTime();
			int day =  (int) Math.floor(millisecond/(1000*60*60*24));
			
			List<Message> messageList = messageRepository.selectMessageByChatId(chat.getId());
			String lastMessage = "";
			if(messageList.size() !=0) {
				lastMessage = messageRepository.getLastMessage(id);
			}
			User yourProfile = new User();
			if(userId == chat.getHostId()) {			
				yourProfile = userService.getUserById(chat.getGuestId());
			}
			else {
				yourProfile = userService.getUserById(chat.getHostId());
			}
			
			
			ChatDetail chatDetail = ChatDetail.builder()
					.id(chat.getId())
					.myProfile(userService.getUserById(userId))
					.yourProfile(yourProfile)
					.dateAgo(day)
					.messageList(messageList)
					.lastMessage(lastMessage)
					.build();
			chatList.add(chatDetail);
			
			
		}
		
		
		
		return chatList;
	}

	public ChatDetail getChat(int id,int userId) {
		Chat chat = chatRepository.selectChatById(id);
		Date date = new Date();
		long millisecond = date.getTime()- chat.getUpdatedAt().getTime();
		List<Message> messageList = messageRepository.selectMessageByChatId(chat.getId());
		String lastMessage = "";
		if(messageList.size() !=0) {
			lastMessage = messageRepository.getLastMessage(id);
		}
		int day =  (int) Math.floor(millisecond/(1000*60*60*24));
		
		User yourProfile = new User();
		if(userId == chat.getHostId()) {			
			yourProfile = userService.getUserById(chat.getGuestId());
		}
		else {
			yourProfile = userService.getUserById(chat.getHostId());
		}
		
		ChatDetail chatDetail = ChatDetail.builder()
				.id(chat.getId())
				.myProfile(userService.getUserById(userId))
				.yourProfile(yourProfile)
				.dateAgo(day)
				.messageList(messageList)
				.lastMessage(lastMessage)
				.build();
		return chatDetail;
	}


	public int deleteChat(int chatId) {
		int count = chatRepository.deleteChat(chatId);
		messageRepository.deleteMessageByChatId(chatId);
		return count;
	}


}
