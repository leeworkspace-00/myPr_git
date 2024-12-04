package com.myaws.myapp.service;

import java.util.ArrayList;

import com.myaws.myapp.domain.BoardVo;
import com.myaws.myapp.domain.searchCriteria;
public interface BoardService{
	//예약신청서 작성하면 삽입되는 메서드
	public int reservationInsert(BoardVo bv); 
	//예약 목록 보여주는 메서드 전체가져오기
	public ArrayList<BoardVo> reservationSelectAll(searchCriteria scri);
	// 페이징에 사용하는 메서드
	public int reservationTotalCount(searchCriteria scri);
	// 예약 내용 보여주는 메서드
	public BoardVo reservationSelectOne(int bidx);
	// 조회수 메서드
	public int reservationViewCntUpdate(int bidx);
	// 추가해야할 메서드 : 승인 거절 답변하기 수정하기 삭제하기
	
	//문의사항 목록보여주기
	public ArrayList<BoardVo> askSelectAll(searchCriteria scri);
	//문의사항 목록 페이징
	public int askTotalCount(searchCriteria scri);
	
	  //문의사항 글쓰기 메서드 
	 public int askInsert(BoardVo bv);
	 
	
	
	//시터신청목록 목록보여주기
	public ArrayList<BoardVo> levelupSelectAll(searchCriteria scri);
	//시터신청목록 목록 페이징
	public int levelupTotalCount(searchCriteria scri);
		
	
	
	
	
	//리뷰 작성 삽입 메서드
	public int reviewInsert(BoardVo bv); 
	//리뷰목록보여주기
	public ArrayList<BoardVo> reviewSelectAll(searchCriteria scri);
	public int reviewTotalCount(searchCriteria scri);
	// 리뷰 내용 보여주기 
	public BoardVo reviewSelectOne(int bidx);
	// 조회수 메서드
	public int reviewViewCntUpdate(int bidx);

	
	
	
	
	public int viewCntUpdate(int bidx);
	public BoardVo askSelectOne(int bidx);
	
	public BoardVo levelupSelectOne(int bidx);
}
