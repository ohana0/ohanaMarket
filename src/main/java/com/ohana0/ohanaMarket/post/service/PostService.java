package com.ohana0.ohanaMarket.post.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.ohana0.ohanaMarket.common.FileManager;
import com.ohana0.ohanaMarket.post.repository.PostRepository;

@Service
public class PostService {

	@Autowired
	private PostRepository postRepository;
	
	public int addPost(int userId, String title, String content) {
		int count = postRepository.insertPost(userId,title,content);
		return count;
	}

	public String uploadImage(String loginId, MultipartFile file) {
		String imagePath = FileManager.saveFile(loginId, file);
		return imagePath;
	}

}
