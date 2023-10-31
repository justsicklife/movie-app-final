package kr.co.jojo.comment.model.dto;

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
public class Comment {
	private int commentIdx;
	private int boardIdx;
	private int memberIdx;
	private String commentWriter;
	private String commentContent;
	private String commentInDate;
	private String commentDelDate;
}
