package com.ohana0.ohanaMarket.trade;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.ohana0.ohanaMarket.trade.dto.TradeDetail;
import com.ohana0.ohanaMarket.trade.service.TradeService;

@Controller
public class TradeController {
	
	@Autowired
	private TradeService tradeService;
	
	@GetMapping("/board/trade/main")
	public String TradeMain(Model model) {
		List<TradeDetail> tradeList = tradeService.getTradeList();
		
		model.addAttribute("tradeList", tradeList);
		
		
		return "/trade/main";
	}
	@GetMapping("/board/trade/new")
	public String newTrade() {
		return "/trade/newPost";
	}
	
}
