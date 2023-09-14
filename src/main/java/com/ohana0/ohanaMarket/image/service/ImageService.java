package com.ohana0.ohanaMarket.image.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.ohana0.ohanaMarket.common.FileManager;
import com.ohana0.ohanaMarket.image.domain.Image;
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

	public List<Image> getImageList(int postId, String type) {
		List<Image> imageList = imageRepository.selectImage(postId,type);
		return imageList;
	}

	public int deleteImageByPostIdType(int postId,String type) {//table에서의삭제와 파일자체의 삭제가 같이 이루어져야함.
		List<Image> imageList = imageRepository.selectImage(postId, type);
		int count = imageRepository.deleteImage(postId,type);
		for(Image image:imageList) {
			FileManager.deleteFile(image.getUrl());
		}
		
		return count;
		
	}


}
