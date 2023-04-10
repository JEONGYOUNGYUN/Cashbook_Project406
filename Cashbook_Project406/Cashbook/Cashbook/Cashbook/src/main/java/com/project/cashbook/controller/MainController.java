package com.project.cashbook.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.cashbook.service.MainService;
import com.project.cashbook.vo.UserDataVO;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class MainController {
	@GetMapping("/")
	public String main() {
		return "home";
	}
	
	@GetMapping("/login")
	public String login() {
		return "main/login";
	}
	
	@Autowired
    MainService mainService; 
	
	
	@GetMapping("/register")
	public String register() {
		return "main/registerAccount";
	}
	
	@ResponseBody
	@PostMapping("/userRegister")
	public int userRegister(@RequestBody Map<String, Object> map) {
		log.info("param : " + map);
		return this.mainService.userRegister(map);
	}
	
	/**
	 * 로그인버튼 누르면 아이디와 비밀번호 일치여부 확인 후 로그인
	 * @param map
	 * @return
	 */
	@ResponseBody
	@PostMapping("/userLogin")
	public UserDataVO userLogin(@RequestBody Map<String, Object> map, Model model, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		log.info("param : " + map);
		List<UserDataVO> result = this.mainService.userLogin(map);
		UserDataVO vo = new UserDataVO();
		if(result.size() == 0) {
			result.add(vo);
		}
		session.setAttribute("loginUser", result.get(0));
		model.addAttribute("loginUser", result);
		
		
		return result.get(0);
	}
	
	/**
	 * 회원가입시 아이디 중복체크
	 * @param map
	 * @return
	 */
	@ResponseBody
	@PostMapping("/checkId")
	public List<UserDataVO> checkId(@RequestBody Map<String, Object> map) {
		log.info("param : " + map);
		List<UserDataVO> result = this.mainService.checkId(map);
		return result;
	}
	
	@GetMapping("/list/userReview" )
	public String userReview(Model model) throws ParseException {
		//한국 날짜 셋팅 및 date타입으로 변환
		SimpleDateFormat utc = new SimpleDateFormat("yyyy-MM-dd", Locale.KOREA);
		Date temp = new Date();
		
		
		List<Map<String, Object>> reviewList = this.mainService.reviewList();
	
		for (Map<String, Object> map : reviewList) {
			log.info(map.get("USER_DT").toString());
			temp = utc.parse( map.get("USER_DT").toString()); 
			//Date -> String 으로 타입 변경
			// 오늘날짜
			String curTime = new SimpleDateFormat("yyyyMMdd").format(new Date());
			// 가입일
			String registerDate = new SimpleDateFormat("yyyyMMdd").format(temp);
			
			// 가입일수 계산
			int result = Integer.parseInt(curTime) + 1 - Integer.parseInt(registerDate) ; 
//			
			map.put("revNo", map.get("REV_NO"));
			map.put("revTit", map.get("REV_TIT"));
			map.put("revCnt", map.get("REV_CNT"));
			map.put("userCd", map.get("USER_CD")); 
			map.put("revSt", map.get("REV_ST"));
			map.put("userNik", map.get("USER_NIK"));
			map.put("userId", map.get("USER_ID"));
			map.put("day", result);
			map.remove("REV_NO");
			map.remove("REV_TIT");
			map.remove("REV_CNT");
			map.remove("USER_CD");
			map.remove("REV_ST");
			map.remove("USER_NIK");
			map.remove("USER_ID");
			map.remove("USER_DT");
		}
		
		
//		 UserDataVO vo = new UserDataVO(); 
//
//		 if(request.getSession().getAttribute("loginUser") != null){
//		 	vo = (UserDataVO)request.getSession().getAttribute("loginUser");
//		 }



		
		model.addAttribute("reviewList", reviewList);
		log.info(reviewList.toString());
		return "list/userReview";
	}
	
}
