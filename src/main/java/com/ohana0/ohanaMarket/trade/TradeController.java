package com.ohana0.ohanaMarket.trade;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ohana0.ohanaMarket.trade.dto.TradeDetail;
import com.ohana0.ohanaMarket.trade.service.TradeService;

@Controller
public class TradeController {
	
	@Autowired
	private TradeService tradeService;

	@GetMapping("/board/trade/main")
	public String tradeMainView() {
		return "/trade/main";
	}
	
	@GetMapping("/board/trade/new")
	public String newPost() {
		return"/trade/newPost";
	}
	
	@GetMapping("/board/trade/update")
	public String updatePost(@RequestParam("id")int id, Model model) {
		TradeDetail trade = tradeService.getTradeById(id);
		
		
		return "/trade/updatePost";
	}
	
	@GetMapping("/board/trade")
	public String postView(@RequestParam("id") int id) {
		return "/trade/postDetail";
	}
	
	
	
}
