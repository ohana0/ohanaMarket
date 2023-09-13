package com.ohana0.ohanaMarket.image.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.ohana0.ohanaMarket.image.domain.Image;

@Repository
public interface ImageRepository {

	public int insertImage(@Param("postId")Integer postId, @Param("url")String url,@Param("type")String type);

	public String selectThumbnail(@Param("postId")int postId, @Param("type")String type);

	public List<Image> selectImage(@Param("postId")int postId, @Param("type")String type);


}
