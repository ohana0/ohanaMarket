package com.ohana0.ohanaMarket.comment.domain;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Comment {
	
	private int id;
	private int userId;
	private int postId;
	private String content;
	private Date createdAt;
	private Date updatedAt;
}
