package com.ohana0.ohanaMarket.hello;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ohana0.ohanaMarket.image.service.ImageService;

@Controller
public class HelloController {
	@Autowired
	public ImageService imageService;
	@RequestMapping("/hello")
	public String hello(Model model) {
		
		model.addAttribute("imageList", imageService.getImageList(3, "trade"));
		return "/hello/hello";
	}
	@RequestMapping("/test")
	public String test() {
		return "/hello/test";
	}
	

}
