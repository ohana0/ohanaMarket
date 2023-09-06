package com.ohana0.ohanaMarket.trade.dto;

import java.util.Date;
import java.util.List;

import com.ohana0.ohanaMarket.trade.domain.TradeImages;

import lombok.Builder;
import lombok.Getter;
@Builder
@Getter
public class TradeDetail {
	private int id;
//	private int userId;
	private String title;
	private String content;
	private int price;
	private String type;
	private String tradeLocation;
	private String state;	
	private Date createdAt;
	private Date updatedate;
	
	
	private List<TradeImages> imageList;
	private String userId;

}
