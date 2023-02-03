package com.project.cashbook.vo;

//익명게시판
public class ReplyVO {

	private String repNo;		//댓글코드
	private String userCd;		//사용자코드
	private String repCnt;		//댓글내용
	private String noNo;		//공지사항코드
	
	public String getRepNo() {
		return repNo;
	}
	public void setRepNo(String repNo) {
		this.repNo = repNo;
	}
	public String getUserCd() {
		return userCd;
	}
	public void setUserCd(String userCd) {
		this.userCd = userCd;
	}
	public String getRepCnt() {
		return repCnt;
	}
	public void setRepCnt(String repCnt) {
		this.repCnt = repCnt;
	}
	public String getNoNo() {
		return noNo;
	}
	public void setNoNo(String noNo) {
		this.noNo = noNo;
	}
	@Override
	public String toString() {
		return "ReplyVO [repNo=" + repNo + ", userCd=" + userCd + ", repCnt=" + repCnt + ", noNo=" + noNo + "]";
	}
	
	
	
}
