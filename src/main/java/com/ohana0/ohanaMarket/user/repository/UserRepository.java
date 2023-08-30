package com.ohana0.ohanaMarket.user.repository;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRepository {

	public int insertUser(@Param("loginId")String loginId
			, @Param("password")String password
			, @Param("nickname")String nickname
//			, @Param("profileImagePath")String profileImagePath
			, @Param("region")String region
			, @Param("phoneNumber")String phoneNumber
			, @Param("introduce")String introduce);

	public int countLoginId(@Param("loginId")String loginId);
}
