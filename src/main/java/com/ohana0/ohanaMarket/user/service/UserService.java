package com.ohana0.ohanaMarket.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.ohana0.ohanaMarket.common.EncryptUtils;
import com.ohana0.ohanaMarket.common.FileManager;
import com.ohana0.ohanaMarket.user.repository.UserRepository;

@Service
public class UserService {

	
	@Autowired
	private UserRepository userRepository;
	
	public int addUser(String loginId, String password, String nickname, String region,
			String phoneNumber, String introduce) {
//	public int addUser(String loginId, String password, String nickname, MultipartFile profileImage, String region,
//			String phoneNumber, String introduce) {		
//		String profileImagePath = FileManager.saveFile(loginId, profileImage);
		String encryptPassword = EncryptUtils.md5(password);
		
		
//		int count = userRepository.insertUser(loginId,encryptPassword,nickname,profileImagePath,region,phoneNumber,introduce);
		int count = userRepository.insertUser(loginId,encryptPassword,nickname,region,phoneNumber,introduce);
				
		
		return count;
	}

	public int countLoginId(String loginId) {
		int count = userRepository.countLoginId(loginId);
		return count;
	}

}
