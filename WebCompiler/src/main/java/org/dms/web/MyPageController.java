package org.dms.web;

import java.util.List;

import org.dms.web.domain.UserVO;
import org.dms.web.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MyPageController {
	
	@Autowired(required=true)
	UserService userService;
	
	private static final Logger logger = LoggerFactory.getLogger(MyPageController.class);
	
	// mypage.jsp를 불러온다.
	@RequestMapping(value = "/mypage")
	public String getMyPage(Model model) throws Exception {
		int id = 2;
		UserVO user = userService.readUser(id);
		model.addAttribute("user", user);
		
		return "mypage";
	}
	
}