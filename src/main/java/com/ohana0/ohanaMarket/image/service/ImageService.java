package com.ohana0.ohanaMarket.image.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.ohana0.ohanaMarket.common.FileManager;
import com.ohana0.ohanaMarket.image.repository.ImageRepository;


@Service
public class ImageService {
	@Autowired
	private ImageRepository imageRepository;
	
	public String saveImageFile(String userId,MultipartFile file,Integer postId) {


		String url = FileManager.saveFile(userId, file);
		
		int count = imageRepository.insertImage(postId,url);
		if(count != 1) {
			return null;
		}
		else {
			
			return url;
		}
	}

}
