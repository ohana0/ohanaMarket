package com.ohana0.ohanaMarket.post.dto;

import java.util.Date;
import java.util.List;

import com.ohana0.ohanaMarket.comment.dto.CommentDetail;

import lombok.Builder;
import lombok.Getter;
@Getter
@Builder
public class PostDetail {
	private int id;
	private String userId;
	private String title;
	private String content;
	private String contentSummary;
	private String thumbnail;
	private int commentCount;
	private Date createdAt;
	
	private long dateAgo;
	
	private List<CommentDetail> commentList;

}
