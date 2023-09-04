package com.ohana0.ohanaMarket.post.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.ohana0.ohanaMarket.common.FileManager;
import com.ohana0.ohanaMarket.post.domain.Post;
import com.ohana0.ohanaMarket.post.dto.PostDetail;
import com.ohana0.ohanaMarket.post.repository.PostRepository;
import com.ohana0.ohanaMarket.user.service.UserService;

@Service
public class PostService {

	@Autowired
	private PostRepository postRepository;
	
	@Autowired
	private UserService userService;
	
	public int addPost(int userId, String title, String content) {
		int count = postRepository.insertPost(userId,title,content);
		return count;
	}

	public String uploadImage(String loginId, MultipartFile file) {
		String imagePath = FileManager.saveFile(loginId, file);
		return imagePath;
	}

	public List<Post> getPostInfo() {
		List<Post> postInfo = postRepository.selectPost();
		List<PostDetail> postList = new ArrayList<>();
		for(Post post:postInfo) {
			String thumbnail = "";
			if(post.getContent().contains("<img")) {
		        String imgPattern = "<img\\s+[^>]*?src=\"([^\"]+)\"[^>]*>";

		        // 패턴과 문자열 매칭
		        Pattern pattern = Pattern.compile(imgPattern);
		        Matcher matcher = pattern.matcher(html);
			}
			
			
			PostDetail postDetail = PostDetail.builder()
			.id(post.getId())
			.title(post.getTitle())
			.userLoginId(userService.getLoginIdById(post.getUserId()))
			.thumbnail(thumbnail)
			.contentSummary(post.getContent().substring(0,20))
			.build();
			
			postList.add(postDetail);
		}
		
		return postInfo;
	}

}
