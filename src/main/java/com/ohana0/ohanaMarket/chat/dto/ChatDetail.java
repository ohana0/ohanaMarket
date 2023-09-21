package com.ohana0.ohanaMarket.chat.dto;

import java.util.Date;
import java.util.List;

import com.ohana0.ohanaMarket.chat.domain.Message;
import com.ohana0.ohanaMarket.user.domain.User;

import lombok.Builder;
import lombok.Getter;
@Builder
@Getter
public class ChatDetail {
	private int id;
	private int hostId;
	private int guestId;
	private Date createdAt;
	private Date updatedAt;
	
	private List<Message> messageList;
	private User host;
	private User guest;
	private String lastMessage;
	private int dateAgo;
	
	
}
