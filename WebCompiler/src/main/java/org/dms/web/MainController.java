package org.dms.web;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

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
public class MainController {
	
	@Autowired(required=true)
	UserService userService;
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	// main.jsp를 불러온다.
	@RequestMapping(value = "/")
	public String getMainPage(Model model) throws Exception {
		return "main";
	}
	
	
}
