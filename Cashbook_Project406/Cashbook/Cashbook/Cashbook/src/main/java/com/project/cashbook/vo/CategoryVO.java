package com.project.cashbook.vo;

//익명게시판
public class CategoryVO {

	private String cateCd;		//카테고리코드
	private String cateNm;		//카테고리명
	
	public String getCateCd() {
		return cateCd;
	}
	public void setCateCd(String cateCd) {
		this.cateCd = cateCd;
	}
	public String getCateNm() {
		return cateNm;
	}
	public void setCateNm(String cateNm) {
		this.cateNm = cateNm;
	}
	@Override
	public String toString() {
		return "CategoryVO [cateCd=" + cateCd + ", cateNm=" + cateNm + "]";
	}
	
	
	
}
