package org.dms.web;

import java.io.FileOutputStream;
import java.io.OutputStream;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.dms.web.domain.CategoryVO;
import org.dms.web.domain.ChatVO;
import org.dms.web.domain.CodeBoardVO;
import org.dms.web.domain.Criteria;
import org.dms.web.domain.Human;
import org.dms.web.domain.MyClass;
import org.dms.web.domain.PageMaker;
import org.dms.web.domain.ProblemVO;
import org.dms.web.domain.UserVO;
import org.dms.web.service.CategoryService;
import org.dms.web.service.ChatService;
import org.dms.web.service.CodeBoardService;
import org.dms.web.service.ProblemService;
import org.dms.web.service.TestcaseService;
import org.dms.web.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Handles requests for the application home page.
 */
//@Component
@Controller
public class TestController {
	
	@Autowired(required=true)
	UserService userService;
	
	@Autowired(required=true)
	CategoryService categoryService;
	
	@Autowired(required=true)
	ProblemService problemService;
	
	@Autowired(required=true)
	TestcaseService testcaseService;
	
	@Autowired(required=true)
	CodeBoardService codeBoardService;
	
	@Autowired(required=true)
    private ChatService chatService;

	private static final Logger logger = LoggerFactory.getLogger(TestController.class);
		
	/**
	 * Simply selects the home view to render by returning its name.
	 * @throws Exception 
	 */

	
	/* �눧紐꾩젫�뵳�딅뮞占쎈뱜 */
	
	@RequestMapping(value = "/test", method = RequestMethod.GET)
	public String problemListGet(Locale locale, Model model, Criteria cri) throws Exception {
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
		return "problemList";
	}
	
	/* �눧紐꾩젫�뵳�딅뮞占쎈뱜 */
	@RequestMapping(value = "/chattest", method = RequestMethod.GET)
	public String chattest(Locale locale, Model model, HttpSession session) throws Exception {
		UserVO user = (UserVO)session.getAttribute("user");
		model.addAttribute("user", user);
		return "chat_test";
	}
	
	@RequestMapping(value = "/chat/read.do", method = RequestMethod.GET)
	@ResponseBody
    public List<ChatVO> getChatList(Locale locale, Model model, int problem_id) throws Exception {
    	logger.info("getChatList" +  problem_id);
    	List<ChatVO> cvo = chatService.readChatList(problem_id);
    	
    	for(ChatVO tmp : cvo) {
    		tmp.setChat_content(tmp.getChat_content().replace("\r\n", "<br>"));
    	}
    	return cvo;
    }

	/* 燁삳똾�믤�⑥쥓�봺 */
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
        //占쎈툡占쎌뒄占쎈립 嚥≪뮇彛� 筌ｌ꼶�봺
		logger.info(problem_level);

        return userService.readUser("1");
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
        //占쎈툡占쎌뒄占쎈립 嚥≪뮇彛� 筌ｌ꼶�봺
		LOGGER.info(vo.toString());
		
		return categoryService.selectProblem(vo);
    }
    */
	
//	1
	@RequestMapping("hello.do")
	public String hello(Model model) {
		logger.info("HelloController hello" + new Date());
		
		MyClass cls = new MyClass(101, "占쎌뵬筌욑옙筌랃옙");
		model.addAttribute("myCls", cls);
		
		return "hello";
	}
	/* 2 controller -> controller */
	@RequestMapping(value="move.do", method = RequestMethod.GET)
	public String move() {
		logger.info("HelloController move " + new Date());
		
		//sendRedirect(�뚢뫂�뱜嚥▲끇�쑎占쎈퓠占쎄퐣 �뚢뫂�뱜嚥▲끇�쑎嚥∽옙 癰귣�沅�占쎈뼄)
		return "redirect:/hello.do"; 
//		return "forward:/hello.do"; 占쎈쑓占쎌뵠占쎄숲�몴占� 揶쏉옙占쎌죬揶쏅뜄釉ｏ옙�뮉 forward
	}
	
