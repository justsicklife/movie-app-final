package kr.co.jojo.board.controller;

import java.util.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import kr.co.jojo.board.model.dto.Board;
import kr.co.jojo.board.model.service.BoardServiceImpl;
import kr.co.jojo.comment.model.dto.Comment;
import kr.co.jojo.comment.model.service.CommentServiceImpl;
import kr.co.jojo.common.controller.DataValidationController;
import kr.co.jojo.common.controller.UploadFileController;
import kr.co.jojo.common.model.dto.PageInfo;
import kr.co.jojo.common.template.AlertMessage;
import kr.co.jojo.common.template.Pagination;

@Controller
@RequestMapping("/board")
public class BoardController {

	@Autowired
	private DataValidationController dataValidation;
	@Autowired
	private BoardServiceImpl boardService;
	@Autowired
	private CommentServiceImpl commentService;

	@GetMapping("/list.do")
	public String boardList(@RequestParam(value = "searchText", defaultValue = "") String searchText,
			@RequestParam(value = "category", defaultValue = "전체") String category,
			@RequestParam(value = "cpage", defaultValue = "1") int currentPage, HttpSession session, Model model) {

		System.out.println("category: " + category);
		System.out.println("currentPage: " + currentPage);

		// 게시글 목록 상단 공지사항(고정)
		// category가 '공지사항'인 게시글 목록 불러오기
		List<Board> notice = boardService.selectListNotice();
		for (Board item : notice) {
			item.setBoardInDate(item.getBoardInDate().substring(0, 10));
		}

		// 포워딩할 페이지
		String target = "";
		// 페이징 처리를 위한 변수 초기화
		int listCount = 0;
		int pageLimit = 0;
		int boardLimit = 0;
		int row = 0;
		PageInfo pi = null;
		List<Board> list = new ArrayList<>();

		if (category.equals("전체")) {
			// 전체 게시글 수 구하기
			listCount = boardService.selectListCountAll(searchText);
			pageLimit = 10;
			boardLimit = 10;
			row = listCount - (currentPage - 1) * boardLimit;
			pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);

			// 전체 게시글 목록 불러오기
			list = boardService.selectListAll(pi, searchText);

			for (Board item : list) {
				item.setBoardInDate(item.getBoardInDate().substring(0, 10));
				// 댓글 수 구하기
				int a = commentService.selectListCount(item.getBoardIdx());
				item.setBoardCommentCnt(a);
			}

			target = "board/board";

		} else {
			// 카테고리별 게시글 수 구하기
			listCount = boardService.selectListCountCtg(searchText, category);
			pageLimit = 10;
			boardLimit = 10;
			row = listCount - (currentPage - 1) * boardLimit;
			pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);

			// 카테고리별 게시글 목록 불러오기
			list = boardService.selectListCtg(pi, searchText, category);

			for (Board item : list) {
				item.setBoardInDate(item.getBoardInDate().substring(0, 10));
				// 댓글 수 구하기
				int a = commentService.selectListCount(item.getBoardIdx());
				item.setBoardCommentCnt(a);
			}

