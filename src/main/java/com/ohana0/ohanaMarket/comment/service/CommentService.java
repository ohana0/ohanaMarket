package com.ohana0.ohanaMarket.comment.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ohana0.ohanaMarket.comment.domain.Comment;
import com.ohana0.ohanaMarket.comment.dto.CommentDetail;
import com.ohana0.ohanaMarket.comment.repository.CommentRepository;
import com.ohana0.ohanaMarket.user.service.UserService;

@Service
public class CommentService {
	@Autowired
	private CommentRepository commentRepository;
	@Autowired
	private UserService userService;

	public int addComment(int userId, int postId, String content) {
		int count = commentRepository.insertComment(userId,postId,content);
		return count;
	}
	
	public List<CommentDetail> getCommentByPostId(int postId){
		List<Comment> commentList = commentRepository.selectCommentByPostId(postId);
		List<CommentDetail> commentDetailList = new ArrayList<>();
		for(Comment comment:commentList) {
			CommentDetail commentDetail = CommentDetail.builder()
					.userId(userService.getLoginIdById(comment.getUserId()))
					.content(comment.getContent())
					.createdAt(comment.getCreatedAt())
					.build();
			commentDetailList.add(commentDetail);
		}
		
		return commentDetailList;		
	}
	
	public int countCommentByPostId(int postId) {
		int count = commentRepository.countCommentByPostId(postId);
		return count;
	}

	public int deleteCommentByPostId(int postId) {
		int count = commentRepository.deleteCommentByPostId(postId);
		return count;
		
	}
	
}
