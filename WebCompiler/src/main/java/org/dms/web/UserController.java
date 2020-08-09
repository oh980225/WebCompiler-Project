package org.dms.web;

import org.dms.web.domain.UserVO;
import org.dms.web.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;

@Controller
public class UserController {

		@Autowired
		UserService userService;
		
		private static final Logger logger = LoggerFactory.getLogger(UserController.class);
		
		@RequestMapping(value="/join", method = RequestMethod.GET)
		public String joinGet() {
			return "join";
		}
		
		@RequestMapping(value = "/join", method=RequestMethod.POST)
		public String joinPost(@ModelAttribute("user") UserVO uvo) throws Exception{
			userService.insertUser(uvo);
			return "main";
		}
}
