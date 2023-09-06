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

import com.ohana0.ohanaMarket.trade.service.TradeService;

@RestController
public class TradeRestController {
	@Autowired
	private TradeService tradeService;
	@PostMapping("/board/trade/new/input")	
	public Map<String,String> createTrade(HttpSession session
			,@RequestParam("title")String title
			,@RequestParam("content")String content
			,@RequestParam("price")int price
			,@RequestParam("type")String type
			,@RequestParam("state")String state
			,@RequestParam("images")List<MultipartFile> files){
		int userId = (Integer)session.getAttribute("id");
		
		
		int count = tradeService.addTrade(userId,title,content,price,type,state,files);
		
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
