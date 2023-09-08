package com.ohana0.ohanaMarket.trade.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.ohana0.ohanaMarket.trade.domain.Trade;

@Repository
public interface TradeRepository {

	public int insertTradeGetId(@Param("userId")int userId, @Param("title")String title
			, @Param("content")String content, @Param("tradeLocation")String tradeLocation
			, @Param("price")int price, @Param("type")String type, @Param("state")String state);

	public List<Trade> getTradeList();
	

}
