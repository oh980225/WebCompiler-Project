package org.dms.web;

import javax.servlet.http.HttpSession;

import org.dms.web.domain.UserVO;
import org.dms.web.domain.test;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/study")
public class StudyController {
	@RequestMapping(value = "", method = RequestMethod.GET)
	public String getPage(HttpSession session, Model model) {
		test t = new test();
		t.assign();
		t.setLowData();
		
		UserVO user = (UserVO)session.getAttribute("user");
		model.addAttribute("user", user);
		model.addAttribute("category", t);
		return "study";	
	}
}
