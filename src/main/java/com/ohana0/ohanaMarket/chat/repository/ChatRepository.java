package com.ohana0.ohanaMarket.chat.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.ohana0.ohanaMarket.chat.domain.Chat;

@Repository
public interface ChatRepository {

	public int insertChat(@Param("hostId")int hostId, @Param("guestId")int guestId);

	public int insertMessage(@Param("id")int chatId);

	public List<Chat> selectChatByUserId(@Param("userId")int userId);

}
