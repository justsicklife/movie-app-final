package kr.co.jojo.review.model.service;

import java.util.List;

import kr.co.jojo.review.model.dto.Review;

public interface ReviewService {
	
	// 전체 댓글 수 구하기
	int selectListCount();
	
	// 댓글 목록 불러오기
	List<Review> selectListAll(int movieIdx);
	
	// 리뷰 작성
	int insertReview(Review review);
	
	// 리뷰 수정
	public int updateReview(Review review);
	
	// 리뷰 삭제
	public int deleteReview(Review review);
}
