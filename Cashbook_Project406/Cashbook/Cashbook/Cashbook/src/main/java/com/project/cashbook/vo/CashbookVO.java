package com.project.cashbook.vo;

//익명게시판
public class CashbookVO {

	private String csboCd;			//가계부코드
	private String csboDt;			//가계부등록일
	private int csboAmt;			//가계부금액
	private String csboCate;		//가계부분류
	private int csboAst;			//가계부자산
	private String csboCnt;			//가계부내용
	private String csboCategory;	//가계부카테고리
	private String userCd;			//사용자코드
	
	private String cbctNm;			//가계부분류명
	private String cateNm; 			//카데코리명
	private String userNik; 		//사용자 닉네임

	public String getCsboCd() {
		return csboCd;
	}

	public void setCsboCd(String csboCd) {
		this.csboCd = csboCd;
	}

	public String getCsboDt() {
		return csboDt;
	}

	public void setCsboDt(String csboDt) {
		this.csboDt = csboDt;
	}

	public int getCsboAmt() {
		return csboAmt;
	}

	public void setCsboAmt(int csboAmt) {
		this.csboAmt = csboAmt;
	}

	public String getCsboCate() {
		return csboCate;
	}

	public void setCsboCate(String csboCate) {
		this.csboCate = csboCate;
	}

	public int getCsboAst() {
		return csboAst;
	}

	public void setCsboAst(int csboAst) {
		this.csboAst = csboAst;
	}

	public String getCsboCnt() {
		return csboCnt;
	}

	public void setCsboCnt(String csboCnt) {
		this.csboCnt = csboCnt;
	}

	public String getCsboCategory() {
		return csboCategory;
	}

	public void setCsboCategory(String csboCategory) {
		this.csboCategory = csboCategory;
	}

	public String getUserCd() {
		return userCd;
	}

	public void setUserCd(String userCd) {
		this.userCd = userCd;
	}

	public String getCateNm() {
		return cateNm;
	}

	public void setCateNm(String cateNm) {
		this.cateNm = cateNm;
	}

	public String getUserNik() {
		return userNik;
	}

	public void setUserNik(String userNik) {
		this.userNik = userNik;
	}

	public String getCbctNm() {
		return cbctNm;
	}

	public void setCbctNm(String cbctNm) {
		this.cbctNm = cbctNm;
	}

	@Override
	public String toString() {
		return "CashbookVO [csboCd=" + csboCd + ", csboDt=" + csboDt + ", csboAmt=" + csboAmt + ", csboCate=" + csboCate
				+ ", csboAst=" + csboAst + ", csboCnt=" + csboCnt + ", csboCategory=" + csboCategory + ", userCd="
				+ userCd + ", cbctNm=" + cbctNm + ", cateNm=" + cateNm + ", userNik=" + userNik + "]";
	}

}
