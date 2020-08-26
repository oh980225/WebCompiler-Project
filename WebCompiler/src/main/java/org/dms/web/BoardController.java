package org.dms.web;

import java.text.SimpleDateFormat;
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
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	// free_board.jsp를 불러온다.
	@RequestMapping(value = "/board")
	public String getFreeBoardPage(Model model, Criteria cri) throws Exception {
		List<BoardVO> bvo= boardService.readBoardList(cri);
		model.addAttribute("board", bvo);
		
		PageMaker pageMaker = new PageMaker();
		cri.setPerPageNum(10);
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(boardService.boardCount());
		
		return "board";

	}
	@RequestMapping(value = "/board/insert")
	public String boardInsertGet(Model model) throws Exception {
		return "board_insert";
	}
	@RequestMapping(value = "/board/edit", method=RequestMethod.GET)
	public String boardEditGet(@RequestParam("id") int board_id, Model model) throws Exception {
		BoardVO bvo = boardService.readBoard(board_id);
		bvo.setBoard_content(bvo.getBoard_content().replace("<br>", "\r\n"));
		model.addAttribute("board", bvo);
		return "board_edit";
	}
	
	@RequestMapping(value = "/board/delete", method=RequestMethod.GET)
	public String boardDeleteGet(@ModelAttribute("board_id") int board_id, Model model) throws Exception {
		boardService.deleteBoard(board_id);
		return "board";
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
		
		SimpleDateFormat format = new SimpleDateFormat ( "yyyy-MM-dd HH:mm:ss");		
		Date time = new Date();		
		String upload = format.format(time);
		bvo.setBoard_upload(upload);
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
	public String asdf(@PathVariable("board_id") int board_id, Model model) throws Exception {		
		BoardVO bvo = boardService.readBoard(board_id);
		List<CommentsVO> cvo = commentsService.readCommentList(board_id);
		
		model.addAttribute("comments", cvo);
		model.addAttribute("board", bvo);
		//logger.info("번호: "+ problem_id);
		return "board_detail";
	}
}
