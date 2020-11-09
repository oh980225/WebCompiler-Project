package org.dms.web;

import java.io.File;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.OutputStream;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.dms.web.domain.CategoryVO;
import org.dms.web.domain.CodeBoardVO;
import org.dms.web.domain.CodeVO;
import org.dms.web.domain.Criteria;
import org.dms.web.domain.PageMaker;
import org.dms.web.domain.ProblemVO;
import org.dms.web.domain.TestcaseVO;
import org.dms.web.domain.UserVO;
import org.dms.web.service.CategoryService;
import org.dms.web.service.CodeService;
import org.dms.web.service.ProblemService;
import org.dms.web.service.TestcaseService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.mysql.cj.Session;

@Controller
public class ProblemController {
	
	@Autowired(required=true)
	ProblemService problemService;
	@Autowired(required=true)
	TestcaseService testcaseService;
	@Autowired(required=true)
	CategoryService categoryService;
	@Autowired(required=true) // test
	CodeService codeService;
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

	@RequestMapping(value = "/problem", method = RequestMethod.GET)

	public String test(Locale locale, Model model, Criteria cri, HttpSession session) throws Exception {
		logger.info("page:" +  cri.getPage());
		logger.info("perPageNum:" +  cri.getPerPageNum());
		UserVO user = (UserVO)session.getAttribute("user");
		if(user == null) {
			List<ProblemVO> pvo = problemService.readProblemList(cri);
			List<CategoryVO> cvo = categoryService.readCategoryList();

			PageMaker pageMaker = new PageMaker();
			cri.setPerPageNum(8);
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(problemService.ProblemCount());
			
			logger.info("page: " +  cri.getPage());
			model.addAttribute("category", cvo);			
			model.addAttribute("problem", pvo);
			model.addAttribute("pageMaker", pageMaker);
			model.addAttribute("cri", cri);
			return "menutest";

		}
		else {
			String user_id = user.getUser_id();
			List<ProblemVO> pvo = problemService.readProblemList(cri);
			List<CategoryVO> cvo = categoryService.readCategoryList();
			
			boolean[] successList = new boolean[8];
			int index = 0;
			
			for(ProblemVO problem : pvo) {
				successList[index++] = codeService.IsSuccess(user.getUser_id(), problem.getProblem_id());
			}

			PageMaker pageMaker = new PageMaker();
			cri.setPerPageNum(8);
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(problemService.ProblemCount());
			
			logger.info("page: " +  cri.getPage());
			
			model.addAttribute("category", cvo);
			model.addAttribute("user", user);
			model.addAttribute("problem", pvo);
			model.addAttribute("pageMaker", pageMaker);
			model.addAttribute("cri", cri);
			
			model.addAttribute("successList", successList);
			
			//return "problem_list";
			return "menutest";
		}

		//PageMaker pageMaker = new PageMaker();
		//cri.setPerPageNum(8);
		///pageMaker.setCri(cri);
		//pageMaker.setTotalCount(problemService.ProblemCount());
		
		//logger.info("page: " +  cri.getPage());
		
		//UserVO user = (UserVO) session.getAttribute("user");
		
		//boolean[] successList = new boolean[8];
		//int index = 0;
		
		//for(ProblemVO problem : pvo) {
		//	successList[index++] = codeService.IsSuccess(user.getUser_id(), problem.getProblem_id());
		//}
		
		//model.addAttribute("user", user);
		//model.addAttribute("category", cvo);
		//model.addAttribute("problem", pvo);
		//model.addAttribute("pageMaker", pageMaker);
		//model.addAttribute("cri", cri);
		//model.addAttribute("successList", successList);
		
		//return "problem_list";

	}
	
