package com.ohana0.ohanaMarket.image.domain;

import lombok.Getter;

@Getter
public class Image {
	private int id;
	private int postId;//type:user일경우 null
	private String type;//TRADE인지 POST인지 USER인지
	private String url;
	

}
