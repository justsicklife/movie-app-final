package kr.co.jojo.movie.model.dto;

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
public class Movie {
	private int movieIdx;
	private String movieTitle;
	private String movieDirector;
	private String movieSummary;
	private String movieOpenDate;
	
	private String movieUploadPath;
	private String movieUploadName;
	private String movieUploadOriginName;
	private String movieTrailer;
	private String movieGenre;
	private int moviePrice;
	private String movieRating;
	private int movieLike;
}
