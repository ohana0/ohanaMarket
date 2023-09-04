package com.ohana0.ohanaMarket.post.dto;

import lombok.Builder;
import lombok.Getter;
@Getter
@Builder
public class PostDetail {
	private int id;
	private String userLoginId;
	private String title;
	private String contentSummary;
	private String thumbnail;

}
