package kr.co.jojo.mymovie.model.service;

import java.util.List;

import kr.co.jojo.mymovie.model.dto.MyMovieDto;
import kr.co.jojo.mymovie.model.dto.MyMovieMovie;

public interface MyMovieService {

	List<MyMovieMovie> detailMyMovie(int idx);

	public void deleteMyMovie(MyMovieDto mymovieDto);

	List<MyMovieDto> selectListMyMovie(int idx);

	public void insertMyMovie(MyMovieDto mymovieDto);

	MyMovieDto checkedMyMovie(MyMovieDto mymovieDto);
}