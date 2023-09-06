package com.ohana0.ohanaMarket.comment.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.ohana0.ohanaMarket.comment.domain.Comment;

@Repository
public interface CommentRepository {

	public int insertComment(@Param("userId")int userId, @Param("postId")int postId, @Param("content")String content);

	public List<Comment> selectCommentByPostId(@Param("postId")int postId);

	public int countCommentByPostId(@Param("postId")int postId);

	public int deleteCommentByPostId(@Param("postId")int postId);
	

}
