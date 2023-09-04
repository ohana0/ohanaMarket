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

	public List<PostDetail> getPostInfo() {
		List<Post> postInfo = postRepository.selectPost();
		List<PostDetail> postList = new ArrayList<>();
		
		for(Post post:postInfo) {
			String content = post.getContent();
			String thumbnail;
			if(content.contains("<img")) {
				String thumbnailTag = "";
				int startIndex = content.indexOf("<img");
				int endIndex = startIndex;

				for(int i = startIndex; i< content.length(); i++) {
					if(content.charAt(i) == 076) {
						endIndex = i + 1;
						break;
					}
				}
				thumbnailTag = content.substring(startIndex,endIndex);
				thumbnail = thumbnailTag.substring(0, 4)+" style=\"width:80px;height:60px\"" + thumbnailTag.substring(5);
			}
			else{
				thumbnail = "";
			}
			
			
			PostDetail postDetail = PostDetail.builder()
				.id(post.getId())
				.title(post.getTitle())
				.userId(userService.getLoginIdById(post.getUserId()))
				.thumbnail(thumbnail)
				.createdAt(post.getCreatedAt())
				.commentCount(0)//comment기능 추가후 수정예정
				.build();
			
			postList.add(postDetail);
		}
		
		return postList;
	}

	public PostDetail getPost(int id) {
		Post post = postRepository.selectPostById(id);
		PostDetail postDetail =PostDetail.builder()
				.id(post.getId())
				.title(post.getTitle())
				.content(post.getContent())
				.userId(userService.getLoginIdById(post.getUserId()))
				.createdAt(post.getCreatedAt())
				.commentCount(0)//comment기능 추가후 수정예정
				.build();
		return postDetail;
	}

}
