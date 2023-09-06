package com.ohana0.ohanaMarket.trade.domain;

import java.util.Date;

import lombok.Getter;
@Getter
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
	private Date updatedate;


}
