package org.dms.web.domain;

public class LowVO {
	private String name;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	private int price;
	
	public LowVO() {
		
	}
	public LowVO(String name, int price) {
		this.name= name;
		this.price=price;
	}
}
