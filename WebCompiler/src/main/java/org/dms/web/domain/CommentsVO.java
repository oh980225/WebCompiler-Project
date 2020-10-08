package org.dms.web.domain;

import java.sql.Timestamp;

public class CommentsVO {
	private int comments_id;
	private String comments_content;
	private String user_id;
	private Timestamp comments_upload;
	private int board_id;
	
	public CommentsVO(){
		this.comments_content = "hello";
		this.user_id="admin";
		this.comments_id=20;
	}
	
	public int getComments_id() {
		return comments_id;
	}
	public void setComments_id(int comments_id) {
		this.comments_id = comments_id;
	}
	public String getComments_content() {
		return comments_content;
	}
	public void setComments_content(String comments_content) {
		this.comments_content = comments_content;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public Timestamp getComments_upload() {
		return comments_upload;
	}
	public void setComments_upload(Timestamp timestamp) {
		this.comments_upload = timestamp;
	}
	public int getBoard_id() {
		return board_id;
	}
	public void setBoard_id(int board_id) {
		this.board_id = board_id;
	}

}
