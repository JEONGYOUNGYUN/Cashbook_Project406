package com.project.cashbook.mapper;

import java.util.List;
import java.util.Map;

import com.project.cashbook.vo.CashbookCateGoryVO;
import com.project.cashbook.vo.CashbookVO;

public interface CashBookListMapper {

	/**
	 * 가계부 목록 조회(일일)
	 * @return
	 */
	public List<CashbookVO> selectCashBookList(String userCd);

	/**
	 * 가계부 수입 합계 조회(일일)
	 * @return
	 */
	public Integer selectTotalIncome(String userCd);

	/**
	 * 가계부 지출 합계 조회(일일)
	 * @return
	 */
	public Integer selectTotalExpense(String userCd);
	
	/**
	 * 사용자별 분류 카테고리 가져오기
	 * @return
	 */
	public List<CashbookCateGoryVO> selectDetailGroup(String userCd);
	
	/**
	 * 분류 코드 가져오기
	 * @return
	 */
	public String GetDetailGroupCd(Map<String, String> map);
	
	/**
	 * 가계부 수정
	 * @return
	 */
	public int CashbookUpdate(CashbookVO cashbookVO);
	
	/**
	 * 가계부 추가
	 * @return
	 */
	public int CashbookSave(CashbookVO cashbookVO);
	
	/**
	 * 가계부 삭제
	 * @return
	 */
	public int CashbookDelete(CashbookVO cashbookVO);
	
	/**
	 * 요약 조회
	 * @param userCd
	 * @return
	 */
	public List<CashbookVO> selectSummary(CashbookVO cashbookVO);
	
	/**
	 * 일일_날짜로 조회
	 * @param cashbookVO
	 * @return
	 */
	public List<CashbookVO> selectbyDate(CashbookVO cashbookVO);
	
	/**
	 * 일일_날짜로 수입 합계 조회
	 * @param cashbookVO
	 * @return
	 */
	public Integer selectTotalIncomebyDate(CashbookVO cashbookVO);

	/**
	 * 일일_날짜로 지출 합계 조회
	 * @param cashbookVO
	 * @return
	 */
	public Integer selectTotalExpensebyDate(CashbookVO cashbookVO);
}
