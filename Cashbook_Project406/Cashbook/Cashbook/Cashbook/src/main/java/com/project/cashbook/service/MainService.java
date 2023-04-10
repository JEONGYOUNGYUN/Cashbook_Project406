package com.project.cashbook.service;

import java.util.List;
import java.util.Map;

import com.project.cashbook.vo.UserDataVO;


public interface MainService {
	
	
	public List<Map<String, Object>> userDetail(UserDataVO vo);
	
	public int userRegister(Map<String, Object> map);
	
	public List<UserDataVO> userLogin(Map<String, Object> map);
	
	public List<UserDataVO> checkId(Map<String, Object> map);
	
	public List<Map<String, Object>> reviewList();
	
}
