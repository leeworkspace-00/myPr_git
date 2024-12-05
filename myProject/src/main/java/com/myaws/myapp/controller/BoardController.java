package com.myaws.myapp.controller;


import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myaws.myapp.domain.BoardVo;
import com.myaws.myapp.domain.PageMaker;
import com.myaws.myapp.domain.searchCriteria;
import com.myaws.myapp.service.BoardService;
import com.myaws.myapp.util.MediaUtils;
import com.myaws.myapp.util.UploadFileUtiles;
import com.myaws.myapp.util.UserIp;

@Controller
@RequestMapping(value="/board/")
public class BoardController {
	@Autowired(required=false)		// 널값도 허용하겠다는 의미
	private UserIp userIp;
	
	@Autowired(required=false)
	private BoardService boardService;
	// 객체자동 생성 
	// BoardService boardService 생성

	@Autowired(required=false)
	private PageMaker pm;
	// 객체자동 생성 
	// PageMaker pm 생성
	// 전역으로 사용
	
	@Resource(name = "uploadPath")		//@Autowired와  @Resource의 차이 : 객체의 참조변수의 이름을 적어줘야함 이름은 sevlet-context에 있음
	private String uploadPath;
	
//----------------예약페이지관련 컨트롤러----------------
	@RequestMapping(value="reservationWrite.aws")	//예약신청서 작성하는 페이지 보여주기 기능없음
	public String reservationWrite() {	
		String path = "WEB-INF/board/reservationWrite"; 
		return path;
	}
// 작성 기능동작 컨트롤러
	@RequestMapping(value = "reservationWriteAction.aws", method = RequestMethod.POST)	// 예약신청서 작성 동작하기 
	public String reservationWriteAction(BoardVo bv) {
		/* 디버깅 코드 
		 * System.out.println("작성자 "+bv.getWriter());
		 * System.out.println("작성일자 "+bv.getWriteday());
		 * System.out.println("게시글종류 "+bv.getBoardkind());
		 * System.out.println("주소 "+bv.getAddr());
		 * System.out.println("회원번호 "+bv.getMidx());
		 * System.out.println("이용날짜 "+bv.getUseday());
		 * System.out.println("이용서비스 "+bv.getServicekind());
		 * System.out.println("요청사항 "+bv.getRequest());
		 * System.out.println("경계도 "+bv.getPetborder());
		 * System.out.println("전화번호 "+bv.getPhone());
		 */

		int value = boardService.reservationInsert(bv);	//예약정보 삽입하기 
		
		String path = "";
		if (value == 2) {
			path = "redirect:/board/reservationList.aws";	// 성공하면 목록 보여주기
		} else if (value == 0) {
			path = "redirect:/board/reservationWrite.aws";	// 실패하면 다시 작성하기 페이지
		}	
		return path;

	}

	@RequestMapping(value="reservationList.aws")	 //예약신청목록 페이지 페이징, 검색, 정렬, 기능 있음 15개씩만 가져오기
	public String reservationList(searchCriteria scri, Model model) {	 // 파라미터값은 scri 랑 model을 받는다
		int cnt = boardService.reservationTotalCount(scri);
		pm.setScri(scri);
		pm.setTotalCount(cnt);
		ArrayList<BoardVo> blist =  boardService.reservationSelectAll(scri);
		model.addAttribute("blist", blist);		
		model.addAttribute("pm", pm);	
		String path = "WEB-INF/board/reservationList"; 
		return path;
	}
	
	
	@RequestMapping(value="reservationContents.aws")			// 글 내용 가상경로 실행시 동작하는 기능 조회수++ 글 보여주기 기능 
	public String reservatonContents(
			@RequestParam("bidx") int bidx,
			Model model) {	
		
		boardService.viewCntUpdate(bidx);		// 조회수 증가 메서드 불러와서 사용
		BoardVo bv = boardService.boardSelectOne(bidx);		// 글 내용 1개만 가져와서 보여주는 메서드 
		model.addAttribute("bv", bv); // 모델에 bv담아와서 속성값 주기 

		String path = "WEB-INF/board/reservationContents"; 		// 메서드 모두 실행 후  결과는 내용페이지에서 보여준다
		return path;
	}
	
	

	
	// -----------------예약 컨트롤러 끝---------------------
	

