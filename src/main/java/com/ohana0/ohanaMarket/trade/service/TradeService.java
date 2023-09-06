package com.ohana0.ohanaMarket.trade.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.ohana0.ohanaMarket.trade.dto.TradeDetail;
import com.ohana0.ohanaMarket.trade.repository.TradeRepository;

@Service
public class TradeService {
	@Autowired
	private TradeRepository tradeRepository;

	public TradeDetail getTradeById(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	public int addTrade(int userId, String title, String content, int price, String type, String state,
			MultipartFile files) {
		
	}

}
