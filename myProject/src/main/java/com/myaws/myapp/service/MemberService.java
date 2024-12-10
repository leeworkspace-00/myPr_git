package com.myaws.myapp.service;
import java.util.ArrayList;

import com.myaws.myapp.domain.BoardVo;
import com.myaws.myapp.domain.MemberVo;

public interface MemberService {
	
	public ArrayList <MemberVo> memberSelectAll();	
	public MemberVo memberLoginCheck(String memberId);
	public int memberInsert(MemberVo mv);
	
	public MemberVo myPageShow(int midx);
	
	public int memberIdCheck(String memberId);
	
	public MemberVo adminLoginCheck(String memberId);


	

}
