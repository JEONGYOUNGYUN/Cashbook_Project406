package com.project.cashbook.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {

	@GetMapping("/")
	public String main() {
		return "home";
	}
	
	@GetMapping("/list/CashBookList")
	public String mainTest() {
		return "list/CashBookList";
	}
}