	@RequestMapping(value = "/problem.do", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> categorytest_test(
			HttpSession session,
			Locale locale, 
			Model model, 
			Criteria cri, 
			int problem_level, 
			String category_name,
			boolean isSearch) throws Exception {
		if(isSearch) {
			System.out.println("searchInput in Session: " + session.getAttribute("searchInput"));
			System.out.println("searchType in Session: " + session.getAttribute("searchType"));
		}
		logger.info("categorytest_test");
		Map<String, Object> map = new HashMap<String, Object>();
		UserVO user = (UserVO) session.getAttribute("user");
		
		if(problem_level == 0 && category_name.equals("unselected")) {
			logger.info("level: " + problem_level);
			logger.info("category: " + category_name);
			
			List<ProblemVO> pvo = new ArrayList<ProblemVO>();;
			int count = 0;
			String searchInput = (String) session.getAttribute("searchInput");
			String searchType = (String) session.getAttribute("searchType");
			
			if(isSearch) {
				pvo = problemService.searchProblemList(searchType, searchInput, cri);
				count = problemService.searchProblemCount(searchType, searchInput);
			} else {
				pvo = problemService.readProblemList(cri);
				count = problemService.ProblemCount();
			}
			
			PageMaker pageMaker = new PageMaker();
			cri.setPerPageNum(8);
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(count);
			
			boolean[] successList = new boolean[8];
			int index = 0;
			
			for(ProblemVO problem : pvo) {
				successList[index++] = codeService.IsSuccess(user.getUser_id(), problem.getProblem_id());
			}
			
			System.out.println("successList: " + successList);
			
			map.put("pageMaker", pageMaker);
			map.put("list", pvo);
			map.put("successList", successList);
			
			for(ProblemVO vo : pvo) {
				logger.info(vo.getProblem_id() + " : " + vo.getProblem_title());
			}
			
			System.out.println("isSearch? : " + isSearch);
			
			return map;
		}
		else if (problem_level != 0 && category_name.equals("unselected")) {
			logger.info("level: " + problem_level);
			
			List<ProblemVO> pvo = new ArrayList<ProblemVO>();
			int count = 0;
			String searchInput = (String) session.getAttribute("searchInput");
			String searchType = (String) session.getAttribute("searchType");
			
			if(isSearch) {
				pvo = problemService.searchProblemListByLevel(searchType, searchInput, problem_level, cri);
				count = problemService.searchProblemCountByLevel(searchType, searchInput, problem_level);
			} else {
				pvo = problemService.readProblemList(problem_level, cri);
				count = pvo.size();
			}
			
//			List<ProblemVO> pvo = problemService.readProblemList(category_name, cri);
//			int count = problemService.ProblemCount(category_name);
			
			PageMaker pageMaker = new PageMaker();
			cri.setPerPageNum(8);
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(count);
			
			boolean[] successList = new boolean[8];
			int index = 0;
			
			for(ProblemVO problem : pvo) {
				successList[index++] = codeService.IsSuccess(user.getUser_id(), problem.getProblem_id());
			}
			
			map.put("pageMaker", pageMaker);
			map.put("list", pvo);
			map.put("successList", successList);
			
			logger.info("count: " + count);
			

			
			System.out.println("successList: " + successList);
			map.put("successList", successList);
			
			
			for(ProblemVO vo : pvo) {
				logger.info(vo.getProblem_id() + " : " + vo.getProblem_title());
			}
			return map;
		}
		else if (problem_level == 0 && category_name != "unselected") {
			logger.info("category: " + category_name);
			
			List<ProblemVO> pvo = new ArrayList<ProblemVO>();;
			int count = 0;
			String searchInput = (String) session.getAttribute("searchInput");
			String searchType = (String) session.getAttribute("searchType");
			
			if(isSearch) {
				pvo = problemService.searchProblemListByCategory(searchType, searchInput, category_name, cri);
				count = problemService.searchProblemCountByCategory(searchType, searchInput, category_name);
			} else {
				pvo = problemService.readProblemList(category_name, cri);
				count = problemService.ProblemCount(category_name);
			}
			
//			List<ProblemVO> pvo = problemService.readProblemList(category_name, cri);
//			int count = problemService.ProblemCount(category_name);
			
			PageMaker pageMaker = new PageMaker();
			cri.setPerPageNum(8);
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(count);
			
			boolean[] successList = new boolean[8];
			int index = 0;
			
			for(ProblemVO problem : pvo) {
				successList[index++] = codeService.IsSuccess(user.getUser_id(), problem.getProblem_id());
			}
			
			map.put("pageMaker", pageMaker);
			map.put("list", pvo);
			map.put("successList", successList);
			
			logger.info("count: " + count);
			

			
			System.out.println("successList: " + successList);
			map.put("successList", successList);
			
			
			for(ProblemVO vo : pvo) {
				logger.info(vo.getProblem_id() + " : " + vo.getProblem_title());
			}
			return map;
		}
		else {
			logger.info("level: " + problem_level);
			logger.info("category: " + category_name);
			logger.info("page:" +  cri.getPage());
			logger.info("perPageNum:" +  cri.getPerPageNum());
			
			List<ProblemVO> pvo = new ArrayList<ProblemVO>();;
			int count = 0;
			String searchInput = (String) session.getAttribute("searchInput");
			String searchType = (String) session.getAttribute("searchType");
			
			if(isSearch) {
				pvo = problemService.searchProblemListByCategoryAndLevel(searchType, searchInput, category_name, problem_level, cri);
				count = problemService.searchProblemCountByCategoryAndLevel(searchType, searchInput, category_name, problem_level);
			} else {
				pvo = problemService.readProblemList(problem_level, category_name, cri);
				count = problemService.ProblemCount(problem_level, category_name);
			}
			
			PageMaker pageMaker = new PageMaker();
			cri.setPerPageNum(8);
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(count);
			
			boolean[] successList = new boolean[8];
			int index = 0;
			
			for(ProblemVO problem : pvo) {
				successList[index++] = codeService.IsSuccess(user.getUser_id(), problem.getProblem_id());
			}
			
			map.put("pageMaker", pageMaker);
			map.put("list", pvo);
			map.put("successList", successList);
			
			for(ProblemVO vo : pvo) {
				logger.info(vo.getProblem_id() + " : " + vo.getProblem_title());
			}
			
			return map;
		}
	}
	
	@RequestMapping(value="/problem/{problem_id}", method=RequestMethod.GET)
	public String problemGet(@PathVariable("problem_id") int problem_id, Model model, HttpSession session) throws Exception {
		//logger.info("踰덊샇: "+ problem_id);
		UserVO user = (UserVO)session.getAttribute("user");
		ProblemVO pvo = problemService.readProblem(problem_id);
		TestcaseVO tvo= testcaseService.readTestcase(problem_id);
		
		session.setAttribute("problem_id", problem_id);
		model.addAttribute("user", user);
		model.addAttribute("problem", pvo);
		model.addAttribute("testcase", tvo);
		//logger.info(vo.getProblem_title() + " " + vo.getProblem_id() + " " + vo.getProblem_content());	
//		String result = "";
		
//		model.addAttribute("result", result);

		return "solve_page";	
	}
	
	@RequestMapping(value="/problem/insert", method = RequestMethod.GET)
	public String problemInsert(Locale locale, Model model, HttpSession session) throws Exception {
		UserVO user = (UserVO)session.getAttribute("user");
		List<CategoryVO> vo = categoryService.readCategoryList();
		model.addAttribute("user", user);
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
	public String testcaseInsert(Locale locale, Model model, HttpSession session) throws Exception {
		UserVO user = (UserVO)session.getAttribute("user");
		model.addAttribute("user", user);
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
		return "redirect:/testcase";
	}
	
	@RequestMapping(value="/submit", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getSubmit(String code, String lang, HttpSession session) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		
		UserVO user = (UserVO)session.getAttribute("user");
		//problem_id
		int problem_id = (Integer) session.getAttribute("problem_id");
		
		byte success = 0;
		// success 확인하고
		
		// 성공시 성공횟수 증가시키는 작업 필요(동건씨)
		if(success == 1) {
			problemService.addSuccess(problem_id);
		}
		
		// 제출시 제출횟수 증가
		problemService.addSubmit(problem_id);
		
		//user_id
		String user_id = user.getUser_id();
		
		// input, output 리스트를 받아온다.
		List<String> tvoInput = testcaseService.getTestCaseInput(problem_id);
		List<String> tvoOutput = testcaseService.getTestCaseOutput(problem_id);
				
		// console 창 출력
		System.out.println("<UserID>");
		System.out.println(user_id);
	
		System.out.println("<ProblemID>");
		System.out.println(problem_id);
		
		System.out.println("<TestCase Input>");
		for(String input : tvoInput) {
			System.out.println(input);
		}
		System.out.println("<TestCase Output>");
		for(String output : tvoOutput) {
			System.out.println(output);
		}
				
		System.out.println("<Code>");
		System.out.println(code);
		System.out.println("<Lang>");
		System.out.println(lang);
		
		String result = code;
		
		map.put("result", result);
		
		//test
//		CodeVO codeVO = new CodeVO();
//		//현재시간
//		SimpleDateFormat formatter = new SimpleDateFormat ("yyyy-MM-dd hh:mm:ss");
//		Calendar cal = Calendar.getInstance();
//		String today = null;
//		today = formatter.format(cal.getTime());
//		Timestamp ts = Timestamp.valueOf(today);
//
//		codeVO.setCode_code("??????");
//		codeVO.setCode_date(ts);
//		codeVO.setCode_language("java");
//		codeVO.setCode_open((byte)0);
//		codeVO.setCode_success((byte)0);
//		codeVO.setProblem_id(1000);
//		codeVO.setUser_id("admin");
//		
//		codeService.submitCode(codeVO);
		
		Thread.sleep(2000);
		
		return map;
	}
	
	@RequestMapping(value="/execute", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getExecute (String code, String lang, HttpSession session) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		
		UserVO user = (UserVO)session.getAttribute("user");
		//problem_id
		int problem_id = (Integer) session.getAttribute("problem_id");
		
		//user_id
		String user_id = user.getUser_id();
		
		// input, output 리스트를 받아온다.
		List<String> tvoInput = testcaseService.getTestCaseInput(problem_id);
		List<String> tvoOutput = testcaseService.getTestCaseOutput(problem_id);
				
		// console 창 출력
		System.out.println("<UserID>");
		System.out.println(user_id);
	
		System.out.println("<ProblemID>");
		System.out.println(problem_id);
		
		System.out.println("<TestCase Input>");
		for(String input : tvoInput) {
			System.out.println(input);
		}
		System.out.println("<TestCase Output>");
		for(String output : tvoOutput) {
			System.out.println(output);
		}
				
		System.out.println("<Code>");
		System.out.println(code);
		System.out.println("<Lang>");
		System.out.println(lang);
		
		String result = code;
		
		map.put("result", result);
		
		Thread.sleep(2000);
		
		return map;
	}
	
	@RequestMapping(value = "/searchProblem", method = RequestMethod.POST)
	@ResponseBody
	public void searchProblem(
			HttpSession session,
			String searchInput,
			String searchType) throws Exception {			
		session.setAttribute("searchInput", searchInput);
		session.setAttribute("searchType", searchType);
	}
	
	@RequestMapping(value="/problem/idcheck.do", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> problemcheck(String value) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		
		boolean flag = false; // 없는문제
//		isRight = problemService.checkId(value);
//		flag = true; // 있는문제~~
		map.put("flag", flag);
	
		return map;
	}

}
