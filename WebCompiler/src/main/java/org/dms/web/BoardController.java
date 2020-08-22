package org.dms.web;

import org.dms.web.domain.BoardVO;
import org.dms.web.service.BoardService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BoardController {
	@Autowired(required=true)
	BoardService boardService;
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	// free_board.jsp를 불러온다.
	@RequestMapping(value = "/board")
	public String getFreeBoardPage(Model model) throws Exception {
		return "board";

	}
	@RequestMapping(value = "/board/insert")
	public String boardInsertGet(Model model) throws Exception {
		return "board_insert";
	}
	@RequestMapping(value = "/board/insert.do")
	public String boardInsertPost(@ModelAttribute("board") BoardVO bvo, Model model) throws Exception {
		logger.info("게시글 내용:" + bvo.getBoard_content());
		boardService.insertBoard(bvo);
		return "redirect:/board";
	}
}
