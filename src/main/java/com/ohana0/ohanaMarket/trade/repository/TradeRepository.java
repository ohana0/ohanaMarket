package com.ohana0.ohanaMarket.trade.repository;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.ohana0.ohanaMarket.trade.domain.Trade;

@Repository
public interface TradeRepository {

	public List<Trade> getTradeList();

	public int insertTradeGetId(Trade trade);
	

}
