//package org.dms.web;
//
//import org.dms.web.domain.UserVO;
//import org.dms.web.service.UserService;
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.http.HttpHeaders;
//import org.springframework.http.HttpStatus;
//import org.springframework.http.MediaType;
//import org.springframework.http.ResponseEntity;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.PathVariable;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.multipart.MultipartFile;
//
//@Controller
//public class TestController {
//	
//	@Autowired(required=true)
//	UserService userService;
//	
//	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
//	
//	@RequestMapping(value = "/saveImage")
//	public String getTestView() {
//		return "test_view";
//	}
//	
//	@RequestMapping(value= "/saveImage",  method = RequestMethod.POST)
//	public String saveImage(@RequestParam("user_id") String userId,
//			@RequestParam("user_image") MultipartFile imgFile) throws Exception {
//		UserVO user = new UserVO();
//		user.setUser_id(userId);
//		user.setUser_img(imgFile.getBytes());
//		
//		try {
//			System.out.println(user.getUser_img());
//			userService.saveImage(user);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return "test_view";
//	}
//	
//	
//	@RequestMapping(value="/getByteImage/{id}")
//	public ResponseEntity<byte[]> getByteImage(@PathVariable("id") String id) throws Exception {
//		System.out.println("Hello");
//		System.out.println(id);
//		UserVO user = userService.readUser(id);
//		byte[] imageContent = user.getUser_img();
//		
//		final HttpHeaders headers = new HttpHeaders();
//		headers.setContentType(MediaType.IMAGE_PNG);
//		
//		return new ResponseEntity<byte[]>(imageContent, headers, HttpStatus.OK);
//	}
//}