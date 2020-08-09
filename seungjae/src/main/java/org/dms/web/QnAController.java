package org.dms.web;

import org.dms.web.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class QnAController {
	
	@Autowired(required=true)
	UserService userService;
	
	private static final Logger logger = LoggerFactory.getLogger(QnAController.class);
	
	// QnA.jsp를 불러온다.
	@RequestMapping(value = "/question")
	public String getQnAPage(Model model) throws Exception {
		return "QnA";
	}
	
}
