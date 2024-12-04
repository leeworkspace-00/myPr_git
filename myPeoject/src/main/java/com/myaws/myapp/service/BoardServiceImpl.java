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


	
	  @Override public int askInsert(BoardVo bv) {
	   int value = bm.askInsert(bv);
	   return value; 
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
}
