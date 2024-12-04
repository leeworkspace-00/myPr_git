package com.myaws.myapp.persistence;

import java.util.ArrayList;
import java.util.HashMap;

import com.myaws.myapp.domain.BoardVo;
import com.myaws.myapp.domain.searchCriteria;

public interface BoardMapper {
	/*
	 * public int reviewBoardInsert(BoardVo bv); public int
	 * boardOriginbidxUpdate(int bidx);
	 */
	// 원글번호 업데이트 치는 메서드
	public int boardOriginbidxUpdate(int bidx);
	public int viewCntUpdate(int bidx);
	
	
	public int reservationInsert(BoardVo bv);

	public ArrayList<BoardVo> reservationSelectAll(HashMap<String, Object> hm);

	public int reservationTotalCount(searchCriteria scri);

	public BoardVo reservationSelectOne(int bidx);

	// 조회수
	public int reservationViewCntUpdate(int bidx);

	public int reviewInsert(BoardVo bv);

	public ArrayList<BoardVo> askSelectAll(HashMap<String, Object> hm);

	public int askTotalCount(searchCriteria scri);

	// 시터신청목록 페이징, 목록보여주기
	public ArrayList<BoardVo> levelupSelectAll(HashMap<String, Object> hm);

	public int levelupTotalCount(searchCriteria scri);

	// 리뷰목록 페이징, 목록보여주기
	public ArrayList<BoardVo> reviewSelectAll(HashMap<String, Object> hm);

	public int reviewTotalCount(searchCriteria scri);
	//리뷰 내용 보여주기
	public BoardVo reviewSelectOne(int bidx);

	// 조회수
	public int reviewViewCntUpdate(int bidx);
	
	
	

	// 문의사항 글쓰기
	public int askInsert(BoardVo bv); 
	public BoardVo askSelectOne(int bidx);
	public BoardVo levelupSelectOne(int bidx);

}
