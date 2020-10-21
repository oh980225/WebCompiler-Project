package org.dms.web;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.dms.web.domain.CommentsVO;
import org.dms.web.domain.UserVO;
import org.dms.web.service.BoardService;
import org.dms.web.service.CommentsService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/board")
public class RestCommentController {
	
	@Autowired
	private BoardService boardService;
	@Autowired(required=true)
	private CommentsService commentService;
	private static final Logger logger = LoggerFactory.getLogger(RestCommentController.class);
	
	
	@RequestMapping(value="/{board_id}/comment.read", method=RequestMethod.GET)
	public /*List<CommentsVO>*/ Map<String, Object> readCommentList(@PathVariable("board_id") int board_id) throws Exception{
		logger.info("글번호: " + board_id);
		
		Map<String, Object> map = new HashMap<String, Object>();
		List<CommentsVO> cvo = commentService.readCommentList(board_id);
		int comment_count = commentService.count(board_id);
		
		map.put("comment", cvo);
		map.put("comment_count", comment_count);
		// commentService.readCount(board_id);
		return map;
		//return commentService.readCommentList(board_id);
	}

	 @RequestMapping(value="/comment.insert", method=RequestMethod.POST)
	 public String insertComments(@RequestBody CommentsVO comment) throws Exception {
			logger.info("글내용: " + comment.getComments_content());
			
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		      Calendar cal = Calendar.getInstance();
		      String today = null;
		      today = formatter.format(cal.getTime());
		     Timestamp ts = Timestamp.valueOf(today);
			comment.setComments_upload(ts);
			comment.setComments_content(comment.getComments_content().replace("\r\n", "<br>"));
			commentService.insertComment(comment);
			return "success";
			/*
			try {
				commentService.insertComment(comment);
				return new ResponseEntity<>("ReplyRegisterOK", HttpStatus.OK);
				
			} catch(Exception e) {
				return new ResponseEntity<>("ReplyRegisterFAIL", HttpStatus.BAD_REQUEST);
			}*/
	}
	 @RequestMapping(value="/{board_id}/comment.delete/{comments_id}", method=RequestMethod.DELETE)
	 public String deleteComments(@PathVariable("board_id") int board_id, @PathVariable("comments_id") int comments_id) throws Exception{
		commentService.deleteComment(comments_id);
		return "success";
		 
	 }
	
	
	
	/*@RequestMapping(value="/{board_id}/comment.insert", method=RequestMethod.POST)
	public List<CommentsVO> addComment(@RequestBody CommentsVO comment) throws Exception{
		commentService.insertComment(comment);
		
	}*/

}
