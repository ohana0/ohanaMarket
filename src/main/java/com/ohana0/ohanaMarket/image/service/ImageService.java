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
	
	public String saveImageFile(String userId,MultipartFile file,String type,Integer postId){
		

		String url = FileManager.saveFile(userId, type,file);
		
		imageRepository.insertImage(postId, url, type);
		
		return url;
	}

	public String getThumbnail(int id, String type) {
		String url = imageRepository.selectThumbnail(id,type);
		return url;
	}


}
