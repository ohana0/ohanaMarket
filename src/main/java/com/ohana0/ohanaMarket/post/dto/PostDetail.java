package com.ohana0.ohanaMarket.post.dto;

import java.util.Date;

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

}
