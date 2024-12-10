package com.myaws.myapp.persistence;

import java.util.*;

import com.myaws.myapp.domain.MemberVo;

public interface MemberMapper {
	public int memberInsert(MemberVo mv);
	public ArrayList <MemberVo> memberSelectAll();
	public MemberVo memberLoginCheck(String memberId);
	public MemberVo myPageShow(int midx);
	
	public int memberIdCheck(String memberId);	
	
	public MemberVo adminLoginCheck(String memberId);


}