//	3甕곤옙
//	Ajax 占쎌뒠 return揶쏅�わ옙 ajax占쎈퓠占쎄퐣 揶쏉옙占쎌죬占쎌궎占쎈뮉 占쎈쑓占쎌뵠占쎄숲 (占쎄퐜野꺿뫁夷억옙鍮욑옙釉� 占쎈쑓占쎌뵠占쎄숲)
	//Ajax占쎄텢占쎌뒠占쎈뻻 @ResponseBody�몴占� 占쎄텢占쎌뒠占쎈퉸占쎈튊占쎈립占쎈뼄
	@ResponseBody
	@RequestMapping(value="idCheck.do", produces = "application/String; charset=utf-8")
	//占쎌읅占쎈선雅뚯눊由곤쭕占� 占쎈릭筌롳옙 �눧�똻�쒎쳞占� session占쎈퓠 占쎄퐜占쎈선揶쏄쑬�뼄 (占쎌벥鈺곕똻苑�)
	public String idCheck(String id, HttpSession session) {
		logger.info("HelloController idCheck " + new Date());
		logger.info("id:" + id);
		
		String str = "占쎌궎�놂옙占쎌뵠";
		return str;	
	}
	

	@RequestMapping(value="problemList.do")
	@ResponseBody
	//占쎌읅占쎈선雅뚯눊由곤쭕占� 占쎈릭筌롳옙 �눧�똻�쒎쳞占� session占쎈퓠 占쎄퐜占쎈선揶쏄쑬�뼄 (占쎌벥鈺곕똻苑�)
	public Map<String, Object> problemList(int problem_level, String category_name, HttpSession session, Locale locale) throws Exception {
		logger.info("hole " + new Date());
		logger.info("占쎌쟿甕곤옙:" + problem_level + "  �겫袁⑥첒:" + category_name);
		
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
		
		//DB 占쎌젔域뱄옙
		Map<String, Object> rmap = new HashMap<String, Object>();
		rmap.put("msg", "筌롫뗄�뻻筌욑옙占쎌뿯占쎈빍占쎈뼄");
		rmap.put("name", "占쎌젟占쎈땾占쎈짗");
		
		return rmap;
		
	}
	
	
	@ResponseBody
	@RequestMapping(value="updateUser.do", method = {RequestMethod.GET, RequestMethod.POST})
	//@RequestBody�몴占� 占쎌읅占쎈선占쎈튊 Map占쎌몵嚥∽옙 揶쏅�れ뱽 獄쏆룇釉섓옙�궞 占쎈땾 占쎌뿳占쎈뼄.
	public Map<String, Object> updateUser(@RequestBody Map<String, Object> map){
		logger.info("HelloController updateUser " + new Date());
		logger.info( map.get("name") + "");
		logger.info( map.get("tel") + "");
		logger.info( map.get("email") + "");
		logger.info( map.get("birth") + "");
		
		Map<String, Object> rmap = new HashMap<String, Object>();
		rmap.put("name", "占쎌뵬筌욑옙筌랃옙");
		rmap.put("age", "24");
		
		return rmap;
	}	
	
	@RequestMapping(value="/monaco")
	public String getMonaco() {
		return "monaco_page";
	}
	
	@RequestMapping(value="/code_ref")
	public String getCodeRef() {
		return "code_ref";
	}
	
	@RequestMapping(value="/problem_ref")
	public String getProblemRef() {
		return "problem_ref";
	}
	
	@RequestMapping(value="/signin")
	public String getSignin() {
		return "signin";
	}
	
	// codeBoard 테스트
	@RequestMapping(value="/codeBoard")
	public String getCodeBoard(HttpSession session, Model model, Criteria criteria) throws Exception {
		UserVO user = (UserVO) session.getAttribute("user");
		List<CodeBoardVO> codeBoardList = codeBoardService.getCodeBoardList(user.getUser_id(), criteria);
		
		model.addAttribute("codeBoardList", codeBoardList);
		
		for(CodeBoardVO codeBoard : codeBoardList) {
			System.out.println(codeBoard);
		}
		
		return "test_view";
	}


}
