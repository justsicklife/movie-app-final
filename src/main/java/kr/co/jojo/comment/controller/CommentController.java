package kr.co.jojo.comment.controller;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import kr.co.jojo.board.model.dto.Board;
import kr.co.jojo.comment.model.dto.Comment;
import kr.co.jojo.comment.model.service.CommentServiceImpl;
import kr.co.jojo.common.controller.DataValidationController;
import kr.co.jojo.common.template.AlertMessage;

@Controller
@RequestMapping("/comment")
public class CommentController {

	@Autowired
	private CommentServiceImpl commentService;
	@Autowired
	private DataValidationController dataValidation;

	// board_detail.jsp에서 댓글 작성하면 아래 insertComment 실행
	@PostMapping("/insertComment.do")
	public String insertComment(@RequestParam(value = "boardIdx") int boardIdx, Comment comment, HttpSession session) {
		comment.setMemberIdx((int) session.getAttribute("memberIdx"));
		comment.setCommentWriter((String) session.getAttribute("memberName"));
		comment.setBoardIdx(boardIdx);

		boolean contentLength = dataValidation.languageCheck(comment.getCommentContent());
		boolean contentNull = dataValidation.nullCheck(comment.getCommentContent());

		if (contentLength && contentNull) {
			int result = commentService.insertComment(comment);
			
			if (result > 0) {
				AlertMessage.setAlert(session, "댓글 작성 성공!!!", "Success", "success");
				return "redirect:/board/detail.do?boardIdx=" + boardIdx;
				
			} else {
				AlertMessage.setAlert(session, "댓글 작성 실패", "ERROR", "error");
				return "common/errorPage";
			}
		} else if (!contentLength) {
			AlertMessage.setAlert(session, "댓글이 너무 깁니다.", "댓글_ERROR", "error");
		} else if (!contentNull) {
			AlertMessage.setAlert(session, "댓글을 입력해주세요.", "댓글_ERROR", "error");
		} else {
			AlertMessage.setAlert(session, "에러가 발생했습니다.", "댓글_ERROR", "error");
		}
		return "redirect:/board/detail.do?boardIdx=" + boardIdx;
	}

	// board_detail.jsp 댓글 수정 모달에서 자기 댓글 수정하는 경우
	@PostMapping("updateComment.do")
	public String updateComment(@RequestParam(value = "boardIdx") int boardIdx,
			@RequestParam(value = "commentIdx") int commentIdx,
			@RequestParam(value = "commentMemberIdx") int commentMemberIdx, Comment comment, HttpSession session) {
		comment.setMemberIdx(commentMemberIdx);

		boolean contentLength = dataValidation.languageCheck(comment.getCommentContent());
		boolean contentNull = dataValidation.nullCheck(comment.getCommentContent());

		if (commentMemberIdx == (int) session.getAttribute("memberIdx")) {

			if (contentLength && contentNull) {
				int result = commentService.updateComment(comment);

				if (result > 0) {
					System.out.println("댓글 수정 성공");
					return "redirect:/board/detail.do?boardIdx=" + boardIdx;

				} else {
					System.out.println("댓글 수정 실패");
					return "redirect:/board/detail.do?boardIdx=" + boardIdx;
				}

			} else if (!contentLength) {
				AlertMessage.setAlert(session, "댓글이 너무 깁니다.", "댓글_ERROR", "error");
			} else if (!contentNull) {
				AlertMessage.setAlert(session, "댓글을 입력해주세요.", "댓글_ERROR", "error");
			} else {
				AlertMessage.setAlert(session, "에러가 발생했습니다.", "댓글_ERROR", "error");
			}
			return "redirect:/board/detail.do?boardIdx=" + boardIdx;
		} else {
			AlertMessage.setAlert(session, "잘못된 접근", "접근_ERROR", "error");
			return "redirect:/board/list.do";
		}
	}

	// 댓글 삭제
	@PostMapping("deleteComment.do")
	public String deleteComment(@RequestParam(value = "boardIdx") int boardIdx,
			@RequestParam(value = "commentIdx") int commentIdx,
			@RequestParam(value = "commentMemberIdx") int commentMemberIdx, Comment comment, HttpSession session) {

		comment.setMemberIdx(commentMemberIdx);

		int result = commentService.deleteComment(comment);
		if (result > 0) {
			System.out.println("삭제 성공");
			return "redirect:/board/detail.do?boardIdx=" + boardIdx;
		} else {
			System.out.println("삭제 실패");
			return "redirect:/board/detail.do?boardIdx=" + boardIdx;
		}
	}

}
