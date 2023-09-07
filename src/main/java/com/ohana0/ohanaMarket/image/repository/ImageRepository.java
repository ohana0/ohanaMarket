package com.ohana0.ohanaMarket.image.repository;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface ImageRepository {

	public int insertImage(@Param("postId")int postId, @Param("url")String url);


}
