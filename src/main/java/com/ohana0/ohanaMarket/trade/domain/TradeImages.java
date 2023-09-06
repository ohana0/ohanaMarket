package com.ohana0.ohanaMarket.trade.domain;

import java.util.Date;

import lombok.Getter;

@Getter
public class TradeImages {
	private int id;
	private int postId;
	private String url;
	private Date createdAt;
	private Date updatedAt;
}
