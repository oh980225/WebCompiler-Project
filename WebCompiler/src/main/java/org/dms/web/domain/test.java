package org.dms.web.domain;

import java.util.ArrayList;

public class test {
	private String high;
	private ArrayList<LowVO> low;
	
	public ArrayList<LowVO> getLow() {
		return low;
	}
	public void setLow(ArrayList<LowVO> low) {
		this.low = low;
	}
	public test() {
		this.setHigh("자료구조");
		low = null;
	}
	public void assign() {
		low = new ArrayList<LowVO>();
	}
	
	public void setLowData() {
		low.add(new LowVO("사과", 1000));
		low.add(new LowVO("당근", 2000));
		low.add(new LowVO("감쟈", 3000));
	}
	public String getHigh() {
		return high;
	}
	public void setHigh(String high) {
		this.high = high;
	}	
}
