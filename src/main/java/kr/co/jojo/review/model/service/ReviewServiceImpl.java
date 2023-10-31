package kr.co.jojo.review.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jojo.comment.model.dto.Comment;
import kr.co.jojo.review.model.dao.ReviewDAO;
import kr.co.jojo.review.model.dto.Review;

@Service
public class ReviewServiceImpl implements ReviewService {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Autowired
	private ReviewDAO reviewDAO;

	// 전체 리뷰 수 구하기
	@Override
	public int selectListCount() {
		return reviewDAO.selectListCount(sqlSession);
	}

	// 리뷰 목록 불러오기
	@Override
	public List<Review> selectListAll(int movieIdx) {
		return reviewDAO.selectListAll(sqlSession, movieIdx);
	}
	
	// 리뷰 작성
	@Override
	public int insertReview(Review review) {
		return reviewDAO.insertReview(sqlSession, review);
	}

	// 리뷰 수정
	@Override
	public int updateReview(Review review) {
		return reviewDAO.updateReview(sqlSession, review);
	}
	
	// 리뷰 삭제
	@Override
	public int deleteReview(Review review) {
		return reviewDAO.deleteReview(sqlSession, review);
	}
	
}
