package com.myaws.myapp.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.myaws.myapp.domain.BoardVo;
import com.myaws.myapp.domain.MemberVo;
import com.myaws.myapp.service.MemberService;

@Controller
@RequestMapping(value = "/member/")
public class MemberController { // 컨트롤러 용도의 객체를 생성해달라고 스프링에 요청하기 > @Controller > import

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class); // 디버깅 코드 처럼 찍어보는 코드

	@Autowired
	private MemberService memberService;

	@Autowired
	SqlSession sqlSession;


	@RequestMapping(value = "memberList.aws", method = RequestMethod.GET)
	public String memberList(Model model) {
		ArrayList<MemberVo> alist = memberService.memberSelectAll();

		model.addAttribute("alist", alist);

		return "WEB-INF/member/memberList";
	}
	@RequestMapping(value = "memberJoin.aws", method = RequestMethod.GET) 
		public String memberJoin() {
		return "WEB-INF/member/memberJoin";

	}
	@RequestMapping(value = "mainPage.aws", method = RequestMethod.GET) 
		public String mainPage() {
		return "WEB-INF/member/mainPage";

	}
	/*
	 * @RequestMapping(value = "myPage.aws", method = RequestMethod.GET) public
	 * String myPage(@RequestParam("midx") int midx, HttpServletRequest request,
	 * Model model) { MemberVo mv = memberService.myPageShow(midx);
	 * model.addAttribute("mv", mv); //System.out.println( "회원번호 : " +mv.getMidx());
	 * String path = "WEB-INF/member/myPage"; return path; }
	 */
	
	
	
	

	
	
	
	
	
	@RequestMapping(value = "memberLogin.aws", method = RequestMethod.GET) 
		public String memberLogin() {
		return "WEB-INF/member/memberLogin";
	}
	
	@RequestMapping(value = "profilePage.aws", method = RequestMethod.GET) 
	public String profilePage() {
	return "WEB-INF/member/profilePage";
}
	
	
	@RequestMapping(value = "memberLoginAction.aws", method = RequestMethod.POST)
	public String memberLoginAction(@RequestParam("memberid") String memberid,
	                                @RequestParam("memberpwd") String memberpwd,
	                                RedirectAttributes rttr,
	                                HttpSession session) {

	    MemberVo mv = memberService.memberLoginCheck(memberid);
	    String path = ""; // path 초기화

	    if (mv != null) { // 객체값이 널이 아니면 => mv 에 뭐라도 담았으면
	        String reservedPwd = mv.getMemberpwd(); // 저장된 비밀번호 가져오기

	        // Directly compare the plain text passwords
	        if (memberpwd.equals(reservedPwd)) { // 암호화 없이 직접 비교
	            rttr.addAttribute("midx", mv.getMidx());
	            rttr.addAttribute("memberId", mv.getMemberid());
	            rttr.addAttribute("memberName", mv.getMembername());

	            // 주소를 메인페이지로 이동
	            path = "redirect:/member/mainPage.aws"; // 로그인 성공 시 메인 페이지로 이동

	        } else { // 비밀번호가 틀린 경우
	        	rttr.addAttribute("midx", "");
	            rttr.addAttribute("memberId", "");
	            rttr.addAttribute("memberName", "");
	            rttr.addFlashAttribute("msg", "아이디/비밀번호를 확인해주세요");
	            path = "redirect:/member/memberLogin.aws";
	        }

	    } else {
	    	rttr.addAttribute("midx", "");
            rttr.addAttribute("memberId", "");
            rttr.addAttribute("memberName", "");
	        rttr.addFlashAttribute("msg", "해당하는 아이디가 없습니다");
	        path = "redirect:/member/memberLogin.aws";
	    }
	    return path; // path 값 리턴
	}
	
	
	
	// 회원가입 동작 매핑하기
	@RequestMapping(value = "memberJoinAction.aws", method = RequestMethod.POST)
	public String memberJoinAction(MemberVo mv) {
	    logger.info("memberJoinAction 들어옴");

	    // 회원정보 저장
	    int value = memberService.memberInsert(mv);
	    logger.info("쿼리 실행 확인 value: " + value);

	    String path;
	    if (value == 1) {
	        path = "redirect:/member/mainPage.aws";
	    } else {
	        path = "redirect:/member/memberJoin.aws";
	    }
	    
	    return path;
	}
		@RequestMapping(value = "memberLogout.aws", method = RequestMethod.GET) // 로그아웃 동작 HttpSession session 매개변수
		public String memberLogout(HttpSession session) {
			// logger.info("memberLogout 들어옴");

			session.removeAttribute("midx");
			session.removeAttribute("memberId");
			session.removeAttribute("memberName");
			session.invalidate(); // 세션값 완전 초기화 = 초기화 되면 세션값이 없으므로 로그아웃되는것

			return "redirect:/";
		}
		
		
	
	
}