package com.ohana0.ohanaMarket.post.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.ohana0.ohanaMarket.post.domain.Post;

@Repository
public interface PostRepository {

	public int insertPost(@Param("userId")int userId, @Param("title")String title, @Param("content")String content);

	public List<Post> selectPost();

	public Post selectPostById(@Param("id")int id);

}
