package kr.co.jojo.review.model.dao;

import java.util.List;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.co.jojo.comment.model.dto.Comment;
import kr.co.jojo.review.model.dto.Review;

@Repository
public class ReviewDAO {
	
	// 전체 리뷰 수 구하기
	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("reviewMapper.selectListCount");
	}

	// 리뷰 목록 불러오기
	public List<Review> selectListAll(SqlSessionTemplate sqlSession, int movieIdx) {
		return sqlSession.selectList("reviewMapper.selectListAll", movieIdx);
	}
	
	// 리뷰 작성
	public int insertReview(SqlSessionTemplate sqlSession, Review review) {
		return sqlSession.insert("reviewMapper.insertReview", review);
	}
	
	// 리뷰 수정
	public int updateReview(SqlSessionTemplate sqlSession, Review review) {
		return sqlSession.update("reviewMapper.updateReview", review);
	}
	
	// 리뷰 삭제
	public int deleteReview(SqlSessionTemplate sqlSession, Review review) {
		return sqlSession.delete("reviewMapper.deleteReview", review);
	}
}
