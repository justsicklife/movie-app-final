package kr.co.jojo.movie.model.service;

import java.util.List;

import kr.co.jojo.movie.model.dto.Movie;

public interface MovieService {

	// 전체 게시글 수 구하기
	int selectListCount(String searchMovie);
	
	// 게시글 목록 불러오기
	List<Movie> selectListAll(String searchMovie);
	
	// 영화 상세보기
	Movie detailMovie(int idx);
	
	
	// 하형코드
	// 영화 추가
	int insertMovie(Movie movie);

	int selectMovieId(Movie movie) ;
	
	public Movie selectMovieById(int movieIdx);
	
	// 좋아요 영화추천
	public List<Movie> rankMovie();
	
	public int updateLike(Movie movie);
}
