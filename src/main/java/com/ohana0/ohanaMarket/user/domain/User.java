package com.ohana0.ohanaMarket.user.domain;

import java.time.ZonedDateTime;

import lombok.Getter;

@Getter
public class User {
	
	private int id;
	private String loginId;
	private String password;
	private String nickname;
	private String profileImagePath;
	private String phoneNumber;
	private String introduce;
	private String region;
	private ZonedDateTime createdAt;
	private ZonedDateTime updatedat;


}