	@RequestMapping(value="reviewList.aws")	 //리뷰목록 페이지 페이징, 검색, 정렬, 기능 있음 15개씩만 가져오기
	public String reviewList(searchCriteria scri, Model model) {	 // 파라미터값은 scri 랑 model을 받는다
		int cnt = boardService.reviewTotalCount(scri);
		pm.setScri(scri);
		pm.setTotalCount(cnt);
		ArrayList<BoardVo> rlist =  boardService.reviewSelectAll(scri);
		model.addAttribute("rlist", rlist);		
		model.addAttribute("pm", pm);	
		String path = "WEB-INF/board/reviewList"; 
		return path;
	}
	
	
	@RequestMapping(value="reviewWrite.aws")	//리뷰작성 페이지 보여주기 기능없음
	public String reviewWrite() {	
		String path = "WEB-INF/board/reviewWrite"; 
		return path;
	}
	@RequestMapping(value = "reviewWriteAction.aws", method = RequestMethod.POST)
	public String reviewWriteAction(BoardVo bv, 
			@RequestParam("attachfile")MultipartFile attachfile, // 파일은 @RequestParam("filename")MultipartFile filename)
			HttpSession session, // 회원번호 꺼내고 아이디 꺼내려고 세션값 가져옴
			HttpServletRequest request,		// 요청값 > 회원번호 가져오기 위해서 세션 생성
			RedirectAttributes rttr		// sendredirect 로 화면 보여주기 위해서  생성
			)throws IOException, Exception{	
		MultipartFile file = attachfile;// 새로운 변수에 담아서 이름을 변경해줌 ++ attachfile로 변경해서 vo에 있는 파일네임과 충돌방지 
		String uploadedFileName = "";
		if(! file.getOriginalFilename().equals("")) {		// ! >> 존재한다면(.equals("")없는게 아니라면)
			
			uploadedFileName = UploadFileUtiles.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes());// 업로드 위치 파일 이름 
			// 빨간줄 뜨면 throws 로 해결 위에 자동 생성 
			// BoardVo 에 가서 	private String uploadedFilename;추가하고 getter,setter 생성해주기
			System.out.println("파일이름 : " + uploadedFileName);
		}
		
		String midx = request.getSession().getAttribute("midx").toString();
		System.out.println("회원번호 : " + midx);
		int midx_int = Integer.parseInt(midx);
		
		
		String ip = userIp.getUserIp(request);		
		
		bv.setUploadedFilename(uploadedFileName);
		bv.setMidx(midx_int);
		bv.setIp(ip);
		
		
		String path = "";
		int value = boardService.reviewInsert(bv);
		//System.out.println("value : " + value);
		
		
		if(value == 2) { // 성공하면 목록 보여주고
			path = "redirect:/board/reviewList.aws";
		}else {			// 실패하면 다시 쓰기 페이지 보여주기 
			
			rttr.addFlashAttribute("msg","입력이 잘못되었습니다");
			path = "redirect:/board/reviewWrite.aws";
		}
		
		return path;	// 메서드 모두 실행하고 경로로 가기


} 
	
	
	
	
	
//================= 리뷰 내용 보여주기 	
	@RequestMapping(value="reviewContents.aws")			// 리뷰제목 클릭시 작동
	public String reviewContents(
			@RequestParam("bidx") int bidx,
			Model model) {	
		
		boardService.viewCntUpdate(bidx);		// 조회수 증가 메서드 불러와서 사용
		BoardVo bv = boardService.boardSelectOne(bidx);		// 글 내용 1개만 가져와서 보여주는 메서드 
		model.addAttribute("bv", bv); // 모델에 bv담아와서 속성값 주기 

		String path = "WEB-INF/board/reviewContents"; 
		return path;
	}
