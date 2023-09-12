package com.ohana0.ohanaMarket.trade;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
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

		int postId = tradeService.addTradeByEntitiy(trade,files);
		
		Map<String,String> resultMap = new HashMap<>();
		
		if(postId != 0) {
			resultMap.put("result", "success");
			resultMap.put("postId", String.valueOf(postId));
		}
		else {
			resultMap.put("result", "false");
		}
		
		return resultMap;
		
	}

}
