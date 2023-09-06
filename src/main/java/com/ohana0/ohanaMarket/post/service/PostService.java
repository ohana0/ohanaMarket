package com.ohana0.ohanaMarket.post.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.ohana0.ohanaMarket.comment.service.CommentService;
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
	
	@Autowired
	private CommentService commentService;
	
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
			Date date = new Date();
			long millisecond = date.getTime()- post.getCreatedAt().getTime();
			long day =  (millisecond/(1000*60*60*24));
			
			PostDetail postDetail = PostDetail.builder()
				.id(post.getId())
				.title(post.getTitle())
				.userId(userService.getLoginIdById(post.getUserId()))
				.thumbnail(thumbnail)
				.dateAgo(day)
				.createdAt(post.getCreatedAt())
				.commentCount(commentService.countCommentByPostId(post.getId()))//comment기능 추가후 수정예정
				.build();
			
			postList.add(postDetail);
		}
		
		return postList;
	}

	public PostDetail getPostDetailById(int postId) {
		Post post = postRepository.selectPostById(postId);
		
		Date date = new Date();
		long millisecond = date.getTime()- post.getCreatedAt().getTime();
		int day =  (int) Math.floor(millisecond/(1000*60*60*24));
		PostDetail postDetail =PostDetail.builder()
				.id(post.getId())
				.title(post.getTitle())
				.content(post.getContent())
				.userId(userService.getLoginIdById(post.getUserId()))
				.createdAt(post.getCreatedAt())
				.dateAgo(day)
				.commentList(commentService.getCommentByPostId(postId))
				.commentCount(commentService.countCommentByPostId(postId))
				.build();
		
		return postDetail;
	}

	public int deletePost(int postId) {
		int count = postRepository.deletePost(postId);
		
		commentService.deleteCommentByPostId(postId);
		return count;
	}

	public int updatePost(int postId, String title, String content) {
		int count = postRepository.updatePost(postId,title,content);
		return count;
	}

}
