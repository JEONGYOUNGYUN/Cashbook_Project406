package com.project.cashbook.vo;

//익명게시판
public class UserDataVO {

	private String userCd;		//사용자코드
	private String userId;		//사용자아이디
	private String userPw;		//사용자패스워드
	private String userNik;		//사용자닉네임
	private String userDt;		//사용자등록일
	
	public String getUserCd() {
		return userCd;
	}
	public void setUserCd(String userCd) {
		this.userCd = userCd;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPw() {
		return userPw;
	}
	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}
	public String getUserNik() {
		return userNik;
	}
	public void setUserNik(String userNik) {
		this.userNik = userNik;
	}
	public String getUserDt() {
		return userDt;
	}
	public void setUserDt(String userDt) {
		this.userDt = userDt;
	}
	@Override
	public String toString() {
		return "UserDataVO [userCd=" + userCd + ", userId=" + userId + ", userPw=" + userPw + ", userNik=" + userNik
				+ ", userDt=" + userDt + "]";
	}
	
	
	
}