			if (category.equals("공지사항")) {
				target = "board/category/notice";

			} else if (category.equals("잡담")) {
				target = "board/category/talk";

			} else if (category.equals("정보")) {
				target = "board/category/info";

			} else if (category.equals("공유")) {
				target = "board/category/share";
			}
		}

		// 객체 바인딩
		model.addAttribute("list", list);
		model.addAttribute("notice", notice);
		model.addAttribute("row", row);
		model.addAttribute("pi", pi);
		model.addAttribute("category", category);

		AlertMessage.getAlert(session, model);

		Integer isLog = (Integer) session.getAttribute("memberIdx");
		System.out.println("isLog: " + isLog);
		model.addAttribute("isLog", isLog);

		return target; // /WEB-INF/views/board/board.jsp로 포워딩
	}

	// board.jsp에서 "글쓰기" 버튼을 누르면 enrollForm()이 받아서 board_post.jsp로 포워딩
	@GetMapping("enrollForm.do")
	public String enrollForm(HttpSession session, Model model) {

		AlertMessage.getAlert(session, model);
		return "board/board_post";
	}

	// board_post.jsp에서 "작성" 버튼 누르면 아래 insertBoard 실행
	@PostMapping("insert.do")
	public String insertBoard(Board board, HttpSession session) {
		board.setBoardWriter((String) session.getAttribute("memberName"));
		board.setBoardMemberIdx((int) session.getAttribute("memberIdx"));

		boolean titleLength = dataValidation.languageCheck(board.getBoardTitle());
		boolean titleNull = dataValidation.nullCheck(board.getBoardTitle());
		boolean contentLength = dataValidation.languageCheck(board.getBoardContent());
		boolean contentNull = dataValidation.nullCheck(board.getBoardContent());

		if (titleLength && titleNull && contentLength && contentNull) {
			int result = boardService.insertBoard(board);

			if (result > 0) {
				AlertMessage.setAlert(session, "글 작성 성공!!!", "Success", "success");
				return "redirect:/board/list.do";

			} else {
				AlertMessage.setAlert(session, "글 작성 실패", "ERROR", "error");
				return "common/errorPage";
			}
		} else if (!titleLength) {
			AlertMessage.setAlert(session, "제목이 너무 깁니다.", "작성_ERROR", "error");
		} else if (!titleNull) {
			AlertMessage.setAlert(session, "제목을 입력해주세요.", "작성_ERROR", "error");
		} else if (!contentLength) {
			AlertMessage.setAlert(session, "내용이 너무 깁니다.", "작성_ERROR", "error");
		} else if (!contentNull) {
			AlertMessage.setAlert(session, "내용을 입력해주세요.", "작성_ERROR", "error");
		} else {
			AlertMessage.setAlert(session, "에러가 발생했습니다.", "작성_ERROR", "error");
		}
		return "redirect:/board/enrollForm.do";
	}

	// board.jsp에서 특정 게시물 클릭하면 해당 게시물의 board_idx와 함께 detail.do로 넘어옴
	@GetMapping("detail.do")
	public String detailBoard(@RequestParam(value = "boardIdx") int boardIdx, Model model, HttpSession session) {

		AlertMessage.getAlert(session, model);

		// 선택한 게시글 정보 불러오기 (board-mapper)
		Board detail = boardService.detailBoard(boardIdx);
		detail.setBoardInDate(detail.getBoardInDate().substring(0, 19));

		// 댓글 불러오기 (comment-mapper)
		List<Comment> commentList = commentService.selectListAll(boardIdx);

		// 댓글 작성시간
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

		// 현재 날짜/시간
		LocalDateTime now = LocalDateTime.now();

		for (Comment item : commentList) {
			try {
				Date commentDate = dateFormat.parse(item.getCommentInDate());
				String nowDateBefore = now.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
				Date nowDate = dateFormat.parse(nowDateBefore);

				long diffSec = (nowDate.getTime() - commentDate.getTime()) / 1000; // 초 차이
				long diffMin = (nowDate.getTime() - commentDate.getTime()) / 60000; // 분 차이
				long diffHour = (nowDate.getTime() - commentDate.getTime()) / 3600000; // 시 차이
				long diffDays = diffSec / (24 * 60 * 60); // 일자수 차이

				System.out.println(diffSec + "초 차이");
				System.out.println(diffMin + "분 차이");
				System.out.println(diffHour + "시 차이");
				System.out.println(diffDays + "일 차이");

				if (diffHour <= 24) {
					if (diffHour > 0) {
						item.setCommentInDate(diffHour + "시간 전");
					} else {
						if (diffMin == 0) {
							item.setCommentInDate(diffSec + "초 전");
						} else {
							item.setCommentInDate(diffMin + "분 전");
						}
					}
				} else if (diffHour > 24) {
					item.setCommentInDate(item.getCommentInDate().substring(0, 19));
				} else {
					System.out.println("이상 댓글번호: " + item.getCommentIdx());
					System.out.println(diffSec + "초 차이");
					System.out.println(diffMin + "분 차이");
					System.out.println(diffHour + "시 차이");
					System.out.println(diffDays + "일 차이");
				}

			} catch (ParseException e) {
				e.printStackTrace();
			}
		}

		System.out.println(detail);
		System.out.println(commentList);

		if (!Objects.isNull(detail)) {
			detail.setBoardViews(detail.getBoardViews() + 1);
			boardService.viewsBoard(detail);

			model.addAttribute("detail", detail); // 게시물 정보
			model.addAttribute("commentList", commentList); // 댓글 정보
			model.addAttribute("loginMemberIdx", session.getAttribute("memberIdx"));
			model.addAttribute("loginMemberName", session.getAttribute("memberName"));

			return "board/board_detail";

		} else {
			return "common/errorPage";
		}
	}

	// 게시물 수정 페이지로 이동
	@GetMapping("updateForm.do")
	public String updateForm(@RequestParam(value = "boardIdx") int boardIdx, Model model, HttpSession session) {
		
		Board detail = boardService.detailBoard(boardIdx);
		if (!Objects.isNull(detail)) {
			model.addAttribute("detail", detail);
			model.addAttribute("loginMemberIdx", session.getAttribute("memberIdx"));

			AlertMessage.getAlert(session, model);
			return "board/board_update";

		} else {
			return "common/errorPage";
		}
	}

	// 게시물 수정
	@PostMapping("update.do")
	public String updateBoard(@RequestParam(value = "boardIdx") int boardIdx, Board board, HttpSession session, Model model) {

		boolean titleLength = dataValidation.languageCheck(board.getBoardTitle());
		boolean titleNull = dataValidation.nullCheck(board.getBoardTitle());
		boolean contentLength = dataValidation.languageCheck(board.getBoardContent());
		boolean contentNull = dataValidation.nullCheck(board.getBoardContent());

		if ((board.getBoardMemberIdx() == (int) session.getAttribute("memberIdx"))) {

			if (titleLength && titleNull && contentLength && contentNull) {
				int result = boardService.updateBoard(board);

				if (result > 0) {
					AlertMessage.setAlert(session, "수정 성공", "Success", "success");
					return "redirect:/board/detail.do?boardIdx=" + boardIdx;

				} else {
					AlertMessage.setAlert(session, "수정 실패", "ERROR", "error");
					return "redirect:/common/errorPage";
				}

			} else if (!titleLength) {
				AlertMessage.setAlert(session, "제목이 너무 깁니다.", "수정_ERROR", "error");
			} else if (!titleNull) {
				AlertMessage.setAlert(session, "제목을 입력해주세요.", "수정_ERROR", "error");
			} else if (!contentLength) {
				AlertMessage.setAlert(session, "내용이 너무 깁니다.", "수정_ERROR", "error");
			} else if (!contentNull) {
				AlertMessage.setAlert(session, "내용을 입력해주세요.", "수정_ERROR", "error");
			} else {
				AlertMessage.setAlert(session, "에러가 발생했습니다.", "수정_ERROR", "error");
			}
			return "redirect:/board/updateForm.do?boardIdx=" + boardIdx;
		} else {
			AlertMessage.setAlert(session, "잘못된 접근", "접근_ERROR", "error");
			return "redirect:/board/list.do";
		}
	}

	// 게시물 삭제
	@PostMapping("delete.do")
	public String deleteBoard(Board board, HttpSession session) {
		int result = boardService.deleteBoard(board);
		if (result > 0) {
			AlertMessage.setAlert(session, "삭제 성공", "Success", "success");
			return "redirect:/board/list.do";
		} else {
			AlertMessage.setAlert(session, "삭제 실패", "ERROR", "error");
			return "redirect:/board/list.do";
		}
	}
}
