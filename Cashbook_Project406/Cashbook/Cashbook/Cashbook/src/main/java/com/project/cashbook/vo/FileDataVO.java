package com.project.cashbook.vo;

//익명게시판
public class FileDataVO {

	private String fileCd;		//첨부파일코드
	private String fileRd;		//첨부파일경로
	private String fileNm;		//첨부파일명
	private String fileCate;	//첨부파일분류
	private String fileDt;		//첨부파일등록일
	private String nmNo;		//공지사항코드
	
	public String getFileCd() {
		return fileCd;
	}
	public void setFileCd(String fileCd) {
		this.fileCd = fileCd;
	}
	public String getFileRd() {
		return fileRd;
	}
	public void setFileRd(String fileRd) {
		this.fileRd = fileRd;
	}
	public String getFileNm() {
		return fileNm;
	}
	public void setFileNm(String fileNm) {
		this.fileNm = fileNm;
	}
	public String getFileCate() {
		return fileCate;
	}
	public void setFileCate(String fileCate) {
		this.fileCate = fileCate;
	}
	public String getFileDt() {
		return fileDt;
	}
	public void setFileDt(String fileDt) {
		this.fileDt = fileDt;
	}
	public String getNmNo() {
		return nmNo;
	}
	public void setNmNo(String nmNo) {
		this.nmNo = nmNo;
	}
	@Override
	public String toString() {
		return "FileDataVO [fileCd=" + fileCd + ", fileRd=" + fileRd + ", fileNm=" + fileNm + ", fileCate=" + fileCate
				+ ", fileDt=" + fileDt + ", nmNo=" + nmNo + "]";
	}
	
	
	
}
