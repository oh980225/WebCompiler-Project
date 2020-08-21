package org.dms.web;

import org.dms.web.domain.ProblemVO;
import org.dms.web.domain.TestcaseVO;
import org.dms.web.service.ProblemService;
import org.dms.web.service.TestcaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class ProblemController {
	
	@Autowired(required=true)
	ProblemService problemService;
	@Autowired(required=true)
	TestcaseService testcaseService;
	
	@RequestMapping(value="/problem/{problem_id}", method=RequestMethod.GET)
	public String problemGet(@PathVariable("problem_id") int problem_id, Model model) throws Exception {
		//logger.info("번호: "+ problem_id);
		ProblemVO pvo = problemService.readProblem(problem_id);
		TestcaseVO tvo= testcaseService.readTestcase(problem_id);
		
		model.addAttribute("problem", pvo);
		model.addAttribute("testcase", tvo);
		//logger.info(vo.getProblem_title() + " " + vo.getProblem_id() + " " + vo.getProblem_content());		
		return "problem2";	
	}
	
	@RequestMapping(value="/solve", method=RequestMethod.GET)
	public String getSolvePage(Model model) throws Exception {
		return "solve_page";
	}
		
}
