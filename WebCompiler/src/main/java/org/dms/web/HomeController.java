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
	
	/* 문제리스트 */
	@RequestMapping(value = "/problemlist", method = RequestMethod.GET)
	public String problemListGet(Locale locale, Model model, Criteria cri) throws Exception {
		logger.info("page:" +  cri.getPage());
		logger.info("perPageNum:" +  cri.getPerPageNum());
		List<CategoryVO> cvo = categoryService.readCategoryList();
		List<ProblemVO> pvo = problemService.readProblemList(cri);
		
		
		PageMaker pageMaker = new PageMaker();
		cri.setPerPageNum(2);
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(problemService.ProblemCount());
		
		logger.info("page: " +  cri.getPage());
		
		model.addAttribute("category", cvo);
		model.addAttribute("problem", pvo);
		model.addAttribute("pageMaker", pageMaker);
		return "problemList";
	}
	
	/* 문제리스트 */
	/* 페이지 전환 시 호출 */
	@RequestMapping(value = "/category_test.do", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> categorytest_test(Locale locale, Model model, Criteria cri) throws Exception {		
		Map<String, Object> map = new HashMap<String, Object>();
		
		List<CategoryVO> cvo = categoryService.readCategoryList();
		List<ProblemVO> pvo = problemService.readProblemList(cri);
		//model.addAttribute("category", cvo);
		//model.addAttribute("problem", pvo);
		
		PageMaker pageMaker = new PageMaker();
		cri.setPerPageNum(2);
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(problemService.ProblemCount());
		
		logger.info("page: " +  cri.getPage());
		logger.info("perPageNum:" +  cri.getPerPageNum());
		logger.info("startPage:" +  pageMaker.getStartPage() + "endPage: " +  pageMaker.getEndPage());
		//model.addAttribute("pageMaker", pageMaker);
		//map.put("")
		
		map.put("pageMaker", pageMaker);
		map.put("list", pvo);
		
		for(ProblemVO vo : pvo) {
			logger.info(vo.getProblem_id() + " : " + vo.getProblem_title());
		}
		return map;
	}
	
	/* 문제리스트 */
	/* 분류, 레벨 선택 시 호출 */
	@RequestMapping(value="problemList_test.do")
	@ResponseBody
	public Map<String, Object> problemList_test(int problem_level, String category_name, Criteria cri, HttpSession session, Locale locale) throws Exception {
		logger.info("레벨:" + problem_level + "  분류:" + category_name);		
		logger.info("현재페이지: ", cri.getPage());

		if(problem_level == 0 && category_name.equals("unselected")) {
			Map<String, Object> map = new HashMap<String, Object>();
			List<ProblemVO> vo = problemService.readProblemList(cri);
			
			PageMaker pageMaker = new PageMaker();
			cri.setPerPageNum(2);
			pageMaker.setCri(cri);
			
			pageMaker.setTotalCount(problemService.ProblemCount());
			logger.info("현재페이지: ", cri.getPage());
			logger.info("시작페이지: ", cri.getPage());
			map.put("pageMaker", pageMaker);
			map.put("list", vo);
			return map;
		}
		else {
			Map<String, Object> map = new HashMap<String, Object>();
			List<ProblemVO> vo = problemService.readProblemList(problem_level, category_name, cri);
			
			PageMaker pageMaker = new PageMaker();
			cri.setPerPageNum(2);
			pageMaker.setCri(cri);
			
			pageMaker.setTotalCount(problemService.ProblemCount(problem_level, category_name));
			logger.info("현재페이지: ", cri.getPage());
			logger.info("시작페이지: ", cri.getPage());
			map.put("pageMaker", pageMaker);
			map.put("list", vo);
			return map;
		}
		

		//return map;
	}
	
	

	/* 카테고리 */
	/*@RequestMapping(value = "/category", method = RequestMethod.GET)
	public String categoryGet(Locale locale, Model model) throws Exception {
		
		List<ProblemVO> test = problemService.test();
		List<CategoryVO> cvo = categoryService.readCategoryList();
		List<ProblemVO> pvo = problemService.readProblemList();
		model.addAttribute("category", cvo);
		model.addAttribute("problem", pvo);
		for(ProblemVO vo : test) {
			logger.info(vo.getProblem_id() + " : " + vo.getProblem_title());
		}
		return "category";
	}*/

	@RequestMapping(value="/requestObject")
    @ResponseBody
    public UserVO simpleWithObject(HttpServletRequest request
            , @RequestParam String problem_level
            , @RequestParam String category_name) throws Exception {
        //필요한 로직 처리
		logger.info(problem_level);

        return userService.readUser(1);
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
	
	/*
	@RequestMapping(value="/requestObject", method=RequestMethod.GET)
    
    public @ResponseBody Map<String, Object> simpleWithObject(Jamong jamong) {
        //필요한 로직 처리
		LOGGER.info(vo.toString());
		
		return categoryService.selectProblem(vo);
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
		
		if(problem_level == 0 && category_name.equals("unselected")) {
			Map<String, Object> map = new HashMap<String, Object>();
			List<ProblemVO> vo = problemService.readProblemList();
			
			map.put("list", vo);
			return map;
		}
		else {
			Map<String, Object> map = new HashMap<String, Object>();
			List<ProblemVO> vo = problemService.readProblemList(problem_level, category_name);
			
			map.put("list", vo);
			return map;
		}
		
		/*
		for(int i = 0; i < vo.size(); i++) {
			logger.info(vo.get(i).getProblem_title() + vo.get(i).getProblem_level() + vo.get(i).getCategory_id());
		}
		map.put("list", vo);
		*/
		//return map;
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
