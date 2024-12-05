package com.myaws.myapp.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)	// @RequestMapping의 value가 "/"인데 이것의 의미는
	//프로젝트묭 이후에 아무런 주소없이 실행시키면 해당메소드를 실행해라 라는 뜻
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		// 모델객체에 서버타임이란 이름으로 현재시간을 담은것이고 
		model.addAttribute("serverTime", formattedDate );
		// 리턴값 home은 servlet-context.xml에서 설정한 perffix와 suffix를 앞뒤에 붙여준다
		return "home";
		// /home.jsp 이렇게 리턴됨
	}
	
}
