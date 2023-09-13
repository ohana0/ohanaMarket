package com.ohana0.ohanaMarket.trade.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.ohana0.ohanaMarket.image.domain.Image;
import com.ohana0.ohanaMarket.image.service.ImageService;
import com.ohana0.ohanaMarket.trade.domain.Trade;
import com.ohana0.ohanaMarket.trade.dto.TradeDetail;
import com.ohana0.ohanaMarket.trade.repository.TradeRepository;
import com.ohana0.ohanaMarket.user.service.UserService;

@Service
public class TradeService {
	@Autowired
	private TradeRepository tradeRepository;
	@Autowired
	private ImageService imageService;
	@Autowired
	private UserService userService;

	public List<TradeDetail> getTradeList() {
		List<Trade> tradeOriginalList = tradeRepository.getTradeList();
		List<TradeDetail> tradeList = new ArrayList<>();
		
		for(Trade trade:tradeOriginalList) {
			String thumbnail = imageService.getThumbnail(trade.getId(),"trade");
			String userId = userService.getLoginIdById(trade.getUserId()); 
			
			TradeDetail tradeDetail = TradeDetail.builder()
					.id(trade.getId())
					.content(trade.getContent())
					.price(trade.getPrice())
					.state(trade.getState())
					.tradeLocation(trade.getTradeLocation())
					.title(trade.getTitle())
					.type(trade.getType())
					.userId(userId)
					.thumbnailImagePath(thumbnail)
					.build();
			tradeList.add(tradeDetail);
		}
		
		
		return tradeList;
	}

	public int addTradeByEntitiy(Trade trade, List<MultipartFile> files) {
		int count = tradeRepository.insertTradeGetId(trade);
	
		int userId = trade.getUserId();
		int postId = trade.getId();

		if(files != null) {
			
			for(MultipartFile file:files) {
				String userIdStr = userService.getLoginIdById(userId);
				imageService.saveImageFile(userIdStr, file,"trade", postId);
			}
		}
		return count;
	}

	public TradeDetail getTradeById(int postId) {
		Trade trade = tradeRepository.selectTradeById(postId);
		List<String> imageUrlList = new ArrayList<>();
		List<Image> imageList = imageService.getImageList(postId,"trade");
		for(Image image:imageList) {
			imageUrlList.add(image.getUrl());
		}
		
		TradeDetail tradeDetail = TradeDetail.builder()
				.id(trade.getId())
				.userId(userService.getLoginIdById(trade.getUserId()))
				.title(trade.getTitle())
				.content(trade.getContent())
				.price(trade.getPrice())
				.type(trade.getType())
				.tradeLocation(trade.getTradeLocation())
				.state(trade.getState())
				.imageUrlList(imageUrlList)
				.build();
				
						
		return tradeDetail;
	}


}
