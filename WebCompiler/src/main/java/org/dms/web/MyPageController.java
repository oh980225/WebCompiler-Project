package org.dms.web;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.dms.web.domain.CodeBoardVO;
import org.dms.web.domain.CodeVO;
import org.dms.web.domain.Criteria;
import org.dms.web.domain.PageMaker;
import org.dms.web.domain.ProblemVO;
import org.dms.web.domain.UserVO;
import org.dms.web.service.CodeBoardService;
import org.dms.web.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class MyPageController {
	
	@Autowired(required=true)
	UserService userService;
	
	@Autowired(required=true)
	CodeBoardService codeBoardService;
	
	private static final Logger logger = LoggerFactory.getLogger(MyPageController.class);

	@RequestMapping(value = "/mypage")
	public String getMyPage(Model model, HttpSession session, Criteria criteria) throws Exception {
		UserVO user = (UserVO)session.getAttribute("user");
		List<CodeVO> codeList = userService.getCodeList(user.getUser_id());
		List<CodeBoardVO> codeBoardList_ = codeBoardService.getCodeBoardList(user.getUser_id());
		
		PageMaker pageMaker = new PageMaker();
		criteria.setPerPageNum(5);
		pageMaker.setCri(criteria);
		pageMaker.setTotalCount(codeBoardList_.size());
		
		List<CodeBoardVO> codeBoardList = codeBoardService.getCodeBoardList(user.getUser_id(), criteria);
		System.out.println(codeBoardList);
		model.addAttribute("user", user);
		model.addAttribute("codeList", codeList);
		model.addAttribute("codeBoardList", codeBoardList);
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("criteria", criteria);
		
		for(CodeBoardVO codeBoard : codeBoardList) {
			System.out.println(codeBoard);
		}
		
		return "mypage";
	}
	
	@RequestMapping(value = "/mypage", method = RequestMethod.POST)
	public String updateUser(UserVO user, HttpSession session) throws Exception {
		userService.updateUser(user);
		
		UserVO newUser = userService.readUser(user.getUser_id());
		session.setAttribute("user", newUser);
		
		return "redirect:/mypage";
	}
	
	@RequestMapping(value= "/mypage/saveImage",  method = RequestMethod.POST)
	public String saveImage(@RequestParam("user_id") String userId,
							@RequestParam("user_img") MultipartFile imgFile,
							HttpSession session) throws Exception {
		UserVO user = new UserVO();
		
		user.setUser_id(userId);
		user.setUser_img(imgFile.getBytes());
		
		userService.saveImage(user);
		
		UserVO newUser = userService.readUser(user.getUser_id());
		session.setAttribute("user", newUser);
		
		return "redirect:/mypage";
	}
	
	@RequestMapping(value="/getByteImage/{user_id}")
	public ResponseEntity<byte[]> getByteImage(@PathVariable("user_id") String userId) throws Exception {
		System.out.println(userId);
		UserVO user = userService.readUser(userId);
		byte[] imageContent = user.getUser_img();
		
		final HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.IMAGE_PNG);
		
		return new ResponseEntity<byte[]>(imageContent, headers, HttpStatus.OK);
	}
	
	// 회원 탈퇴 기능
	@RequestMapping(value="/mypage/delete/{user_id}")
	public String withdrawUser(@PathVariable("user_id") String userId, HttpSession session) throws Exception {
		userService.deleteUser(userId);
		session.invalidate();
		
		return "redirect:/mypage";
	}
	
	// 해당 모달창 띄우기
	@RequestMapping(value="/modal", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> openModal(int index, HttpSession session, Criteria criteria) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		UserVO user = (UserVO)session.getAttribute("user");
		criteria.setPerPageNum(5);
		
		List<CodeBoardVO> codeBoardList = codeBoardService.getCodeBoardList(user.getUser_id(), criteria);
		
		map.put("codeBoard", codeBoardList.get(index));
		
		return map;
	}
	
//	@RequestMapping(value = "/codeBoardPaging", method = RequestMethod.POST)
//	@ResponseBody
//	public Map<String, Object> codeBoardPaging(HttpSession session,Locale locale, Model model, Criteria criteria, int problem_level, String category_name) throws Exception {		
//		logger.info("categorytest_test");
//		Map<String, Object> map = new HashMap<String, Object>();
//		
//		if(problem_level == 0 && category_name.equals("unselected")) {
//			logger.info("level: " + problem_level);
//			logger.info("category: " + category_name);
//			
//			UserVO user = (UserVO)session.getAttribute("user");
//			List<CodeBoardVO> codeBoardList_ = codeBoardService.getCodeBoardList(user.getUser_id());
//			
//			PageMaker pageMaker = new PageMaker();
//			criteria.setPerPageNum(5);
//			pageMaker.setCri(criteria);
//			pageMaker.setTotalCount(codeBoardList_.size());
//			
//			List<CodeBoardVO> codeBoardList = codeBoardService.getCodeBoardList(user.getUser_id(), criteria);
//			
//			map.put("pageMaker", pageMaker);
//			map.put("list", codeBoardList);
//			
//			return map;
//		}
//		else {
//			logger.info("level: " + problem_level);
//			logger.info("category: " + category_name);
//			logger.info("page:" +  criteria.getPage());
//			logger.info("perPageNum:" +  criteria.getPerPageNum());
//			
//			UserVO user = (UserVO)session.getAttribute("user");
//			List<CodeVO> codeList = userService.getCodeList(user.getUser_id());
//			List<CodeBoardVO> codeBoardList_ = codeBoardService.getCodeBoardList(user.getUser_id());
//			
//			//List<ProblemVO> pvo = problemService.readProblemList(problem_level, category_name, cri); // 추가
//			//int count = problemService.ProblemCount(problem_level, category_name);
//			PageMaker pageMaker = new PageMaker();
//			criteria.setPerPageNum(5);
//			pageMaker.setCri(criteria);
//			pageMaker.setTotalCount(codeBoardList_.size());
//			
//			map.put("pageMaker", pageMaker);
//			//map.put("list", pvo);
//			
//			return map;
//		}
//	}
	
	@RequestMapping(value = "/codeBoardPaging", method = RequestMethod.GET)
	@ResponseBody
	public String getCodeBoardPaging(
			HttpSession session,
			Locale locale, 
			Model model, 
			Criteria criteria,
			int page) throws Exception {	
		
		UserVO user = (UserVO)session.getAttribute("user");
		List<CodeBoardVO> codeBoardList_ = codeBoardService.getCodeBoardList(user.getUser_id());
		
		PageMaker pageMaker = new PageMaker();
		criteria.setPerPageNum(5);
		criteria.setPage(page);
		pageMaker.setCri(criteria);
		pageMaker.setTotalCount(codeBoardList_.size());
		
		List<CodeBoardVO> codeBoardList = codeBoardService.getCodeBoardList(user.getUser_id(), criteria);
		model.addAttribute("codeBoardList", codeBoardList);
		
		return "code_board_paging";
	}
	
}