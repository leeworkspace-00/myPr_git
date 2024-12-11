package com.myaws.myapp.controller;


import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.myaws.myapp.api.MailApi;


@Controller
@RequestMapping(value = "/email/")
public class ApiController {
	@Autowired(required=false)
	private MailApi mailApi; 
	
	
	
	
	@RequestMapping(value = "emailWrite.aws", method=RequestMethod.GET) // 예약신청목록 페이지 페이징, 검색, 정렬, 기능 있음 15개씩만 가져오기
	public String emailWrite() { // 파라미터값은 scri 랑 model을 받는다

		String path = "WEB-INF/email/emailWrite";
		return path;
	}
	
	@RequestMapping(value = "emailWriteAction.aws", method=RequestMethod.POST) // 예약신청목록 페이지 페이징, 검색, 정렬, 기능 있음 15개씩만 가져오기
	public String emailWriteAction(
			@RequestParam("subject") String subject,
			@RequestParam("contents") String contents,
			@RequestParam("senderemail") String senderemail,
			@RequestParam("receiveremail") String receiveremail,	// 메일 작성할 때 필요한 파라미터 값 담아주기 제목 작성자 보내는이 받는이
			HttpServletRequest request, 
			HttpServletResponse response
			) { 
		
		HashMap<String,Object> hm = new HashMap<String,Object>();
		hm.put("subject", subject);
		hm.put("contents", contents);
		hm.put("senderemail", senderemail);
		hm.put("receiveremail", receiveremail);		// 해쉬맵에 메일 내용들을 담고  해쉬맵 자체를 메서드의 파람값으로 넣어준다
		
		mailApi.sendEmail(request, response, hm);		// 들어가야할 메서드 3개 request, response, hm hashmap은 위에서 담아주고 보내야함

		String path = "redirect:/";		// 경로는 메인으로 가도록 
		return path;
	}
	
	
	
	
	

}
