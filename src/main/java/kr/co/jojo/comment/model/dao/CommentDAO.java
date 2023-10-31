package kr.co.jojo.comment.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.co.jojo.board.model.dto.Board;
import kr.co.jojo.comment.model.dto.Comment;
import kr.co.jojo.common.model.dto.PageInfo;

@Repository
public class CommentDAO {
	
	// 전체 댓글 수 구하기
	public int selectListCount(SqlSessionTemplate sqlSession, int boardIdx) {
		return sqlSession.selectOne("commentMapper.selectListCount", boardIdx);
	}
	
	// 댓글 목록 불러오기
	public List<Comment> selectListAll(SqlSessionTemplate sqlSession, int boardIdx) {
		return sqlSession.selectList("commentMapper.selectListAll", boardIdx);
	}
	
	// 댓글 작성
	public int insertComment(SqlSessionTemplate sqlSession, Comment comment) {
		return sqlSession.insert("commentMapper.insertComment", comment);
	}
	
	// 댓글 수정
	public int updateComment(SqlSessionTemplate sqlSession, Comment comment) {
		return sqlSession.update("commentMapper.updateComment", comment);
	}
	
	// 댓글 삭제
	public int deleteComment(SqlSessionTemplate sqlSession, Comment comment) {
		return sqlSession.delete("commentMapper.deleteComment", comment);
	}
}
