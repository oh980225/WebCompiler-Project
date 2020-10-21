package org.dms.web.domain;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Calendar;

public class BoardVO {
	private int board_id;
	private String board_title;
	private String board_content;
	private Timestamp board_upload;
	private String user_id;
	private int problem_id;
	
	public int getBoard_id() {
		return board_id;
	}
	public void setBoard_id(int board_id) {
		this.board_id = board_id;
	}
	public String getBoard_title() {
		return board_title;
	}
	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}
	public String getBoard_content() {
		return board_content;
	}
	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}
	public Timestamp getBoard_upload() {
		return board_upload;
	}
	public void setBoard_upload() {
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		Calendar cal = Calendar.getInstance();
	    String today = null;
	    today = formatter.format(cal.getTime());
	    Timestamp ts = Timestamp.valueOf(today);
	    this.board_upload = ts;
	}
	public void setBoard_upload(Timestamp board_upload) {
		this.board_upload = board_upload;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public int getProblem_id() {
		return problem_id;
	}
	public void setProblem_id(int problem_id) {
		this.problem_id = problem_id;
	}
	
}
