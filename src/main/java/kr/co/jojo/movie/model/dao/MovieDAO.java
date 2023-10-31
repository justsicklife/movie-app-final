package kr.co.jojo.movie.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.co.jojo.board.model.dto.Board;
import kr.co.jojo.movie.model.dto.Movie;

@Repository
public class MovieDAO {
	
	// 전체 영화 수 구하기
	public int selectListCount(SqlSessionTemplate sqlSession, String searchMovie) {
		return sqlSession.selectOne("movieMapper.selectListCount", searchMovie);
	}
	
	// 영화 목록 불러오기
	public List<Movie> selectListAll(SqlSessionTemplate sqlSession, String searchMovie) {
		return sqlSession.selectList("movieMapper.selectListAll", searchMovie);
	}
	
	// 영화 상세보기
	public Movie detailMovie(SqlSessionTemplate sqlSession, int idx) {
		return sqlSession.selectOne("movieMapper.detailMovie", idx);
	}
	
	// 하형코드
	// 영화 추가
	public int insertMovie(SqlSessionTemplate sqlSession, Movie movie) {
		return sqlSession.insert("movieMapper.insertMovie", movie);
	}
	
	public int selectMovieId(SqlSessionTemplate sqlSession, Movie movie) {
		return sqlSession.selectOne("movieMapper.selectMovieId", movie);
	}

	public Movie selectMovieById(SqlSessionTemplate sqlSession, int movieIdx) {
		return sqlSession.selectOne("movieMapper.selectMovieById", movieIdx);
	}
	
	// 좋아요 영화추천
	public List<Movie> rankMovie(SqlSessionTemplate sqlSession) {
		return sqlSession.selectList("movieMapper.rankMovie");
	}
	
	public int updateLike(SqlSessionTemplate sqlSession, Movie movie) {
		return sqlSession.update("movieMapper.updateLike",movie);
	}
	
}
