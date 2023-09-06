package com.ohana0.ohanaMarket.image.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface ImageRepository {

	public int insertImage(@Param("userId")int id, @Param("url")String url);


}
