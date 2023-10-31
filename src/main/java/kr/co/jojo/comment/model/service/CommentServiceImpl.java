package kr.co.jojo.comment.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jojo.board.model.dao.BoardDAO;
import kr.co.jojo.board.model.dto.Board;
import kr.co.jojo.comment.model.dao.CommentDAO;
import kr.co.jojo.comment.model.dto.Comment;
import kr.co.jojo.common.model.dto.PageInfo;

@Service
public class CommentServiceImpl implements CommentService {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Autowired
	private CommentDAO commentDAO;

	// 전체 댓글 수 구하기
	@Override
	public int selectListCount(int boardIdx) {
		return commentDAO.selectListCount(sqlSession, boardIdx);
	}

	// 댓글 목록 불러오기
	@Override
	public List<Comment> selectListAll(int boardIdx) {
		return commentDAO.selectListAll(sqlSession, boardIdx);
	}

	// 댓글 작성
	@Override
	public int insertComment(Comment comment) {
		return commentDAO.insertComment(sqlSession, comment);
	}

	// 댓글 수정
	@Override
	public int updateComment(Comment comment) {
		return commentDAO.updateComment(sqlSession, comment);
	}

	@Override
	public int deleteComment(Comment comment) {
		return commentDAO.deleteComment(sqlSession, comment);
	}

}
