package com.ohana0.ohanaMarket.user;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.ohana0.ohanaMarket.user.service.UserService;

@RestController
public class UserRestController {

	@Autowired
	private UserService userService;
	
	@PostMapping("/user/join/duplicateId")
	public Map<String,String> duplicateId(@RequestParam("loginId") String loginId){
		
		int count = userService.countLoginId(loginId);
		
		
		Map<String,String> resultMap = new HashMap<>();
		if(count > 0) {
			resultMap.put("result", "duplicate");
		}
		else {
			resultMap.put("result", "not-duplicate");
		}
		return resultMap;
		
	}
	
	
	@PostMapping("/user/join")
	public Map<String,String> createUser(
			@RequestParam("loginId")String loginId
			,@RequestParam("password")String password
			,@RequestParam("nickname")String nickname
//			,@RequestParam("profileImage")MultipartFile profileImage
			,@RequestParam("region")String region
			,@RequestParam("phoneNumber")String phoneNumber
			,@RequestParam("introduce")String introduce
			){
		
//		int count = userService.addUser(loginId,password,nickname,profileImage,region,phoneNumber,introduce);
		int count = userService.addUser(loginId,password,nickname,region,phoneNumber,introduce);
		Map<String,String> resultMap = new HashMap<>();
		if(count > 0) {
			resultMap.put("result", "success");
		}
		else {
			resultMap.put("result", "false");
		}
		
		return resultMap;
		
	}
	
	
	
	
	
	
	
//	public Map<String,String> login(
//			@RequestParam("loginId")String loginId
//			,@RequestParam("password")String password
//			){
//		
//		int count = userService.login(loginId,password);
//		
//		
//		Map<String,String> resultMap = new HashMap<>();
//		if(count > 0) {
//			resultMap.put("result", "duplicate");
//		}
//		else {
//			resultMap.put("result", "not-duplicate");
//		}
//		
//		return resultMap;
//		
//	}
	
}
