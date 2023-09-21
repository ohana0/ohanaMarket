package com.ohana0.ohanaMarket.chat.domain;

import java.util.Date;

import lombok.Builder;
import lombok.Getter;
@Getter
@Builder
public class Chat {
	private int id;
	private int hostId;
	private int guestId;
	private Date createdAt;
	private Date updatedAt;


}
