package com.project.cashbook.vo;

//익명게시판
public class CashbookCateGoryVO {

	private String cbctNo;		//분류코드
	private String userCd;		//사용자코드
	private String cbctNm;		//분류명
	public String getCbctNo() {
		return cbctNo;
	}
	public void setCbctNo(String cbctNo) {
		this.cbctNo = cbctNo;
	}
	public String getUserCd() {
		return userCd;
	}
	public void setUserCd(String userCd) {
		this.userCd = userCd;
	}
	public String getCbctNm() {
		return cbctNm;
	}
	public void setCbctNm(String cbctNm) {
		this.cbctNm = cbctNm;
	}
	@Override
	public String toString() {
		return "CashbookCateGoryVO [cbctNo=" + cbctNo + ", userCd=" + userCd + ", cbctNm=" + cbctNm + "]";
	}
	
	
	
}
