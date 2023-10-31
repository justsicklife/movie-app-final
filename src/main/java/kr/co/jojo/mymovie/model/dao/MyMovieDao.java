package kr.co.jojo.mymovie.model.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.co.jojo.mymovie.model.dto.MyMovieDto;
import kr.co.jojo.mymovie.model.dto.MyMovieMovie;

@Repository
public class MyMovieDao {

	private static String namespace = "mymovieMapper";

	public List<MyMovieMovie> detailMyMovie(SqlSessionTemplate sqlSession, int idx) {
		return sqlSession.selectList("mymovieMapper.detailMyMovie", idx);
	}

	public List<MyMovieDto> selectListMyMovie(SqlSessionTemplate sqlSession, int idx) {
		return sqlSession.selectList("mymovieMapper.selectListMyMovie", idx);
	}

	public void deleteMyMovie(SqlSessionTemplate sqlSession, MyMovieDto mymovieDto) {
		sqlSession.delete("mymovieMapper.deleteMyMovie", mymovieDto);
	}

	public void insertMyMovie(SqlSessionTemplate sqlSession, MyMovieDto mymovieDto) {
		sqlSession.insert("mymovieMapper.insertMyMovie", mymovieDto);
	}

	public MyMovieDto checkedMyMovie(SqlSessionTemplate sqlSession, MyMovieDto mymovieDto) {
		return sqlSession.selectOne("mymovieMapper.checkedMyMovie", mymovieDto);
	}
}