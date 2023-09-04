package com.ohana0.ohanaMarket.post.domain;

import java.util.Date;

import lombok.Getter;

@Getter
public class Post {
	
	private int id;
	private int userId;
	private String title;
	private String content;
	private Date createdAt;
	private Date updatedAt;
	
}
