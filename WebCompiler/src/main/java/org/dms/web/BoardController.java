package org.dms.web;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.dms.web.domain.BoardVO;
import org.dms.web.domain.CommentsVO;
import org.dms.web.domain.Criteria;
import org.dms.web.domain.PageMaker;
import org.dms.web.domain.ProblemVO;
import org.dms.web.domain.TestcaseVO;
import org.dms.web.domain.UserVO;
import org.dms.web.service.BoardService;
import org.dms.web.service.CommentsService;
import org.dms.web.service.ProblemService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class BoardController {
	@Autowired(required=true)
	BoardService boardService;
	@Autowired(required=true)
	CommentsService commentsService;
	@Autowired(required=true)
	ProblemService problemService;
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	// free_board.jsp를 불러온다.
	@RequestMapping(value = "/board", method=RequestMethod.GET)
	public String getFreeBoardPage(@ModelAttribute("cri") Criteria cri, Model model, /*Criteria cri,*/ HttpSession session) throws Exception {
		cri.setPerPageNum(10);
		List<BoardVO> bvo= boardService.readBoardList(cri);
		logger.info(cri.getPage() + " " + cri.getPerPageNum());
		UserVO user = (UserVO)session.getAttribute("user");
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(boardService.boardCount());
		
		model.addAttribute("user", user);
		model.addAttribute("board", bvo);
		model.addAttribute("pageMaker", pageMaker);
		
		return "board";
	}
	
	@RequestMapping(value = "/board/insert", method=RequestMethod.GET)
	public String boardInsertGet(Model model, HttpSession session) throws Exception {
		UserVO user = (UserVO)session.getAttribute("user");
		model.addAttribute("user", user);
		return "board_insert";
	}
	
	@RequestMapping(value = "/board/edit", method=RequestMethod.GET)
	public String boardEditGet(@RequestParam("id") int board_id, Model model, HttpSession session) throws Exception {
		UserVO user = (UserVO)session.getAttribute("user");
		model.addAttribute("user", user);
		BoardVO bvo = boardService.readBoard(board_id);
		bvo.setBoard_content(bvo.getBoard_content().replace("<br>", "\r\n"));
		model.addAttribute("board", bvo);
		return "board_edit";
	}
	
	@RequestMapping(value = "/board/delete", method=RequestMethod.GET)
	public String boardDeleteGet(@ModelAttribute("board_id") int board_id, Model model) throws Exception {
		boardService.deleteBoard(board_id);
		return "redirect:/board";
	}
	
	@RequestMapping(value = "/board/edit.do", method=RequestMethod.POST)
	public String boardEditPost(@ModelAttribute("board") BoardVO bvo, Model model) throws Exception {
		logger.info(bvo.getBoard_content());
		bvo.setBoard_content(bvo.getBoard_content().replace("\r\n", "<br>"));
		boardService.updateBoard(bvo);
		return "redirect:/board/" + bvo.getBoard_id();
	}
	
	@RequestMapping(value = "/board/insert.do", method=RequestMethod.POST)
	public String boardInsertPost(@ModelAttribute("board") BoardVO bvo, Model model, HttpSession session) throws Exception {
		  SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
	      Calendar cal = Calendar.getInstance();
	      String today = null;
	      today = formatter.format(cal.getTime());
	      Timestamp ts = Timestamp.valueOf(today);
	      
		bvo.setBoard_upload(ts);
		logger.info("문제번호:" + (int)bvo.getProblem_id());
		
		
		UserVO user = (UserVO) session.getAttribute("user");
		if(user==null) {
			bvo.setUser_id("admin");
		}
		else {
			bvo.setUser_id(user.getUser_id());
		}

		bvo.setBoard_content(bvo.getBoard_content().replace("\r\n", "<br>"));
		boardService.insertBoard(bvo);
		return "redirect:/board";
	}
	@RequestMapping(value="/board/{board_id}", method=RequestMethod.GET)
	public String asdf(@PathVariable("board_id") int board_id,HttpSession session, Model model) throws Exception {		
		BoardVO bvo = boardService.readBoard(board_id);
		if(bvo.getProblem_id() > 0) {
			ProblemVO pvo = problemService.readProblem(bvo.getProblem_id());
			model.addAttribute("problem", pvo);
		}
		
		List<CommentsVO> cvo = commentsService.readCommentList(board_id);
		UserVO user = (UserVO)session.getAttribute("user");
		model.addAttribute("user", user);
		model.addAttribute("comments", cvo);
		model.addAttribute("board", bvo);
		//logger.info("번호: "+ problem_id);
		return "board_detail";
	}

}