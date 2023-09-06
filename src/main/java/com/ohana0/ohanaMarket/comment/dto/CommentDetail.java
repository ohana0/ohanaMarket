package com.ohana0.ohanaMarket.comment.dto;

import java.util.Date;

import lombok.Builder;
import lombok.Getter;
@Getter
@Builder
public class CommentDetail {
	private String userId;
	private int postId;
	private String content;
	private Date createdAt;
	

}
