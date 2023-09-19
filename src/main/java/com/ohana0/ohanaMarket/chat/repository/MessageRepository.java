package com.ohana0.ohanaMarket.chat.repository;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface MessageRepository {

	public int insertMessage(@Param("chatId")int chatId, @Param("userId")int userId, @Param("content")String content);

}
