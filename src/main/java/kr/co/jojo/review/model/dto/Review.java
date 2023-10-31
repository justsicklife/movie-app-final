package kr.co.jojo.review.model.dto;

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
public class Review {
	private int reviewIdx;
	private int movieIdx;
	private int memberIdx;
	private String reviewWriter;
	private String reviewTitle;
	private String reviewContent;
	private String reviewInDate;
	private String reviewDelDate;
}
