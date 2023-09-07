package com.ohana0.ohanaMarket.image;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.ohana0.ohanaMarket.image.service.ImageService;
@RestController
public class ImageRestController {
	@Autowired
	private ImageService imageService;
	
	
	@PostMapping("/uploadSummernoteImageFile")
	public Map<String,String> uploadImage(@RequestParam("file") MultipartFile file
			,@RequestParam(value="postId", required=false) Integer postId
			, HttpSession session
			, Model model) {
		
		String fileType = file.getContentType();
		
		
		Map<String,String> resultMap = new HashMap<>();
		
		if(!fileType.startsWith("image")) {
			resultMap.put("result", "fail");
			return resultMap;
		}
		
		String loginId = (String)session.getAttribute("loginId");
		
		
		if(postId == null) {
			postId = 0;
		}
		
		String imagePath = imageService.saveImageFile(loginId, file, postId);
		
		
		
		if(!imagePath.isEmpty()) {
			resultMap.put("result", "success");
			resultMap.put("url", imagePath);
			
		}
		else {
			resultMap.put("result", "fail");
		}
		
		return resultMap;
		
	}

}
