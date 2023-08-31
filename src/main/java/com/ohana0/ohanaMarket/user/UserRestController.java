package com.ohana0.ohanaMarket.user;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.ohana0.ohanaMarket.user.domain.User;
import com.ohana0.ohanaMarket.user.service.UserService;

@RestController
public class UserRestController {

	@Autowired
	private UserService userService;
	
	@PostMapping("/user/join/duplicateNickname")
	public Map<String,String> duplicateNickname(@RequestParam("nickname") String nickname){
		int count = userService.countNickname(nickname);
		
		Map<String,String> resultMap = new HashMap<>();
		if(count > 0) {
			resultMap.put("result", "duplicate");
		}
		else {
			resultMap.put("result", "not-duplicate");
		}
		return resultMap;
		
	}
	
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
			,@RequestParam("profileImage")MultipartFile profileImage
			,@RequestParam("region")String region
			,@RequestParam("phoneNumber")String phoneNumber
			,@RequestParam("introduce")String introduce
			){
		
		int count = userService.addUser(loginId,password,nickname,profileImage,region,phoneNumber,introduce);

		Map<String,String> resultMap = new HashMap<>();
		if(count > 0) {
			resultMap.put("result", "success");
		}
		else {
			resultMap.put("result", "false");
		}
		
		return resultMap;
		
	}
	
	
	
	
	
	
	@PostMapping("/user/login")
	public Map<String,String> login(
			@RequestParam("loginId")String loginId
			,@RequestParam("password")String password
			,HttpSession session
			){
		int count = userService.login(loginId, password);
		
		Map<String,String> resultMap = new HashMap<>();
		if(count == 1) {
			resultMap.put("result", "success");
			User user = userService.getUserByLoginId(loginId);
			session.setAttribute("id", user.getId());
			session.setAttribute("loginId", loginId);
			session.setAttribute("profileImagePath", user.getProfileImagePath());
		}
		else {
			resultMap.put("result", "fail");
		}

		
		return resultMap;
		
	}
	
	
	
}
