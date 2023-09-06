package com.ohana0.ohanaMarket.image.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.ohana0.ohanaMarket.common.FileManager;
import com.ohana0.ohanaMarket.image.repository.ImageRepository;
import com.ohana0.ohanaMarket.user.domain.User;
import com.ohana0.ohanaMarket.user.service.UserService;

@Service
public class ImageService {
	@Autowired
	private ImageRepository imageRepository;
	
	@Autowired
	private UserService userService;
	
	public void saveImageFile(int userId,MultipartFile file,int postId) {

		String loginId = userService.getLoginIdById(userId);
		String url = FileManager.saveFile(loginId, file);
		

		
		
		
		imageRepository.insertImage(postId,url);
	}

}
