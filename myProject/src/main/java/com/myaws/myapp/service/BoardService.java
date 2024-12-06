package com.myaws.myapp.service;

import java.util.ArrayList;

import com.myaws.myapp.domain.BoardVo;
import com.myaws.myapp.domain.searchCriteria;

public interface BoardService {

	public BoardVo boardSelectOne(int bidx); // 글하나만 가져와서 보여주기 bidx로 가져오니까 4개 게시판 한번에 사용

	public int viewCntUpdate(int bidx);

	public int boardRecomUpdate(int bidx);

	// 예약신청서 작성하면 삽입되는 메서드
	public int reservationInsert(BoardVo bv);

	// 문의사항 글쓰기 메서드
	public int askInsert(BoardVo bv);

	// 등업게시판 삽입 메서드
	public int levelupInsert(BoardVo bv);

	// 리뷰 작성 삽입 메서드
	public int reviewInsert(BoardVo bv);

	// ========= insert 메서드 끝 ==================

	// 예약 목록 보여주는 메서드 전체가져오기
	public ArrayList<BoardVo> reservationSelectAll(searchCriteria scri);

	// 문의사항 목록보여주기
	public ArrayList<BoardVo> askSelectAll(searchCriteria scri);

	// 시터신청목록 목록보여주기
	public ArrayList<BoardVo> levelupSelectAll(searchCriteria scri);

	// 리뷰목록보여주기
	public ArrayList<BoardVo> reviewSelectAll(searchCriteria scri);

	// 페이징에 사용하는 메서드
	public int reservationTotalCount(searchCriteria scri);

	// 문의사항 목록 페이징
	public int askTotalCount(searchCriteria scri);

	// 시터신청목록 목록 페이징
	public int levelupTotalCount(searchCriteria scri);

	public int reviewTotalCount(searchCriteria scri);

	public int askUpdate(BoardVo bv);

	public int reviewUpdate(BoardVo bv);

	public int boardDeleteAction(int bidx, int midx, String pwd);

	public int boardReply(BoardVo bv);

}
