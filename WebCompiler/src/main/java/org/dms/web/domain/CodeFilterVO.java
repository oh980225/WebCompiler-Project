package org.dms.web.domain;

public class CodeFilterVO {
	private ProblemVO pvo;
	public ProblemVO getPvo() {
		return pvo;
	}
	public void setPvo(ProblemVO pvo) {
		this.pvo = pvo;
	}
	public CodeVO getCvo() {
		return cvo;
	}
	public void setCvo(CodeVO cvo) {
		this.cvo = cvo;
	}
	private CodeVO cvo;
}
