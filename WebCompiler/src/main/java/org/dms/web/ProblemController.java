package org.dms.web;

import java.util.List;
import java.util.Locale;

import org.dms.web.domain.CategoryVO;
import org.dms.web.domain.ProblemVO;
import org.dms.web.domain.TestcaseVO;
import org.dms.web.service.CategoryService;
import org.dms.web.service.ProblemService;
import org.dms.web.service.TestcaseService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
	@Autowired(required=true)
	CategoryService categoryService;
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@RequestMapping(value="/problem/{problem_id}", method=RequestMethod.GET)
	public String problemGet(@PathVariable("problem_id") int problem_id, Model model) throws Exception {
		//logger.info("번호: "+ problem_id);
		ProblemVO pvo = problemService.readProblem(problem_id);
		TestcaseVO tvo= testcaseService.readTestcase(problem_id);
		
		model.addAttribute("problem", pvo);
		model.addAttribute("testcase", tvo);
		//logger.info(vo.getProblem_title() + " " + vo.getProblem_id() + " " + vo.getProblem_content());		
		return "solve_page";	
	}
	
	@RequestMapping(value="/problem/insert", method = RequestMethod.GET)
	public String problemInsert(Locale locale, Model model) throws Exception {
		List<CategoryVO> vo = categoryService.readCategoryList();
		model.addAttribute("category", vo);
		return "problem_insert";
	}
	
	@RequestMapping(value="/problem/insert.do", method = RequestMethod.POST)
	public String problemInsertPost(@ModelAttribute("problem") ProblemVO pvo /*, @ModelAttribute("testcase") TestcaseVO tvo*/) throws Exception {
		logger.info("문제내용: "+pvo.getProblem_content());
		logger.info("성공횟수: " + pvo.getProblem_successnum());
		pvo.setProblem_content(pvo.getProblem_content().replace("\r\n", "<br>"));
		pvo.setProblem_hint("정답코드 업슴");
		pvo.setProblem_failnum(pvo.getProblem_submitnum() - pvo.getProblem_successnum());
		problemService.insertProblem(pvo);
		return "redirect:/problem/insert";
	}
	@RequestMapping(value="/testcase", method = RequestMethod.GET)
	public String testcaseInsert(Locale locale, Model model) throws Exception {
		return "testcase_insert";
	}
	
	@RequestMapping(value="/testcase.do", method = RequestMethod.POST)
	public String testcaseInsertPost(@ModelAttribute("testcase") TestcaseVO tvo) throws Exception {
		//tvo.setProblem_id(pvo.getProblem_id());
		logger.info("문제번호: "+tvo.getProblem_id());
		logger.info("input: " +tvo.getTestcase_input());
		logger.info("output:" +tvo.getTestcase_output());
		
		tvo.setTestcase_input(tvo.getTestcase_input().replace("\r\n", "<br>"));
		tvo.setTestcase_output(tvo.getTestcase_output().replace("\r\n", "<br>"));
		
		testcaseService.insertTestcase(tvo);
		return "testcase_insert";
	}
	
	@RequestMapping(value="/solve", method=RequestMethod.GET)
	public String getSolvePage(Model model) throws Exception {
		return "solve_page";
	}
		
}
