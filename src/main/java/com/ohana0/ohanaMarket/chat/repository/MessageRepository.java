package com.ohana0.ohanaMarket.chat.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.ohana0.ohanaMarket.chat.domain.Message;

@Repository
public interface MessageRepository {

	public int insertMessage(@Param("chatId")int chatId, @Param("userId")int userId, @Param("content")String content);

	public List<Message> selectMessageByUserId(@Param("userId")int userId);

	public List<Message> selectMessageByChatId(@Param("chatId")int id);

	public String getLastMessage(@Param("chatId")int chatId);

	public int deleteMessageByChatId(@Param("chatId")int chatId);

}
