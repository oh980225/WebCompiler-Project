package org.dms.web;

import java.io.FileOutputStream;
import java.io.OutputStream;
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
	
	// 여기가 id 받아서 해당문제
	@RequestMapping(value="/problem/{problem_id}", method=RequestMethod.GET)
	public String problemGet(@PathVariable("problem_id") int problem_id, Model model) throws Exception {
		//logger.info("踰덊샇: "+ problem_id);
		ProblemVO pvo = problemService.readProblem(problem_id);
		TestcaseVO tvo= testcaseService.readTestcase(problem_id);
		
		// input, output 리스트를 받아온다.
		List<String> tvoInput = testcaseService.getTestCaseInput(problem_id);
		List<String> tvoOutput = testcaseService.getTestCaseOutput(problem_id);
		
		// console 창 출력
		for(String input : tvoInput) {
			System.out.println(input);
		}
		for(String output : tvoOutput) {
			System.out.println(output);
		}
		
		// file로 만들기
		try {
		    OutputStream file = new FileOutputStream("C:\\Users\\ohseu\\Desktop\\testcase.txt");
		    
		    String str = "input\n";
		    for(String input : tvoInput) {
				str += input + "\n";
			}
		    
		    str += "output\n";
		    for(String output : tvoOutput) {
				str += output + "\n";
			}
		    
		    byte[] by=str.getBytes();
		    file.write(by);
		    file.flush();
		    file.close();
				
		} catch (Exception e) {
	            e.getStackTrace();
		}
		
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
		logger.info("臾몄젣�궡�슜: "+pvo.getProblem_content());
		logger.info("�꽦怨듯슏�닔: " + pvo.getProblem_successnum());
		pvo.setProblem_content(pvo.getProblem_content().replace("\r\n", "<br>"));
		pvo.setProblem_hint("�젙�떟肄붾뱶 �뾽�뒾");
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
		logger.info("臾몄젣踰덊샇: "+tvo.getProblem_id());
		logger.info("input: " +tvo.getTestcase_input());
		logger.info("output:" +tvo.getTestcase_output());
		
		tvo.setTestcase_input(tvo.getTestcase_input().replace("\r\n", "<br>"));
		tvo.setTestcase_output(tvo.getTestcase_output().replace("\r\n", "<br>"));
		
		testcaseService.insertTestcase(tvo);
		return "testcase_insert";
	}
	
	@ResponseBody
	@RequestMapping(value="/submit", method = RequestMethod.POST)
	public void getCode(String code, String lang) {
		System.out.println("DATA!");
		System.out.println(code);
		System.out.println(lang);
		try {
		    OutputStream output = new FileOutputStream("C:\\Users\\ohseu\\Desktop\\test.txt");
		    String str = code + '\n' + lang;
		    byte[] by=str.getBytes();
		    output.write(by);
		    output.flush();
		    output.close();
				
		} catch (Exception e) {
	            e.getStackTrace();
		}
	}
		
}
