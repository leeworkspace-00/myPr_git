package com.myaws.myapp.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.myaws.myapp.domain.BoardVo;
import com.myaws.myapp.domain.searchCriteria;
import com.myaws.myapp.persistence.BoardMapper;
@Service
public class BoardServiceImpl implements BoardService {
	private BoardMapper bm; 
	

	  @Autowired // 객체생성 어노테이션 
	  public BoardServiceImpl(SqlSession sqlSession) {

	  this.bm = sqlSession.getMapper(BoardMapper.class); // 실행 파일이 있는지 확인하기 위해 class를 붙임 mybatis를 쓰기 위해 mapper와 연동 
	  }// mybatis 연동


	@Override
	@Transactional
	public int reservationInsert(BoardVo bv) {
		int value = bm.reservationInsert(bv);
		int maxBidx = bv.getBidx();
		int value2 = bm.boardOriginbidxUpdate(maxBidx);
		//System.out.println("value"+value);
		return value + value2; 

	}


	@Override
	@Transactional
	public int reviewInsert(BoardVo bv) {
		int value = bm.reviewInsert(bv);
		int maxBidx = bv.getBidx();
		int value2 = bm.boardOriginbidxUpdate(maxBidx);
		//System.out.println("value"+value);
		return value + value2; 
	}


	@Override
	public ArrayList<BoardVo> reservationSelectAll(searchCriteria scri) {
HashMap<String,Object> hm = new HashMap<String,Object>();
		
		hm.put("startPageNum", (scri.getPage()-1)*scri.getPerPageNum());	
		hm.put("searchType",scri.getSearchType());
		hm.put("perPageNum",scri.getPerPageNum());
		hm.put("keyword",scri.getKeyword());
		
		
		ArrayList<BoardVo> blist = bm.reservationSelectAll(hm);
		return blist;
	}


	@Override
	public int reservationTotalCount(searchCriteria scri) {
		int cnt = bm.reservationTotalCount(scri);	
		return cnt;
		
	}


	@Override
	public BoardVo reservationSelectOne(int bidx) {
		BoardVo bv =  bm.reservationSelectOne(bidx); 
		return bv;
	}


	@Override
	public int reservationViewCntUpdate(int bidx) {
		int cnt= bm.reservationViewCntUpdate(bidx);
		return cnt;
	}


	@Override
	public ArrayList<BoardVo> askSelectAll(searchCriteria scri) {
		HashMap<String,Object> hm = new HashMap<String,Object>();
		
		hm.put("startPageNum", (scri.getPage()-1)*scri.getPerPageNum());	
		hm.put("searchType",scri.getSearchType());
		hm.put("perPageNum",scri.getPerPageNum());
		hm.put("keyword",scri.getKeyword());
		
		
		ArrayList<BoardVo> alist = bm.askSelectAll(hm);
		return alist;
	}
	
	

	
	
	


	@Override
	public int askTotalCount(searchCriteria scri) {
		int cnt = bm.askTotalCount(scri);	
		return cnt;
	}


	@Override
	public ArrayList<BoardVo> levelupSelectAll(searchCriteria scri) {
			HashMap<String,Object> hm = new HashMap<String,Object>();
		
		hm.put("startPageNum", (scri.getPage()-1)*scri.getPerPageNum());	
		hm.put("searchType",scri.getSearchType());
		hm.put("perPageNum",scri.getPerPageNum());
		hm.put("keyword",scri.getKeyword());
		
		
		ArrayList<BoardVo> llist = bm.levelupSelectAll(hm);
		return llist;
	}


	@Override
	public int levelupTotalCount(searchCriteria scri) {
		int cnt = bm.levelupTotalCount(scri);	
		return cnt;
	}
	
	@Override
	@Transactional
	public int levelupInsert(BoardVo bv) {
		int value = bm.levelupInsert(bv); 
		int maxBidx = bv.getBidx();
		int value2 = bm.boardOriginbidxUpdate(maxBidx);
		//System.out.println("value"+value);
		return value + value2; 
	}


	@Override
	public ArrayList<BoardVo> reviewSelectAll(searchCriteria scri) {
		HashMap<String,Object> hm = new HashMap<String,Object>();
		
		hm.put("startPageNum", (scri.getPage()-1)*scri.getPerPageNum());	
		hm.put("searchType",scri.getSearchType());
		hm.put("perPageNum",scri.getPerPageNum());
		hm.put("keyword",scri.getKeyword());
		
		
		ArrayList<BoardVo> rlist = bm.reviewSelectAll(hm);
		return rlist;
	}


	@Override
	public int reviewTotalCount(searchCriteria scri) {
		int cnt = bm.reviewTotalCount(scri);	
		return cnt;
	}


	
	  @Override 
	  @Transactional
	  public int askInsert(BoardVo bv) {
	   int value = bm.askInsert(bv);
	   int maxBidx = bv.getBidx();
	   int value2 = bm.boardOriginbidxUpdate(maxBidx);
	   return value + value2; 

	  }


	@Override
	public BoardVo reviewSelectOne(int bidx) {
		BoardVo bv =  bm.reviewSelectOne(bidx); 
		return bv;
	}


	@Override
	public int reviewViewCntUpdate(int bidx) {
		int cnt= bm.reviewViewCntUpdate(bidx);
		return cnt;
	}


	@Override
	public int viewCntUpdate(int bidx) {
		int cnt= bm.viewCntUpdate(bidx);
		return cnt;
	}


	@Override
	public BoardVo askSelectOne(int bidx) {
		BoardVo bv =  bm.askSelectOne(bidx); 
		return bv;
	}
	@Override
	public BoardVo levelupSelectOne(int bidx) {
		BoardVo bv =  bm.levelupSelectOne(bidx); 
		return bv;
	}
	
	@Override
	public int reviewUpdate(BoardVo bv) {
		
		int value = bm.reviewUpdate(bv);		
		return value;
	}




	// 글삭제 동작 메서드 구현
	@Override
	public int boardDeleteAction(int bidx, int midx, String pwd) {
		HashMap<String, Object> hm = new HashMap<String, Object>();		// 해쉬맵으로 받아오자
		hm.put("bidx", bidx);
		hm.put("midx", midx);
		hm.put("pwd", pwd);
		
		int cnt = bm.boardDeleteAction(hm);
		return cnt;
	}
	
	@Override
	public BoardVo deleteSelectOne(int bidx) {		// 글 내용 1 개 가져와서 보여주는 메서드 
		BoardVo bv =  bm.deleteSelectOne(bidx); 
		return bv;
	}
	
	@Override
	public BoardVo boardSelectOne(int bidx) {
		BoardVo bv =  bm.boardSelectOne(bidx); 
		return bv;
	}
	
	@Transactional		// 두가지 이상 쿼리문 작동할 때 트랜잭션 걸기 
	@Override
	public int boardReply(BoardVo bv) {
	
		int value = bm.boardReplyUpdate(bv); 
		//System.out.println("value : "+value);
		
		int value2 = bm.boardReplyInsert(bv);
		//System.out.println("value2 : "+value2);
		int maxBidx = bv.getBidx();
		return maxBidx;
	}
	
	@Override
	public int boardRecomUpdate(int bidx) {		// 추천 클릭시 추천수만 증가하는 메서드  
		BoardVo bv = new BoardVo();
		bv.setBidx(bidx);
		
		int cnt = bm.boardRecomUpdate(bv); 
		int recom = bv.getRecom();
		return recom;
		
		
	}
	
	
}
