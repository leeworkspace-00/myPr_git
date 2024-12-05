package com.myaws.myapp.service;

import java.util.ArrayList;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myaws.myapp.domain.BoardVo;
import com.myaws.myapp.domain.MemberVo;
import com.myaws.myapp.persistence.MemberMapper;

@Service
public class MemberServiceImpl implements MemberService {

    private final MemberMapper mm; 

    @Autowired
    public MemberServiceImpl(SqlSession sqlSession) {
        this.mm = sqlSession.getMapper(MemberMapper.class);
    }

    @Override
    public ArrayList<MemberVo> memberSelectAll() {
        return mm.memberSelectAll();
    }
  @Override
  	public MemberVo memberLoginCheck(String memberId) {
  		MemberVo mv = mm.memberLoginCheck(memberId);		
  		return mv;	
  	}

  @Override
	public int memberInsert(MemberVo mv) {		
		int value = mm.memberInsert(mv);
		System.out.println("value"+value);
		return value;  // 서비스에서 선언하면 impl에 자동으로 빨간줄 > 메서드 생성 해줌	
	}

	@Override
	public MemberVo myPageShow(int midx) {
		MemberVo mv =  mm.myPageShow(midx); 
		return mv;
	}
	public int memberIdCheck(String memberId) {
		int value = mm.memberIdCheck(memberId);
		
		return value;  // 서비스에서 선언하면 impl에 자동으로 빨간줄 > 메서드 생성 해줌
	}
}