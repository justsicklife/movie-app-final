package kr.co.jojo.mymovie.model.dto;

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
public class MyMovieMb {

	private MyMovieDto mymovie;
	
	private MyMovieMember member;
}
