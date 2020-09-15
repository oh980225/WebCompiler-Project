package org.dms.web;

import java.io.File;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.dms.web.domain.CategoryVO;
import org.dms.web.domain.Criteria;
import org.dms.web.domain.PageMaker;
import org.dms.web.domain.ProblemVO;
import org.dms.web.domain.TestcaseVO;
import org.dms.web.domain.UserVO;
import org.dms.web.service.CategoryService;
import org.dms.web.service.ProblemService;
import org.dms.web.service.TestcaseService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Async;
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

	@RequestMapping(value = "/problem", method = RequestMethod.GET)
	public String test(Locale locale, Model model, Criteria cri) throws Exception {
		logger.info("page:" +  cri.getPage());
		logger.info("perPageNum:" +  cri.getPerPageNum());
		List<CategoryVO> cvo = categoryService.readCategoryList();
		List<ProblemVO> pvo = problemService.readProblemList(cri);

		PageMaker pageMaker = new PageMaker();
		cri.setPerPageNum(8);
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(problemService.ProblemCount());
		
		logger.info("page: " +  cri.getPage());
		
		model.addAttribute("category", cvo);

		model.addAttribute("problem", pvo);
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("cri", cri);
		return "problem_list";
	}
	
	@RequestMapping(value = "/problem.do", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> categorytest_test(Locale locale, Model model, Criteria cri, int problem_level, String category_name) throws Exception {		
		logger.info("categorytest_test");
		Map<String, Object> map = new HashMap<String, Object>();
		
		if(problem_level == 0 && category_name.equals("unselected")) {
			logger.info("level: " + problem_level);
			logger.info("category: " + category_name);
			
			List<ProblemVO> pvo = problemService.readProblemList(cri);
			int count = problemService.ProblemCount();
			PageMaker pageMaker = new PageMaker();
			cri.setPerPageNum(8);
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(count);
			
			map.put("pageMaker", pageMaker);
			map.put("list", pvo);
			
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
			
			List<ProblemVO> pvo = problemService.readProblemList(problem_level, category_name, cri); // 추가
			int count = problemService.ProblemCount(problem_level, category_name);
			PageMaker pageMaker = new PageMaker();
			cri.setPerPageNum(8);
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(count);
			
			
			map.put("pageMaker", pageMaker);
			map.put("list", pvo);
			
			for(ProblemVO vo : pvo) {
				logger.info(vo.getProblem_id() + " : " + vo.getProblem_title());
			}
			return map;
		}
	}
	
	@RequestMapping(value="/problem/{problem_id}", method=RequestMethod.GET)
	public String problemGet(@PathVariable("problem_id") int problem_id, Model model, HttpSession session) throws Exception {
		//logger.info("踰덊샇: "+ problem_id);
		session.setAttribute("problem_id", problem_id);
		
		ProblemVO pvo = problemService.readProblem(problem_id);
		TestcaseVO tvo= testcaseService.readTestcase(problem_id);
		
		model.addAttribute("problem", pvo);
		model.addAttribute("testcase", tvo);
		//logger.info(vo.getProblem_title() + " " + vo.getProblem_id() + " " + vo.getProblem_content());	
//		String result = "";
		
//		model.addAttribute("result", result);

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
	
	@RequestMapping(value="/submit", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getCode(String code, String lang, HttpSession session) throws Exception {
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
		
		
		//누르면 txt파일 생성되고, 거기에 내용 쓰고
//		try {
//		    OutputStream output = new FileOutputStream("C:\\Users\\ohseu\\Desktop\\test.txt");
//		    String str = code + '\n' + lang; // 이걸 혀제
//		    byte[] by=str.getBytes();
//		    output.write(by);
//		    output.flush();
//		    output.close();
//				
//		} catch (Exception e) {
//	            e.getStackTrace();
//		}
//		
//		
//		try{
//            //파일 객체 생성
//            File file = new File("C:\\Users\\ohseu\\Desktop\\result.txt");
//            //입력 스트림 생성
//            FileReader filereader = new FileReader(file);
//            int singleCh = 0;
//            while((singleCh = filereader.read()) != -1){
//            	result += (char)singleCh;
//                System.out.print((char)singleCh);
//            }
//            filereader.close();
//        }catch (Exception e) {
//        	System.out.println(e);
//        }
		
		return map;
	}
		
}
