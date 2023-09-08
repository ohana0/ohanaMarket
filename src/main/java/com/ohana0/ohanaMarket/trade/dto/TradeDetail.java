package com.ohana0.ohanaMarket.trade.dto;

import java.util.Date;
import java.util.List;

import com.ohana0.ohanaMarket.image.domain.Image;

import lombok.Builder;
import lombok.Getter;
@Builder
@Getter
public class TradeDetail {
	
	private int id;
	private String userId;
	private String title;
	private String content;
	private int price;
	private String type;
	private String tradeLocation;
	private String state;
	private Date createdAt;
	private Date updatedAt;
	
	private List<Image> imageList;
	private String thumbnailImagePath;

}
