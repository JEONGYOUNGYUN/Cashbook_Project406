package com.project.cashbook.vo;

//익명게시판
public class ReviewVO {

	private String revNo;		//리뷰코드
	private String revTit;		//리뷰제목
	private String revCnt;		//리뷰내용
	private String userCd;		//사용자코드
	private int revSt;			//리뷰별점
	
	public String getRevNo() {
		return revNo;
	}
	public void setRevNo(String revNo) {
		this.revNo = revNo;
	}
	public String getRevTit() {
		return revTit;
	}
	public void setRevTit(String revTit) {
		this.revTit = revTit;
	}
	public String getRevCnt() {
		return revCnt;
	}
	public void setRevCnt(String revCnt) {
		this.revCnt = revCnt;
	}
	public String getUserCd() {
		return userCd;
	}
	public void setUserCd(String userCd) {
		this.userCd = userCd;
	}
	public int getRevSt() {
		return revSt;
	}
	public void setRevSt(int revSt) {
		this.revSt = revSt;
	}
	@Override
	public String toString() {
		return "ReviewVO [revNo=" + revNo + ", revTit=" + revTit + ", revCnt=" + revCnt + ", userCd=" + userCd
				+ ", revSt=" + revSt + "]";
	}
	
	
	
}
