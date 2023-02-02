package com.project.cashbook.vo;

//익명게시판
public class NoticeVO {

	private String noNO;		//공지사항코드
	private String noTit;		//공지사항제목
	private String noCnt;		//공지사항내용
	private String userCd;		//사용자코드
	private int noHit;			//공지사항조회수
	
	public String getNoNO() {
		return noNO;
	}
	public void setNoNO(String noNO) {
		this.noNO = noNO;
	}
	public String getNoTit() {
		return noTit;
	}
	public void setNoTit(String noTit) {
		this.noTit = noTit;
	}
	public String getNoCnt() {
		return noCnt;
	}
	public void setNoCnt(String noCnt) {
		this.noCnt = noCnt;
	}
	public String getUserCd() {
		return userCd;
	}
	public void setUserCd(String userCd) {
		this.userCd = userCd;
	}
	public int getNoHit() {
		return noHit;
	}
	public void setNoHit(int noHit) {
		this.noHit = noHit;
	}
	@Override
	public String toString() {
		return "NoticeVO [noNO=" + noNO + ", noTit=" + noTit + ", noCnt=" + noCnt + ", userCd=" + userCd + ", noHit="
				+ noHit + "]";
	}
	
	
	
}
