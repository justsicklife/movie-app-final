package kr.co.jojo.board.model.service;

import java.util.List;

import kr.co.jojo.board.model.dto.Board;
import kr.co.jojo.common.model.dto.PageInfo;

public interface BoardService {

	// 전체 게시글 수 구하기
	int selectListCountAll(String searchText);
	
	// 카테고리별 게시글 수 구하기
	int selectListCountCtg(String searchText, String category);
	
	// 전체 게시글 목록 불러오기
	List<Board> selectListAll(PageInfo pi, String searchText);
	
	// 카테고리별 게시글 목록 불러오기
	List<Board> selectListCtg(PageInfo pi, String searchText, String category);
	
	// 게시글 작성
	int insertBoard(Board bo);
	
	// 게시글 상세보기
	Board detailBoard(int idx);
	
	// 게시글 수정
	int updateBoard(Board bo);
	
	// 게시글 수정 (파일 업로드)
	int updateUploadBoard(Board bo);
	
	// 게시글 삭제
	int deleteBoard(Board bo);
	
	// 조회수 증가
	int viewsBoard(Board bo);
	
	// 게시글 목록 상단 공지사항(고정)
	public List<Board> selectListNotice();
}
