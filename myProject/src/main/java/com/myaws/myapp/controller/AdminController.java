package com.myaws.myapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/admin/")
public class AdminController {
	
	@RequestMapping(value = "adminPage.aws") // 예약신청서 작성하는 페이지 보여주기 기능없음
	public String adminPage() {
		String path = "WEB-INF/admin/adminPage";
		return path;
	}

}
