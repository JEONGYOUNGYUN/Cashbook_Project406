package com.project.cashbook.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.cashbook.service.CashBookListService;
import com.project.cashbook.vo.CashbookVO;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/list")
@Slf4j
public class CashBookListController {

	@Autowired
	private CashBookListService cashBookListServie;

	/**
	 * CashBookList.jsp로 이동
	 * 
	 * @param model
	 * @return
	 */
	@GetMapping("/CashBookList")
	public String mainTest(Model model) {
		// 가계부 목록 가져오기(일일)
		List<CashbookVO> cashBookList = this.cashBookListServie.selectCashBookList();
		log.info("cashBookList : ", cashBookList);

		// 수입 합계 값 가져오기(일일)
		int totalIncome = this.cashBookListServie.selectTotalIncome();
		log.info("totalIncome : ", totalIncome);

		// 지출 합계 값 가져오기(일일)
		int totalExpense = this.cashBookListServie.selectTotalExpense();
		log.info("totalExpense : ", totalExpense);

		// 합계 값
		int TOTAL_AMT = 0;

		// 합계 = 수입 - 지출
		TOTAL_AMT = totalIncome - totalExpense;

		// model에 저장하여 jsp로 이동
		model.addAttribute("cashBookList", cashBookList);
		model.addAttribute("totalIncome", totalIncome);
		model.addAttribute("totalExpense", totalExpense);
		model.addAttribute("TOTAL_AMT", TOTAL_AMT);

		return "list/CashBookList";
	}
}
