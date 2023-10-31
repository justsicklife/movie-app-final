package kr.co.jojo.review.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.jojo.comment.model.dto.Comment;
import kr.co.jojo.comment.model.service.CommentServiceImpl;
import kr.co.jojo.common.controller.DataValidationController;
import kr.co.jojo.common.template.AlertMessage;
import kr.co.jojo.movie.model.dto.Movie;
import kr.co.jojo.review.model.dto.Review;
import kr.co.jojo.review.model.service.ReviewServiceImpl;

@Controller
@RequestMapping("/review")
public class ReviewController {

	@Autowired
	private ReviewServiceImpl reviewService;
	@Autowired
	private DataValidationController dataValidation;

	// movie.jsp에서 리뷰 작성하면 아래 insertReview 실행
	@PostMapping("/insertReview.do")
	public String insertReview(@RequestParam(value = "movieIdx") int movieIdx, Review review, HttpSession session) {
		review.setMemberIdx((int) session.getAttribute("memberIdx"));
		review.setReviewWriter((String) session.getAttribute("memberName"));
		review.setMovieIdx(movieIdx);
		
		boolean titleLength = dataValidation.languageCheck(review.getReviewTitle());
		boolean titleNull = dataValidation.nullCheck(review.getReviewTitle());
		boolean contentLength = dataValidation.languageCheck(review.getReviewContent());
		boolean contentNull = dataValidation.nullCheck(review.getReviewContent());

		if (titleLength && titleNull && contentLength && contentNull) {
			int result = reviewService.insertReview(review);
			
			if (result > 0) {
				AlertMessage.setAlert(session, "리뷰 작성 성공!!!", "Success", "success");
				return "redirect:/movie/detail.do?movieIdx=" + movieIdx;
				
			} else {
				AlertMessage.setAlert(session, "리뷰 작성 실패", "ERROR", "error");
				return "common/errorPage";
			}
		} else if (!titleLength) {
			AlertMessage.setAlert(session, "제목이 너무 깁니다.", "리뷰_ERROR", "error");
		} else if (!titleNull) {
			AlertMessage.setAlert(session, "제목을 입력해주세요.", "리뷰_ERROR", "error");
		} else if (!contentLength) {
			AlertMessage.setAlert(session, "내용이 너무 깁니다.", "리뷰_ERROR", "error");
		} else if (!contentNull) {
			AlertMessage.setAlert(session, "내용을 입력해주세요.", "리뷰_ERROR", "error");
		} else {
			AlertMessage.setAlert(session, "에러가 발생했습니다.", "리뷰_ERROR", "error");
		}
		return "redirect:/movie/detail.do?movieIdx=" + movieIdx;
	}
	
	// movie.jsp 리뷰 모달에서 자기 리뷰 수정하는 경우
	@PostMapping("updateReview.do")
	public String updateReview(@RequestParam(value = "movieIdx") int movieIdx,
			@RequestParam(value = "reviewIdx") int reviewIdx,
			@RequestParam(value = "reviewMemberIdx") int reviewMemberIdx, Review review, HttpSession session) {
		review.setMemberIdx(reviewMemberIdx);

		boolean titleLength = dataValidation.languageCheck(review.getReviewTitle());
		boolean titleNull = dataValidation.nullCheck(review.getReviewTitle());
		boolean contentLength = dataValidation.languageCheck(review.getReviewContent());
		boolean contentNull = dataValidation.nullCheck(review.getReviewContent());

		if (titleLength && titleNull && contentLength && contentNull) {
			int result = reviewService.updateReview(review);
			
			if (result > 0) {
				AlertMessage.setAlert(session, "리뷰 수정 성공!!!", "Success", "success");
				return "redirect:/movie/detail.do?movieIdx=" + movieIdx;
				
			} else {
				AlertMessage.setAlert(session, "리뷰 작성 실패", "ERROR", "error");
				return "common/errorPage";
			}
		} else if (!titleLength) {
			AlertMessage.setAlert(session, "제목이 너무 깁니다.", "리뷰_ERROR", "error");
		} else if (!titleNull) {
			AlertMessage.setAlert(session, "제목을 입력해주세요.", "리뷰_ERROR", "error");
		} else if (!contentLength) {
			AlertMessage.setAlert(session, "내용이 너무 깁니다.", "리뷰_ERROR", "error");
		} else if (!contentNull) {
			AlertMessage.setAlert(session, "내용을 입력해주세요.", "리뷰_ERROR", "error");
		} else {
			AlertMessage.setAlert(session, "에러가 발생했습니다.", "리뷰_ERROR", "error");
		}
		return "redirect:/movie/detail.do?movieIdx=" + movieIdx;
	}
	
	// 리뷰 삭제
	@PostMapping("deleteReview.do")
	public String deleteReview(@RequestParam(value = "movieIdx") int movieIdx,
			@RequestParam(value = "reviewIdx") int reviewIdx,
			@RequestParam(value = "reviewMemberIdx") int reviewMemberIdx, Review review, HttpSession session) {

		review.setMemberIdx(reviewMemberIdx);

		int result = reviewService.deleteReview(review);
		if (result > 0) {
			AlertMessage.setAlert(session, "리뷰 삭제 성공!!!", "Success", "success");
			return "redirect:/movie/detail.do?movieIdx=" + movieIdx;
		} else {
			AlertMessage.setAlert(session, "리뷰 삭제 실패", "ERROR", "error");
			return "redirect:/movie/detail.do?movieIdx=" + movieIdx;
		}
	}

}
