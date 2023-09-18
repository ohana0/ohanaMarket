package com.ohana0.ohanaMarket.trade.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.ohana0.ohanaMarket.trade.domain.Trade;
import com.ohana0.ohanaMarket.trade.dto.TradeDetail;

@Repository
public interface TradeRepository {

	public List<Trade> getTradeList();

	public int insertTradeGetId(Trade trade);

	public Trade selectTradeById(@Param("postId")int postId);

	public int deletePost(@Param("postId")int postId);

	public int updateState(@Param("state")String state, @Param("id")int postId);

	public List<Trade> selectTradeByKeyWord(@Param("keyWord")String keyWord);
	

}
