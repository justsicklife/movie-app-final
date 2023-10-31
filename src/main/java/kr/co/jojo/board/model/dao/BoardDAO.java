package kr.co.jojo.board.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.co.jojo.board.model.dto.Board;
import kr.co.jojo.common.model.dto.PageInfo;

@Repository
public class BoardDAO {
	
	// 전체 게시글 수 구하기
	public int selectListCountAll(SqlSessionTemplate sqlSession, String searchText) {
		return sqlSession.selectOne("boardMapper.selectListCountAll", searchText);
	}
	
	// 카테고리별 게시글 수 구하기
	public int selectListCountCtg(SqlSessionTemplate sqlSession, String searchText, String category) {
	    Map<String, Object> parameters = new HashMap<>();
	    parameters.put("searchText", searchText);
	    parameters.put("category", category);
	    
	    return sqlSession.selectOne("boardMapper.selectListCountCtg", parameters);
	}
	
	// 전체 게시글 목록 불러오기(페이징)
	public List<Board> selectListAll(SqlSessionTemplate sqlSession, PageInfo pi, String searchText) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return sqlSession.selectList("boardMapper.selectListAll", searchText, rowBounds);
	}
		
	// 카테고리별 게시글 목록 불러오기(페이징)
	public List<Board> selectListCtg(SqlSessionTemplate sqlSession, PageInfo pi, String searchText, String category) {
	    int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();		
	    RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
	    
	    Map<String, Object> parameters = new HashMap<>();
	    parameters.put("searchText", searchText);
	    parameters.put("category", category);
	    
	    return sqlSession.selectList("boardMapper.selectListCtg", parameters, rowBounds);
	}

	
	
	// 게시글 작성
	public int insertBoard(SqlSessionTemplate sqlSession, Board bo) {
		return sqlSession.insert("boardMapper.insertBoard", bo);
	}
	
	// 게시글 상세보기
	public Board detailBoard(SqlSessionTemplate sqlSession, int idx) {
		return sqlSession.selectOne("boardMapper.detailBoard", idx);
	}
	
	// 게시글 수정
	public int updateBoard(SqlSessionTemplate sqlSession, Board bo) {
		return sqlSession.update("boardMapper.updateBoard", bo);
	}
	
	// 게시글 수정 (파일 업로드)
	public int updateUploadBoard(SqlSessionTemplate sqlSession, Board bo) {
		return sqlSession.update("boardMapper.updateUploadBoard", bo);
	}
	
	// 게시글 삭제
	public int deleteBoard(SqlSessionTemplate sqlSession, Board bo) {
		return sqlSession.delete("boardMapper.deleteBoard", bo);
	}

	// 게시글 조회수 증가
	public int viewsBoard(SqlSessionTemplate sqlSession, Board bo) {
		return sqlSession.update("boardMapper.viewsBoard", bo);
	}
	
	// 게시글 목록 상단 공지사항(고정)
	public List<Board> selectListNotice(SqlSessionTemplate sqlSession) {
		return sqlSession.selectList("boardMapper.selectListNotice");
	}
}
