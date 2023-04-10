package com.project.cashbook.vo;

import lombok.Data;

//익명게시판
@Data
public class CashbookVO {

	private String csboCd; // 가계부 코드
	private String csboDt; // 가계부 등록일
	private String csboAmt; // 가계부 금액
	private String csboNm; // 가계부분류
	private String csboAst; // 가계부자산
	private String csboCnt; // 가계부 내용
	private String csboCate; // 가계부카테고리
	private String userCd; // 사용자 코드

	private String cbctNm; // 가계부분류명
	private String cateNm; // 카데코리명
	private String userNik; // 사용자 닉네임
	
	private String astNm; // 요약_자산이름
	private String cateTotal; //요약_자산별 합계

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

	public String getCsboAmt() {
		return csboAmt;
	}

	public void setCsboAmt(String csboAmt) {
		this.csboAmt = csboAmt;
	}

	public String getCsboNm() {
		return csboNm;
	}

	public void setCsboNm(String csboNm) {
		this.csboNm = csboNm;
	}

	public String getCsboAst() {
		return csboAst;
	}

	public void setCsboAst(String csboAst) {
		this.csboAst = csboAst;
	}

	public String getCsboCnt() {
		return csboCnt;
	}

	public void setCsboCnt(String csboCnt) {
		this.csboCnt = csboCnt;
	}

	public String getCsboCate() {
		return csboCate;
	}

	public void setCsboCate(String csboCate) {
		this.csboCate = csboCate;
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

	@Override
	public String toString() {
		return "CashbookVO [csboCd=" + csboCd + ", csboDt=" + csboDt + ", csboAmt=" + csboAmt + ", csboNm=" + csboNm
				+ ", csboAst=" + csboAst + ", csboCnt=" + csboCnt + ", csboCate=" + csboCate + ", userCd=" + userCd
				+ ", cbctNm=" + cbctNm + ", cateNm=" + cateNm + ", userNik=" + userNik + "]";
	}

}
