package org.dms.web;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

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
public class HomeController {
	
	@Autowired(required=true)
	UserService userService;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	

	@RequestMapping(value = "/")
	public String getMainPage(Model model, HttpSession session) throws Exception {
		UserVO user = (UserVO) session.getAttribute("user");
		model.addAttribute("user", user);
		return "main";		
	}
	
	@RequestMapping(value = "/login")
	public String login(Model model, HttpSession session) throws Exception {
		return "signin";		
	}
	
	
}
