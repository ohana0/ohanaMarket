package com.ohana0.ohanaMarket.user.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.ohana0.ohanaMarket.common.EncryptUtils;
import com.ohana0.ohanaMarket.common.FileManager;
import com.ohana0.ohanaMarket.user.domain.User;
import com.ohana0.ohanaMarket.user.repository.UserRepository;

@Service
public class UserService {

	
	@Autowired
	private UserRepository userRepository;
	

	public int addUser(String loginId, String password, String nickname, MultipartFile profileImage, String region,
			String phoneNumber, String introduce) {		
		String profileImagePath = FileManager.saveFile(loginId, profileImage);
		String encryptPassword = EncryptUtils.md5(password);
		
		
		int count = userRepository.insertUser(loginId,encryptPassword,nickname,profileImagePath,region,phoneNumber,introduce);
		
				
		
		return count;
	}

	public int countLoginId(String loginId) {
		int count = userRepository.countLoginId(loginId);
		return count;
	}

	public int countNickname(String nickname) {
		int count = userRepository.countNickname(nickname);
		
		return count;
	}


	public int login(String loginId, String password) {
		User user = userRepository.getUserByLoginId(loginId);
		if(user.getPassword().equals(EncryptUtils.md5(password)) ) {
			return 1;
		}
		else {
			return 0;
		}
	}

	public User getUserByLoginId(String loginId) {
		User user = userRepository.getUserByLoginId(loginId);
		return user;
	}

}
