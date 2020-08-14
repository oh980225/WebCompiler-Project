package org.dms.web;

import org.dms.web.domain.UserVO;
import org.dms.web.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class MyPageController {
	
	@Autowired(required=true)
	UserService userService;
	
	private static final Logger logger = LoggerFactory.getLogger(MyPageController.class);

	@RequestMapping(value = "/mypage")
	public String getMyPage(Model model) throws Exception {
		String id = "1";
		UserVO user = userService.readUser(id);
		model.addAttribute("user", user);
		
		return "mypage";
	}
	
	@RequestMapping(value = "/mypage", method = RequestMethod.POST)
	public String updateUserName(UserVO user, Model model) throws Exception {
		System.out.println("hello post");
		System.out.println(user.getUser_introduce());
		userService.updateUser(user);
		System.out.println(user.getUser_introduce());
		
		model.addAttribute("user", user);
		
		return "mypage";
	}
	
	@RequestMapping(value= "/mypage/saveImage",  method = RequestMethod.POST)
	public String saveImage(@RequestParam("user_id") String userId,
			@RequestParam("user_image") MultipartFile imgFile) throws Exception {
		System.out.println("Hello saveImage!");
		
		UserVO user = new UserVO();
		user.setUser_id(userId);
		user.setUser_img(imgFile.getBytes());
		
		userService.saveImage(user);
		
		return "redirect:/mypage";
	}
	
	@RequestMapping(value="/getByteImage/{user_id}")
	public ResponseEntity<byte[]> getByteImage(@PathVariable("user_id") String userId) throws Exception {
		System.out.println(userId);
		UserVO user = userService.readUser(userId);
		byte[] imageContent = user.getUser_img();
		
		final HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.IMAGE_PNG);
		
		return new ResponseEntity<byte[]>(imageContent, headers, HttpStatus.OK);
	}
	
}