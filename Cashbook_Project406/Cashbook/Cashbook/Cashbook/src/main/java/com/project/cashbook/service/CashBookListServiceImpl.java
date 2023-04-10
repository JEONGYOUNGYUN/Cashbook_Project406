package com.project.cashbook.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.cashbook.mapper.CashBookListMapper;
import com.project.cashbook.vo.CashbookCateGoryVO;
import com.project.cashbook.vo.CashbookVO;

/**
 * @author eunjo
 *
 */
@Service
public class CashBookListServiceImpl implements CashBookListService {

	@Autowired(required = false)
	private CashBookListMapper cashBookListMapper;

	/**
	 * 가계부 목록 조회(일일)
	 */
	@Override
	public List<CashbookVO> selectCashBookList(String userCd) {
		return this.cashBookListMapper.selectCashBookList(userCd);
	}

	/**
	 * 가계부 수입 합계 조회(일일)
	 */
	@Override
	public Integer selectTotalIncome(String userCd) {
		return this.cashBookListMapper.selectTotalIncome(userCd);
	}

	/**
	 * 가계부 지출 합계 조회(일일)
	 */
	@Override
	public Integer selectTotalExpense(String userCd) {
		return this.cashBookListMapper.selectTotalExpense(userCd);
	}
	
	/**
	 * 사용자별 분류 카테고리 가져오기
	 */
	@Override
	public List<CashbookCateGoryVO> selectDetailGroup(String userCd) {
		return this.cashBookListMapper.selectDetailGroup(userCd);
	}
	
	/**
	 * 분류 코드 가져오기
	 * @return
	 */
	@Override
	public String GetDetailGroupCd(Map<String, String> map) {
		return this.cashBookListMapper.GetDetailGroupCd(map);
	}
	
	/**
	 * 가계부 수정
	 * @return
	 */
	@Override
	public int CashbookUpdate(CashbookVO cashbookVO) {
		return this.cashBookListMapper.CashbookUpdate(cashbookVO);
	}

	/**
	 * 가계부 추가
	 * @return
	 */
	@Override
	public int CashbookSave(CashbookVO cashbookVO) {
		return this.cashBookListMapper.CashbookSave(cashbookVO);
	}

	/**
	 * 가계부 삭제
	 * @return
	 */
	@Override
	public int CashbookDelete(CashbookVO cashbookVO) {
		return this.cashBookListMapper.CashbookDelete(cashbookVO);
	}

	/**
	 * 요약조회
	 */
	@Override
	public List<CashbookVO> selectSummary(CashbookVO cashbookVO) {
		return this.cashBookListMapper.selectSummary(cashbookVO);
	}

	/**
	 * 날짜로 검색 후 일일 조회
	 */
	@Override
	public List<CashbookVO> selectbyDate(CashbookVO cashbookVO) {
		return this.cashBookListMapper.selectbyDate(cashbookVO);
	}

	/**
	 * 날짜로 검색 후 수입 합계
	 */
	@Override
	public Integer selectTotalIncomebyDate(CashbookVO cashbookVO) {
		return this.cashBookListMapper.selectTotalIncomebyDate(cashbookVO);
	}

	/**
	 * 날짜로 검색 후 지출 합계
	 */
	@Override
	public Integer selectTotalExpensebyDate(CashbookVO cashbookVO) {
		return this.cashBookListMapper.selectTotalExpensebyDate(cashbookVO);
	}

}
