package com.myaws.myapp.persistence;

import java.util.*;

import com.myaws.myapp.domain.MemberVo;

public interface MemberMapper {
	public ArrayList <MemberVo> memberSelectAll();
	public MemberVo memberLoginCheck(String memberId);
	public int memberInsert(MemberVo mv);
	public MemberVo myPageShow(int midx);
}
