package org.dms.web.domain;

public class Criteria {
	private int page;
	private int perPageNum;
	
	public int getPerPageNum() {
		return this.perPageNum;
	}

	public void setPerPageNum(int perPageNum) {
		if(perPageNum <= 0 || perPageNum > 100) {
			this.perPageNum= 10;
			return;
		}
		this.perPageNum=perPageNum;
	}
		
	public Criteria() {
		this.page = 1;
		this.perPageNum = 10;
	}
	
	public void setPage(int page) {
		if(page<=0) {
			this.page = 1;
			return;
		}
		this.page=page;
	}
	public int getPage() {
		return page;
	}
	public int getPageStart() {
		return (this.page - 1) * perPageNum;
	}
	
}
