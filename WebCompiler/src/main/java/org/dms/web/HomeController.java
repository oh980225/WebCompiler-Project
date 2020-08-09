package org.dms.web;

import java.io.File;
import java.io.FileWriter;
import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.dms.web.domain.*;
import org.dms.web.service.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

/**
 * Handles requests for the application home page.
 */
@Component
@Controller
public class HomeController {
	
	@Autowired(required=true)
	UserService userService;
	@Autowired(required=true)
	CategoryService categoryService;
	@Autowired(required=true)
	ProblemService problemService;
	@Autowired(required=true)
	TestcaseService testcaseService;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
		
	/**
	 * Simply selects the home view to render by returning its name.
	 * @throws Exception 
	 */
	/*
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) throws Exception {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		
		List<UserVO> vo = userService.readUserList();
		List<CategoryVO> cvo = categoryService.readCategoryList();
		model.addAttribute("category", cvo);
		model.addAttribute("serverTime", formattedDate );
		model.addAttribute("user", vo);
			
		return "home";
	}
	*/
	/* 카테고리 */
	@RequestMapping(value = "/category", method = RequestMethod.GET)
	public String categoryGet(Locale locale, Model model) throws Exception {
		
		List<CategoryVO> vo = categoryService.readCategoryList();
		model.addAttribute("category", vo);
		return "category";
	}
	
	@RequestMapping(value="/requestObject")
    @ResponseBody
    public UserVO simpleWithObject(HttpServletRequest request
            , @RequestParam String problem_level
            , @RequestParam String category_name) throws Exception {
        //필요한 로직 처리
		logger.info(problem_level);

        return userService.readUser(1);
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
		return "redirect:/p";
	}
	@RequestMapping(value="/t", method = RequestMethod.GET)
	public String testcaseInsert(Locale locale, Model model) throws Exception {
		return "testcase_insert";
	}
	
	@RequestMapping(value="/t.do", method = RequestMethod.POST)
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
	
	/*
	@RequestMapping(value = "/requestObject", method = RequestMethod.POST)
	@ResponseBody
	public String categoryAjax(TestVO vo, HttpServletRequest request, Locale locale, Model model) {			
		//HashMap<String, Object> map = new HashMap<String, Object>();
        //map.put("name", vo.getName());
        //map.put("age", vo.getLevel());
        
        logger.info(vo.getName() + vo.getLevel());
        
        return vo.getName() + vo.getLevel();
	}
	*/
	
	@RequestMapping(value = "/code", method = RequestMethod.GET)
	public String code(Locale locale, Model model) throws Exception {			
		return "compile";
	}
	
	/*
	@RequestMapping(value="/requestObject", method=RequestMethod.GET)
    
    public @ResponseBody Map<String, Object> simpleWithObject(Jamong jamong) {
        //필요한 로직 처리
		LOGGER.info(vo.toString());
		
		return categoryService.selectProblem(vo);
    }
    */
	
	
	
	@RequestMapping(value = "/code", method = RequestMethod.POST)
	//@ResponseBody
	public String logincheck(HttpServletRequest request) {    
		String code = request.getParameter("content");
        return "compile";
	}
	
	/* 문제 조회 */
/*	
	
	@RequestMapping(value="/problem/{problem_id}", method=RequestMethod.GET)
	public String problemGet(@PathVariable("problem_id") int problem_id, Model model) throws Exception {
		//logger.info("번호: "+ problem_id);
		ProblemVO pvo = problemService.readProblem(problem_id);
		TestcaseVO tvo= testcaseService.readTestcase(problem_id);
		
		model.addAttribute("problem", pvo);
		model.addAttribute("testcase", tvo);
		//logger.info(vo.getProblem_title() + " " + vo.getProblem_id() + " " + vo.getProblem_content());		
		return "problem";	
	}
*/
//	1
	@RequestMapping("hello.do")
	public String hello(Model model) {
		logger.info("HelloController hello" + new Date());
		
		MyClass cls = new MyClass(101, "일지매");
		model.addAttribute("myCls", cls);
		
		return "hello";
	}
	/* 2 controller -> controller */
	@RequestMapping(value="move.do", method = RequestMethod.GET)
	public String move() {
		logger.info("HelloController move " + new Date());
		
		//sendRedirect(컨트롤러에서 컨트롤러로 보낸다)
		return "redirect:/hello.do"; 
//		return "forward:/hello.do"; 데이터를 가져갈때는 forward
	}
	
//	3번
//	Ajax 용 return값은 ajax에서 가져오는 데이터 (넘겨줘야할 데이터)
	//Ajax사용시 @ResponseBody를 사용해야한다
	@ResponseBody
	@RequestMapping(value="idCheck.do", produces = "application/String; charset=utf-8")
	//적어주기만 하면 무조건 session에 넘어간다 (의존성)
	public String idCheck(String id, HttpSession session) {
		logger.info("HelloController idCheck " + new Date());
		logger.info("id:" + id);
		
		String str = "오케이";
		return str;	
	}
	

	@RequestMapping(value="problemList.do")
	@ResponseBody
	//적어주기만 하면 무조건 session에 넘어간다 (의존성)
	public Map<String, Object> problemList(int problem_level, String category_name, HttpSession session, Locale locale) throws Exception {
		logger.info("hole " + new Date());
		logger.info("레벨:" + problem_level + "  분류:" + category_name);
		
		Map<String, Object> map = new HashMap<String, Object>();
		List<ProblemVO> vo = problemService.readProblemList(problem_level, category_name);
		
		for(int i = 0; i < vo.size(); i++) {
			logger.info(vo.get(i).getProblem_title() + vo.get(i).getProblem_level() + vo.get(i).getCategory_id());
		}
		map.put("list", vo);
		return map;
	}
	
	
	//4
	@ResponseBody
	@RequestMapping(value="account.do" ,method = RequestMethod.POST)
	public  Map<String, Object> account(Human my){
		logger.info("HelloController account " + new Date());
		logger.info(my.toString());
		
		//DB 접근
		Map<String, Object> rmap = new HashMap<String, Object>();
		rmap.put("msg", "메시지입니다");
		rmap.put("name", "정수동");
		
		return rmap;
		
	}
	
	
	@ResponseBody
	@RequestMapping(value="updateUser.do", method = {RequestMethod.GET, RequestMethod.POST})
	//@RequestBody를 적어야 Map으로 값을 받아올 수 있다.
	public Map<String, Object> updateUser(@RequestBody Map<String, Object> map){
		logger.info("HelloController updateUser " + new Date());
		logger.info( map.get("name") + "");
		logger.info( map.get("tel") + "");
		logger.info( map.get("email") + "");
		logger.info( map.get("birth") + "");
		
		Map<String, Object> rmap = new HashMap<String, Object>();
		rmap.put("name", "일지매");
		rmap.put("age", "24");
		
		return rmap;
	}
	
	

}