// =========================================================
	
	@RequestMapping(value="askList.aws")	 //예약신청목록 페이지 페이징, 검색, 정렬, 기능 있음 15개씩만 가져오기
	public String askList(searchCriteria scri, Model model) {	 // 파라미터값은 scri 랑 model을 받는다
		int cnt = boardService.askTotalCount(scri);
		pm.setScri(scri);
		pm.setTotalCount(cnt);
		ArrayList<BoardVo> alist =  boardService.askSelectAll(scri);
		model.addAttribute("alist", alist);		
		model.addAttribute("pm", pm);	
		String path = "WEB-INF/board/askList"; 
		return path;
	}
	
	
	
	@RequestMapping(value="askWrite.aws")
	public String askWrite() {	
		String path = "WEB-INF/board/askWrite"; 
		return path;
	}
	
	@RequestMapping(value="askWriteAction.aws")// 글쓰기 동작 메서드
	public String askWriteAction(
			BoardVo bv,
			@RequestParam("attachfile")MultipartFile attachfile,
			HttpSession session,
			HttpServletRequest request,
			RedirectAttributes rttr
			) throws IOException, Exception{	
				MultipartFile file = attachfile;// 새로운 변수에 담아서 이름을 변경해줌 ++ attachfile로 변경해서 vo에 있는 파일네임과 충돌방지 
				String uploadedFileName = "";
				if(! file.getOriginalFilename().equals("")) {
					
					uploadedFileName = UploadFileUtiles.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes());// 업로드 위치 파일 이름 
					// 빨간줄 뜨면 throws 로 해결 위에 자동 생성 
					// BoardVo 에 가서 	private String uploadedFilename;추가하고 getter,setter 생성해주기
					
				}
				
				String midx = request.getSession().getAttribute("midx").toString();
				int midx_int = Integer.parseInt(midx);
				
				
				String ip = userIp.getUserIp(request);		
				
				bv.setUploadedFilename(uploadedFileName);
				bv.setMidx(midx_int);
				bv.setIp(ip);
				
				
				String path = "";
				int value = boardService.askInsert(bv);
				
				
				if(value == 2) { // 성공하면 목록 보여주고
					path ="redirect:/board/askList.aws";
				}else {			// 실패하면 다시 쓰기 페이지 보여주기 
					
					rttr.addFlashAttribute("msg","입력이 잘못되었습니다");
					path = "redirect:/board/askWrite.aws";
				}
				
		return path;	// 메서드 모두 실행하고 경로로 가기
		
		
	}
	
	@RequestMapping(value="askContents.aws")			// 글 내용 가상경로 실행시 동작하는 기능 조회수++ 글 보여주기 기능 
	public String askContents(
			@RequestParam("bidx") int bidx,
			Model model) {	
		
		boardService.viewCntUpdate(bidx);		// 조회수 증가 메서드 불러와서 사용
		BoardVo bv = boardService.boardSelectOne(bidx);		// 글 내용 1개만 가져와서 보여주는 메서드 
		model.addAttribute("bv", bv); // 모델에 bv담아와서 속성값 주기 

		String path = "WEB-INF/board/askContents"; 		// 메서드 모두 실행 후  결과는 내용페이지에서 보여준다
		return path;
	}

	 
	
	
	
	
	
	// 시터신청 목록 페이지
	@RequestMapping(value="levelupList.aws")	//요금안내 페이지 기능 없음 
	public String levelupList(searchCriteria scri, Model model) {	 // 파라미터값은 scri 랑 model을 받는다
		int cnt = boardService.askTotalCount(scri);
		pm.setScri(scri);
		pm.setTotalCount(cnt);
		ArrayList<BoardVo> llist =  boardService.levelupSelectAll(scri);
		model.addAttribute("llist", llist);		
		model.addAttribute("pm", pm);	
		String path = "WEB-INF/board/levelupList"; 
		return path;
	}
	
	
	@RequestMapping(value="levelupWrite.aws")	//요금안내 페이지 기능 없음 
	public String levelupWrite() {	
		String path = "WEB-INF/board/levelupWrite"; 
		return path;
	}

	@RequestMapping(value="levelupWriteAction.aws")// 글쓰기 동작 메서드
	public String levelupWriteAction(BoardVo bv) {
		int value = boardService.levelupInsert(bv);	//예약정보 삽입하기 
		
		String path = "";
		if (value == 2) {
			path ="redirect:/board/levelupList.aws";	// 성공하면 목록 보여주기
		} else if (value == 0) {
			path = "redirect:/board/levelupWrite.aws";	// 실패하면 다시 작성하기 페이지
		}	
		return path;

	}
	
	
	
	
	@RequestMapping(value="levelupContents.aws")			// 리뷰제목 클릭시 작동
	public String levelupContents(
			@RequestParam("bidx") int bidx,
			Model model) {	
		
		boardService.viewCntUpdate(bidx);		// 조회수 증가 메서드 불러와서 사용
		BoardVo bv = boardService.boardSelectOne(bidx);		// 글 내용 1개만 가져와서 보여주는 메서드 
		model.addAttribute("bv", bv); // 모델에 bv담아와서 속성값 주기 

		String path = "WEB-INF/board/levelupContents"; 
		return path;
	}
	
	//================ 리뷰수정=======================
	@RequestMapping(value="reviewModify.aws")
	public String reviewModify(@RequestParam("bidx") int bidx,Model model) {
		
		BoardVo bv = boardService.boardSelectOne(bidx);		
		model.addAttribute("bv", bv);	
		
		String path="WEB-INF/board/reviewModify";
		return path;
	}
	
	@RequestMapping(value="reviewModifyAction.aws")
	public String reviewModifyAction(
			BoardVo bv,		// 제목 내용 작성자 비밀번호 bv에 담아오기
			@RequestParam("attachfile") MultipartFile attachfile,	//첨부파일은 멀티파트로 담아오기 
			HttpServletRequest request,		// 세션 요청하기 위한 객체 생성 > 회원번호 담을 것
			RedirectAttributes rttr) 		// 리다이렉트 속성값 담기 위한 객체 생성
					throws Exception {
		
			int value=0;
		
			MultipartFile file = attachfile;
			String uploadedFileName="";
			
			if (!file.getOriginalFilename().equals("")) {		// 원본파일 이름이 있으면	
				uploadedFileName = UploadFileUtiles.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes());	//uploadedFileName에 파일 정보들 담기
			}
			
			String midx = request.getSession().getAttribute("midx").toString();
			int midx_int = Integer.parseInt(midx);	// 회원번호 담기		
			String ip = userIp.getUserIp(request);			// 아이피 담기 
			
			bv.setUploadedFilename(uploadedFileName);   // bv 에 파일이름 세팅
			bv.setMidx(midx_int);						// 회원번호 세팅
			bv.setIp(ip);								// ip 정보 세팅
			
		
			value = boardService.reviewUpdate(bv);		// 서비스에서 구현한 업데이트 메서드 안에 세팅한 파일이름, 회원번호, 아이피 정보 담아서 사용하기 
		System.out.println("value  : " + value);
			String path="";
			if (value==1) {		// 성공하면
				path="redirect:/board/reviewContents.aws?bidx="+bv.getBidx();	// 글번호 달고 글 내용보여주기
				
			}else {
				rttr.addFlashAttribute("msg", "실패");
				path="redirect:/board/reviewModify.aws?bidx="+bv.getBidx();	// 실패하면 글번호 가지고 다시 수정하기 페이지로 보내기
				
			}		
		
			return path;		// 경로 리턴
	}	
	
	
	
	
	//==================== 삭제기능=====================
	@RequestMapping(value="boardDelete.aws")			// 여기는 메서드 없음		
	public String boardDelete(
			@RequestParam("bidx") int bidx,
			Model model) {	
		model.addAttribute("bidx", bidx);
		String path = "WEB-INF/board/boardDelete"; 		
		return path;
	}
		
	
	@RequestMapping(value="boardDeleteAction.aws", method = RequestMethod.POST)		// 리뷰 삭제기능
	public String boardDeleteAction(
			@RequestParam("bidx") int bidx,
			@RequestParam("pwd") String pwd,
			RedirectAttributes rttr,
			HttpSession session) {	
		
		
		int midx = Integer.parseInt(session.getAttribute("midx").toString());
		System.out.println("midx : " + midx);
		int value = boardService.boardDeleteAction(bidx, midx, pwd);
		System.out.println("value : " + value);
		
		String path = "";
		
	
			if(value ==1) {
				path = "redirect:/board/reviewList.aws";		// 성공하면 리스트페이지로  보내주고
				System.out.println("path : " + path);
			}
			else {
				rttr.addFlashAttribute("msg", "비밀번호가 틀렸습니다");
				path = "redirect:/board/boardDelete.aws?bidx="+bidx;
				System.out.println("path : " + path);// 비밀번호가 틀려서 실패하면 bidx 를 가지고  삭제페이지로 보내기
			}	
			
		 return path;		// 경로 리턴
		 
	}	
	
	
	@RequestMapping(value="boardReply.aws")		// 답변하기 페이지 보여주기만
	public String boardReply(@RequestParam("bidx") int bidx,  Model model) {		// 글번호 가지고 갈거고 모델에 담아서 보여주기
		
		BoardVo bv = boardService.boardSelectOne(bidx);			// 글 한개만 선택해서 가져오기  
		
		model.addAttribute("bv", bv);			// bv모델에 담기
		String path="WEB-INF/board/boardReply";	// 경로 답변하기로 보내주기  
		return path;
	}
	@RequestMapping(value="boardReplyAction.aws")		// 답변 동작 구현
	public String boardReplyAction(
			BoardVo bv,					// 제목, 내용, 작성자, 비밀번호 bv에 담아오기 
			@RequestParam("attachfile") MultipartFile attachfile,	// 첨부파일은 멀티파트로
			HttpServletRequest request,			// 세션정보 담기 회원번호 목적
			RedirectAttributes rttr)  			// 리다이렉트 객체 생성 
					throws Exception {
		
			
			MultipartFile file = attachfile;
			String uploadedFileName="";
			
			if (!file.getOriginalFilename().equals("")) {			// 원본파일이 있으면 
				uploadedFileName = UploadFileUtiles.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes());
			}		// 여기에 담고
			
			String midx = request.getSession().getAttribute("midx").toString();
			int midx_int = Integer.parseInt(midx);			// 회원번호 담기
			String ip = userIp.getUserIp(request);					// 아이피 정보 담기 
			
			bv.setUploadedFilename(uploadedFileName);   // bv에 파일이름 세팅해주기
			bv.setMidx(midx_int);						//bv에 회원번호 세팅해주기 
			bv.setIp(ip);								// bv에 아이피정보 세팅해주기
			
			
			int maxBidx=0;								// 
			maxBidx = boardService.boardReply(bv); 		//메서드 실행하고 나온 결과값 maxBidx에 담기
			System.out.println("maxBidx"+maxBidx);
			
			String path="";
			if (maxBidx !=0) {
				path="redirect:/board/askContents.aws?bidx="+maxBidx;		// 결과값이 0이 아닌경우 > 성공한것이므로 글내용으로 보내기 + 여기서 사용하려고 위에 리다이렉트 객체 생성한 것
			}else {
				rttr.addFlashAttribute("msg", "실패");		// 결과값이 0인 경우 > 실패 한 것이므로 다시 답변하기 페이지로 보내기 
				path="redirect:/board/boardReply.aws?bidx="+bv.getBidx();
			}		
		
			return path;		// 결과 경로 리턴해주기
	}
	
	
	//추천수 증가 컨트롤러
	@ResponseBody		// 객체를 받겠다는 어노테이션
	@RequestMapping(value="boardRecom.aws", method = RequestMethod.GET)			// 가상경로 boardRecom.aws 가 들어오면 실행되는 컨트롤러 
	public JSONObject boardRecom(@RequestParam("bidx") int bidx) {	// 리턴값 JSONObject 으로 설정 > @ResponseBody 해서 객체를 받는다고 설정
		
		int value = boardService.boardRecomUpdate(bidx); 		// value 에 boardRecomUpdate메서드 실행하고 결과값 담기 
				
		JSONObject js = new JSONObject();		// 제이슨 객체 생성해주고 
		js.put("recom", value);		// put 로 객체에 담기 
		
		
		return js;// js 리턴해주기 
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	//===========================인트로페이지 기능 x====================================================
	@RequestMapping(value="introDog.aws")	//강아지 서비스 소개 페이지 기능없음
	public String introDog() {	
		String path = "WEB-INF/board/introDog"; 
		return path;
	}
	@RequestMapping(value="introCat.aws")	//고양이 서비스 소개페이지 기능없음
	public String introCat() {	
		String path = "WEB-INF/board/introCat"; 
		return path;
	}
	@RequestMapping(value="introFee.aws")	//요금안내 페이지 기능 없음 
	public String introFee() {	
		String path = "WEB-INF/board/introFee"; 
		return path;
	}
	
	
	@RequestMapping(value ="displayFile.aws", method = RequestMethod.GET)		// get 방식으로 넘기는 것 > 파일 이름을 넘길것
	public ResponseEntity<byte[]> displayFile(
			@RequestParam("fileName") String fileName,	// 파일이름 넘기는 파라미터
			@RequestParam(value ="down", defaultValue = "0") int down		// 다운로드를 받을것인지 화면에 보여줄건지 정하는 파라미터
			) {
		
		
		ResponseEntity<byte[]> entity = null;			//entity : 실제 
		
		InputStream in = null; 	// 데이터 흐름의 시작 
		
		try{
			String formatName = fileName.substring(fileName.lastIndexOf(".")+1);// 자리수 계산한다음에 +1해주고  확장자 확인하는 ..substring(마지막. 뒤에있는 문자를 자른다 > 확장자 확인)
			MediaType mType = MediaUtils.getMediaType(formatName);
			
			HttpHeaders headers = new HttpHeaders();			// 헤더정보 가져오기 위해 생성
			 
			in = new FileInputStream(uploadPath+fileName);		// 
			
			
			if(mType != null){		// 이미지 파일등에 해당되면
				
				if (down==1) {		// 넘어온 다운의 값이 1이면 다운로드 실행 가능하게 ~~
					fileName = fileName.substring(fileName.indexOf("_")+1);
					headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
					headers.add("Content-Disposition", "attachment; filename=\""+
							new String(fileName.getBytes("UTF-8"),"ISO-8859-1")+"\"");	
					
				}else {			// 1이 아니면 다운로드 말고 화면에 보여줄거임
					headers.setContentType(mType);	
				}
				
			}else{		// 그게 아니면 다운로드 받는 방식으로  처리
				
				fileName = fileName.substring(fileName.indexOf("_")+1);
				headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
				headers.add("Content-Disposition", "attachment; filename=\""+
						new String(fileName.getBytes("UTF-8"),"ISO-8859-1")+"\"");				
			}
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.CREATED);	// entity  에 담겠다
			
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);		// entity에 담겠다 
		}finally{
			try {
				in.close();
			} catch (IOException e) {
				
				e.printStackTrace();
			}
		}
		
		
		return entity;
	}
	
	
	
	
	

}
