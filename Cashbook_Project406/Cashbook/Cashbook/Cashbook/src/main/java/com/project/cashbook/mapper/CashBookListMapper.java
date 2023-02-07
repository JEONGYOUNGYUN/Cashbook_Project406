package com.project.cashbook.mapper;

import java.util.List;

import com.project.cashbook.vo.CashbookVO;

public interface CashBookListMapper {

	/**
	 * 가계부 목록 조회(일일)
	 * @return
	 */
	public List<CashbookVO> selectCashBookList();

	/**
	 * 가계부 수입 합계 조회(일일)
	 * @return
	 */
	public int selectTotalIncome();

	/**
	 * 가계부 지출 합계 조회(일일)
	 * @return
	 */
	public int selectTotalExpense();

}
