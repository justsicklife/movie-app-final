package kr.co.jojo.board.model.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Board {
	private int boardIdx;
	private int boardMemberIdx;
	private String boardTitle;
	private String boardContent;
	private String boardInDate;
	private String boardDelDate;
	private String boardWriter;
	private String boardCategory;
	private int boardViews;
	
	// file upload
	// 업로드 경로, 원본 파일명, 파일명
	private String uploadPath;
	private String originalName;
	private String fileName;
	
	// 댓글 개수
	private int boardCommentCnt;
}
