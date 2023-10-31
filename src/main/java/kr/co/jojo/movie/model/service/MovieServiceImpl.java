package kr.co.jojo.movie.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jojo.movie.model.dao.MovieDAO;
import kr.co.jojo.movie.model.dto.Movie;

@Service
public class MovieServiceImpl implements MovieService {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Autowired
	private MovieDAO movieDAO;

	// 전체 영화 수 구하기
	@Override
	public int selectListCount(String searchMovie) {
		return movieDAO.selectListCount(sqlSession, searchMovie);
	}

	// 영화 목록 불러오기
	@Override
	public List<Movie> selectListAll(String searchMovie) {
		return movieDAO.selectListAll(sqlSession, searchMovie);
	}

	// 영화 상세보기
	@Override
	public Movie detailMovie(int idx) {
		return movieDAO.detailMovie(sqlSession, idx);
	}

	// 하형코드
	// 영화 추가
	@Override
	public int insertMovie(Movie movie) {
		return movieDAO.insertMovie(sqlSession, movie);
	}

	@Override
	public int selectMovieId(Movie movie) {
		return movieDAO.selectMovieId(sqlSession, movie);
	}
	
	@Override
	public Movie selectMovieById(int movieIdx) {
		return movieDAO.selectMovieById(sqlSession, movieIdx);
	}
	
	// 좋아요 영화 추천
	@Override
	public List<Movie> rankMovie() {
		return movieDAO.rankMovie(sqlSession);
	}

	@Override
	public int updateLike(Movie movie) {
		return movieDAO.updateLike(sqlSession, movie);
	}
	
}
