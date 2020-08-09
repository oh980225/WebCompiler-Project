package org.dms.web.domain;

import java.io.Serializable;

public class MyClass implements Serializable{
	private int number;
	private String name;
	public MyClass() {
		// TODO Auto-generated constructor stub
	}
	public int getNumber() {
		return number;
	}
	public void setNumber(int number) {
		this.number = number;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@Override
	public String toString() {
		return "MyClass [number=" + number + ", name=" + name + "]";
	}
	public MyClass(int number, String name) {
		super();
		this.number = number;
		this.name = name;
	}
	
	
}
