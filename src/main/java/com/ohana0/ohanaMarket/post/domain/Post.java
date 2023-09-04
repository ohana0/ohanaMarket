package com.ohana0.ohanaMarket.post.domain;

import java.time.ZonedDateTime;

import lombok.Getter;

@Getter
public class Post {
	
	private int id;
	private int userId;
	private String title;
	private String content;
	private ZonedDateTime createdAt;
	private ZonedDateTime updatedAt;
	
}
