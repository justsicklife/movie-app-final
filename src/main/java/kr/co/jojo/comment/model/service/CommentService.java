package kr.co.jojo.comment.model.service;

import java.util.List;

import kr.co.jojo.board.model.dto.Board;
import kr.co.jojo.comment.model.dto.Comment;

public interface CommentService {
	
	// 전체 댓글 수 구하기
	int selectListCount(int boardIdx);
	
	// 댓글 목록 불러오기
	List<Comment> selectListAll(int boardIdx);
	
	// 댓글 작성
	int insertComment(Comment comment);
	
	// 댓글 수정
	int updateComment(Comment comment);
	
	// 댓글 삭제
	int deleteComment(Comment comment);
}
