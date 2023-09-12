package com.ohana0.ohanaMarket.trade.domain;

import java.util.Date;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Builder
public class Trade {
	private int id;
	private int userId;
	private String title;
	private String content;
	private int price;
	private String type;
	private String tradeLocation;
	private String state;
	private Date createdAt;
	private Date updatedAt;
}
