package org.dms.web.domain;

import java.io.Serializable;

public class Human implements Serializable {
	String name;
	String tel;
	String email;
	String birth;
	
	
	
	@Override
	public String toString() {
		return "Human [name=" + name + ", tel=" + tel + ", email=" + email + ", birth=" + birth + "]";
	}

	public Human() {
		// TODO Auto-generated constructor stub
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public Human(String name, String tel, String email, String birth) {
		super();
		this.name = name;
		this.tel = tel;
		this.email = email;
		this.birth = birth;
	}
	
	
}
