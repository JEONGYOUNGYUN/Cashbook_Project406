package com.project.cashbook.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.cashbook.service.CashBookListService;
import com.project.cashbook.service.MainService;
import com.project.cashbook.vo.CashbookCateGoryVO;
import com.project.cashbook.vo.CashbookVO;
import com.project.cashbook.vo.UserDataVO;

import lombok.extern.slf4j.Slf4j;
import oracle.jdbc.proxy.annotation.Post;

@Slf4j
//@RequestMapping("/list")
@Controller
public class CashBookListController {

	@Autowired(required = false)
	private CashBookListService cashBookListServie;

	@Autowired
	MainService mainService;

	/**
	 * CashBookList.jsp로 이동
	 * 
	 * @param model
	 * @return
	 */
	@GetMapping("/list/CashBookList")
	public String mainTest(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		UserDataVO loginUser = (UserDataVO) session.getAttribute("loginUser");

		List<Map<String, Object>> result = this.mainService.userDetail(loginUser);
		model.addAttribute("userList", result);

		// 사용자 코드 가져오기
		String userCd = loginUser.getUserCd();

		// 가계부 목록 가져오기(일일)
		List<CashbookVO> cashBookList = this.cashBookListServie.selectCashBookList(userCd);

		if (cashBookList == null) {
			log.error("결과 값이 존재하지 않습니다.");
		} else {
			log.info("cashBookList : ", cashBookList);
		}

		// 수입 합계 값 가져오기(일일)
		Integer totalIncome = this.cashBookListServie.selectTotalIncome(userCd);
		if(totalIncome == null) {
			totalIncome = 0;
		}

		// 지출 합계 값 가져오기(일일)
		Integer totalExpense = this.cashBookListServie.selectTotalExpense(userCd);
		if(totalExpense == null) {
			totalExpense = 0;
		}

		// 합계 값
		int TOTAL_AMT = 0;

		// 합계 = 수입 - 지출
		TOTAL_AMT = totalIncome - totalExpense;

		// model에 저장하여 jsp로 이동
		model.addAttribute("cashBookList", cashBookList);
		model.addAttribute("totalIncome", totalIncome);
		model.addAttribute("totalExpense", totalExpense);
		model.addAttribute("TOTAL_AMT", TOTAL_AMT);
		model.addAttribute("userCd", userCd);
		// 사용자별 분류 가져오기
		List<CashbookCateGoryVO> DetailGroup = this.cashBookListServie.selectDetailGroup(userCd);
		model.addAttribute("DetailGroup", DetailGroup);

		// 사용자별 자산 가져오기

		return "list/CashBookList";
	}

	/**
	 * 분류 코드 가져오기
	 * 
	 * @param map
	 * @return
	 */
	@ResponseBody
	@PostMapping("/GetDetailGroupCd")
	public String GetDetailGroupCd(@RequestBody Map<String, String> map) {
		String cbctNo = this.cashBookListServie.GetDetailGroupCd(map);
		log.info("cbctNo : " + cbctNo);
		return cbctNo;

	}

	/**
	 * 가계부 수정
	 * 
	 * @param map
	 * @return
	 */
	@ResponseBody
	@PostMapping("/CashbookUpdate")
	public int CashbookUpdate(@RequestBody CashbookVO cashbookVO) {
		log.info("VO 값: " + cashbookVO);
		int result = this.cashBookListServie.CashbookUpdate(cashbookVO);

		log.info("result : " + result);
		if (result == 1) {
			log.info("업데이트 완료!");
		}
		return result;
	}

	/**
	 * 가계부 저장
	 * 
	 * @param map
	 * @return
	 */
	@ResponseBody
	@PostMapping("/CashbookSave")
	public int CashbookSave(@RequestBody CashbookVO cashbookVO) {
		log.info("VO 값: " + cashbookVO);

		int result = this.cashBookListServie.CashbookSave(cashbookVO);

		if (result == 1) {
			log.info("가계부 추가 완료!");
		}

		return result;
	}

	/**
	 * 가계부 삭제
	 * 
	 * @param map
	 * @return
	 */
	@ResponseBody
	@PostMapping("/CashbookDelete")
	public int CashbookDelete(@RequestBody CashbookVO cashbookVO) {
		log.info("VO : " + cashbookVO);

		int result = this.cashBookListServie.CashbookDelete(cashbookVO);

		if (result == 1) {
			log.info("삭제 완료");
		}

		return result;
	}

	/**
	 * 요약 조회
	 * 
	 * @param request
	 * @return
	 */
	@ResponseBody
	@PostMapping("/selectSummary")
	public List<CashbookVO> selectSummary(@RequestBody CashbookVO cashbookVO, HttpServletRequest request) {
		HttpSession session = request.getSession();
		UserDataVO loginUser = (UserDataVO) session.getAttribute("loginUser");

		// 사용자 코드 가져오기
		String userCd = loginUser.getUserCd();
		cashbookVO.setUserCd(userCd);

		List<CashbookVO> summary = this.cashBookListServie.selectSummary(cashbookVO);

		return summary;
	}

	/**
	 * 날짜 조회값 가져오기
	 * @param cashbookVO
	 * @param request
	 * @return
	 */
	@ResponseBody
	@PostMapping("/selectbyDate")
	public List<CashbookVO> selectbyDate(@RequestBody CashbookVO cashbookVO, HttpServletRequest request) {
		HttpSession session = request.getSession();
		UserDataVO loginUser = (UserDataVO) session.getAttribute("loginUser");
		log.info("loginUser :: " + loginUser);

		// 사용자 코드 가져오기
		String userCd = loginUser.getUserCd();
		cashbookVO.setUserCd(userCd);
		
		List<CashbookVO> cashBookList = this.cashBookListServie.selectbyDate(cashbookVO);
		
		return cashBookList;
	}
	
	@ResponseBody
	@PostMapping("/selectTotalbyDate")
	public Map selectTotalbyDate(@RequestBody CashbookVO cashbookVO, HttpServletRequest request){
		HttpSession session = request.getSession();
		UserDataVO loginUser = (UserDataVO) session.getAttribute("loginUser");
		log.info("loginUser :: " + loginUser);

		// 사용자 코드 가져오기
		String userCd = loginUser.getUserCd();
		cashbookVO.setUserCd(userCd);
		
		// 수입 합계 값 가져오기(일일)
		int totalIncome = this.cashBookListServie.selectTotalIncomebyDate(cashbookVO);

		// 지출 합계 값 가져오기(일일)
		int totalExpense = this.cashBookListServie.selectTotalExpensebyDate(cashbookVO);

		// 합계 값
		int TOTAL_AMT = 0;

		// 합계 = 수입 - 지출
		TOTAL_AMT = totalIncome - totalExpense;
		
		Map<String, Integer> total = new HashMap<String, Integer>();
		total.put("totalIncome", totalIncome);
		total.put("totalExpense", totalExpense);
		total.put("totalAmt", TOTAL_AMT);
				
		return total;
	}
}
