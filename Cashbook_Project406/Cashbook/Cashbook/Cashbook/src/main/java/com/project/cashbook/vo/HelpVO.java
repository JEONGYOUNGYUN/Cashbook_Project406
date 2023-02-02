package com.project.cashbook.vo;

//익명게시판
public class HelpVO {

	private String helpNo;		//도움말코드
	private String helpDt;		//도움말등록일
	private String helpTit;		//도움말제목
	private String helpCnt;		//도움말내용
	
	public String getHelpNo() {
		return helpNo;
	}
	public void setHelpNo(String helpNo) {
		this.helpNo = helpNo;
	}
	public String getHelpDt() {
		return helpDt;
	}
	public void setHelpDt(String helpDt) {
		this.helpDt = helpDt;
	}
	public String getHelpTit() {
		return helpTit;
	}
	public void setHelpTit(String helpTit) {
		this.helpTit = helpTit;
	}
	public String getHelpCnt() {
		return helpCnt;
	}
	public void setHelpCnt(String helpCnt) {
		this.helpCnt = helpCnt;
	}
	@Override
	public String toString() {
		return "HelpVO [helpNo=" + helpNo + ", helpDt=" + helpDt + ", helpTit=" + helpTit + ", helpCnt=" + helpCnt
				+ "]";
	}
	
	
	
}
