package org.dms.web.domain;

public class CommentsVO {
	private int comments_id;
	private String comments_content;
	private String user_id;
	private String comments_upload;
	private int board_id;
	
	
	
	
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
	public String getComments_upload() {
		return comments_upload;
	}
	public void setComments_upload(String comments_upload) {
		this.comments_upload = comments_upload;
	}
	public int getBoard_id() {
		return board_id;
	}
	public void setBoard_id(int board_id) {
		this.board_id = board_id;
	}

}
