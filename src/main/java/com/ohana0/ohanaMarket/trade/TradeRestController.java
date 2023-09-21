package com.ohana0.ohanaMarket.trade;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.ohana0.ohanaMarket.trade.domain.Trade;
import com.ohana0.ohanaMarket.trade.service.TradeService;

@RestController
public class TradeRestController {
	@Autowired
	private TradeService tradeService;

	@PostMapping("/board/trade/new/input")	
	public Map<String,String> createTrade(HttpSession session
			,@RequestParam("title")String title
			,@RequestParam("content")String content
			,@RequestParam("tradeLocation")String tradeLocation
			,@RequestParam("price")int price
			,@RequestParam("type")String type
			,@RequestParam(value="files",required=false)List<MultipartFile> files){
		
		int userId = (int)session.getAttribute("id");
		Trade trade = Trade.builder()
				.title(title)
				.userId(userId)
				.content(content)
				.tradeLocation(tradeLocation)
				.price(price)
				.type(type)
				.state("거래등록")
				.build();

		int count = tradeService.addTradeByEntitiy(trade,files);
		
		Map<String,String> resultMap = new HashMap<>();
		
		if(count > 0) {
			resultMap.put("result", "success");
			resultMap.put("postId", String.valueOf(trade.getId()));
		}
		else {
			resultMap.put("result", "false");
		}
		
		return resultMap;
		
	}
	@PostMapping("/board/trade/update/input")	
	public Map<String,String> updateTrade(HttpSession session
			,@RequestParam("id")int id
			,@RequestParam("title")String title
			,@RequestParam("content")String content
			,@RequestParam("tradeLocation")String tradeLocation
			,@RequestParam("price")int price
			,@RequestParam("type")String type
			,@RequestParam("state")String state
			,@RequestParam(value="files",required=false)List<MultipartFile> files){
		
		int userId = (int)session.getAttribute("id");
		Trade trade = Trade.builder()
				.id(id)
				.title(title)
				.userId(userId)
				.state(state)
				.content(content)
				.tradeLocation(tradeLocation)
				.price(price)
				.type(type)
				.build();
		int count = tradeService.updateTradeByEntitiy(trade,files);
		
		Map<String,String> resultMap = new HashMap<>();
		
		if(count > 0) {
			resultMap.put("result", "success");
			resultMap.put("postId", String.valueOf(trade.getId()));
		}
		else {
			resultMap.put("result", "false");
		}
		
		return resultMap;
		
	}
	@DeleteMapping("/board/trade/delete")
	public Map<String,String> deletePost(@RequestParam("postId")int postId) {
		int count = tradeService.deletePost(postId);
		Map<String,String> resultMap = new HashMap<>();
		if(count > 0) {
			resultMap.put("result", "success");
		}
		else {
			resultMap.put("result", "false");
		}
		return resultMap;
		
	}	
	
	@PostMapping("/board/trade/changestate")
	public Map<String,String> changeState(@RequestParam("state")String state,@RequestParam("postId")int postId,HttpSession session) {
		int count = tradeService.changeState(state,postId);
		
		
		
		Map<String,String> resultMap = new HashMap<>();
		if(count > 0) {
			resultMap.put("result", "success");
		}
		else {
			resultMap.put("result", "false");
		}
		return resultMap;
	}
	
	

}
