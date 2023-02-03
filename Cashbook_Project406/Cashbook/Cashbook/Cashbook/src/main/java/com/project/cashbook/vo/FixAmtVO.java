package com.project.cashbook.vo;

//익명게시판
public class FixAmtVO {

	private String fxaCd;		//자주사용코드
	private String fxaDt;		//자주사용등록일
	private int fxaAmt;			//자주사용금액
	private String fxaCate;		//자주사용분류
	private int fxaAst;			//자주사용자산
	private String fxaCnt;		//자주사용내용
	private String fxa;			//자주사용카테고리
	private String userCd;		//사용자코드
	
	public String getFxaCd() {
		return fxaCd;
	}
	public void setFxaCd(String fxaCd) {
		this.fxaCd = fxaCd;
	}
	public String getFxaDt() {
		return fxaDt;
	}
	public void setFxaDt(String fxaDt) {
		this.fxaDt = fxaDt;
	}
	public int getFxaAmt() {
		return fxaAmt;
	}
	public void setFxaAmt(int fxaAmt) {
		this.fxaAmt = fxaAmt;
	}
	public String getFxaCate() {
		return fxaCate;
	}
	public void setFxaCate(String fxaCate) {
		this.fxaCate = fxaCate;
	}
	public int getFxaAst() {
		return fxaAst;
	}
	public void setFxaAst(int fxaAst) {
		this.fxaAst = fxaAst;
	}
	public String getFxaCnt() {
		return fxaCnt;
	}
	public void setFxaCnt(String fxaCnt) {
		this.fxaCnt = fxaCnt;
	}
	public String getFxa() {
		return fxa;
	}
	public void setFxa(String fxa) {
		this.fxa = fxa;
	}
	public String getUserCd() {
		return userCd;
	}
	public void setUserCd(String userCd) {
		this.userCd = userCd;
	}
	@Override
	public String toString() {
		return "FixAmtVO [fxaCd=" + fxaCd + ", fxaDt=" + fxaDt + ", fxaAmt=" + fxaAmt + ", fxaCate=" + fxaCate
				+ ", fxaAst=" + fxaAst + ", fxaCnt=" + fxaCnt + ", fxa=" + fxa + ", userCd=" + userCd + "]";
	}
	
	
	
	
}
