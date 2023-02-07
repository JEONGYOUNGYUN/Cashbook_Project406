package com.project.cashbook.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.cashbook.mapper.CashBookListMapper;
import com.project.cashbook.vo.CashbookVO;

@Service
public class CashBookListServiceImpl implements CashBookListService {

	@Autowired
	private CashBookListMapper cashBookListMapper;

	/**
	 * 가계부 목록 조회(일일)
	 */
	@Override
	public List<CashbookVO> selectCashBookList() {
		return this.cashBookListMapper.selectCashBookList();
	}

	/**
	 * 가계부 수입 합계 조회(일일)
	 */
	@Override
	public int selectTotalIncome() {
		return this.cashBookListMapper.selectTotalIncome();
	}

	/**
	 * 가계부 지출 합계 조회(일일)
	 */
	@Override
	public int selectTotalExpense() {
		return this.cashBookListMapper.selectTotalExpense();
	}

}
