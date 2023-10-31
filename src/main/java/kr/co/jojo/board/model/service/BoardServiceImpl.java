package kr.co.jojo.board.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jojo.board.model.dao.BoardDAO;
import kr.co.jojo.board.model.dto.Board;
import kr.co.jojo.common.model.dto.PageInfo;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Autowired
	private BoardDAO boardDAO;

	// 전체 게시글 수 구하기
	@Override
	public int selectListCountAll(String searchText) {
		return boardDAO.selectListCountAll(sqlSession, searchText);
	}
	
	// 카테고리별 게시글 수 구하기
	@Override
	public int selectListCountCtg(String searchText, String category) {
		return boardDAO.selectListCountCtg(sqlSession, searchText, category);
	}

	// 전체 게시글 목록 불러오기
	@Override
	public List<Board> selectListAll(PageInfo pi, String searchText) {
		return boardDAO.selectListAll(sqlSession, pi, searchText);
	}
	
	// 카테고리별 게시글 목록 불러오기
	@Override
	public List<Board> selectListCtg(PageInfo pi, String searchText, String category) {
		return boardDAO.selectListCtg(sqlSession, pi, searchText, category);
	}

	// 게시글 작성
	@Override
	public int insertBoard(Board bo) {
		return boardDAO.insertBoard(sqlSession, bo);
	}

	// 게시글 상세보기
	@Override
	public Board detailBoard(int idx) {
		return boardDAO.detailBoard(sqlSession, idx);
	}

	// 게시글 수정
	@Override
	public int updateBoard(Board bo) {
		return boardDAO.updateBoard(sqlSession, bo);
	}
	
	// 게시글 수정 (파일 업로드)
	@Override
	public int updateUploadBoard(Board bo) {
		return boardDAO.updateUploadBoard(sqlSession, bo);
	}

	// 게시글 삭제
	@Override
	public int deleteBoard(Board bo) {
		return boardDAO.deleteBoard(sqlSession, bo);
	}
	
	// 게시글 조회수 증가
	@Override
	public int viewsBoard(Board bo) {
		return boardDAO.viewsBoard(sqlSession, bo);		
	}

	// 게시글 목록 상단 공지사항(고정)
	@Override
	public List<Board> selectListNotice() {
		return boardDAO.selectListNotice(sqlSession);
	}
}
