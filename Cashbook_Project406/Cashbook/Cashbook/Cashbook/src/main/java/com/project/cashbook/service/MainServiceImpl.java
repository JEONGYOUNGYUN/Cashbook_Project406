package com.project.cashbook.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.cashbook.mapper.MainMapper;
import com.project.cashbook.vo.UserDataVO;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class MainServiceImpl implements MainService {
	@Autowired
	MainMapper mainMapper;
	
	@Override
	public List<Map<String, Object>> userDetail(UserDataVO vo) {
		return this.mainMapper.userDetail(vo);
	}

	@Override
	public int userRegister(Map<String, Object> map) {
		return this.mainMapper.userRegister(map);
	}

	@Override
	public List<UserDataVO> userLogin(Map<String, Object> map) {
		return this.mainMapper.userLogin(map);
	}

	@Override
	public List<UserDataVO> checkId(Map<String, Object> map) {
		return this.mainMapper.checkId(map);
	}

	@Override
	public List<Map<String, Object>> reviewList() {
		return this.mainMapper.reviewList();
	}


}
