package com.ohana0.ohanaMarket.chat.domain;

import java.util.Date;

import lombok.Getter;
@Getter
public class Chat {
	private int id;
	private int hostId;
	private int guestId;
	private Date createdAt;
	private Date updatedAt;


}
