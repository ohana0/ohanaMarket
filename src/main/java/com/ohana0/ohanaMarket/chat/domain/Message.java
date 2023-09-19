package com.ohana0.ohanaMarket.chat.domain;

import java.util.Date;

import lombok.Getter;
@Getter
public class Message {
	private int id;
	private int chatId;
	private int userId;
	private String content;
	private Date createdAt;
	private Date updatedAt;


}
