package kr.co.jojo.mymovie.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jojo.mymovie.model.dao.MyMovieDao;
import kr.co.jojo.mymovie.model.dto.MyMovieDto;
import kr.co.jojo.mymovie.model.dto.MyMovieMovie;

@Service
public class MyMovieServiceImpl implements MyMovieService {

	@Autowired
	private MyMovieDao mymovieDao;

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<MyMovieMovie> detailMyMovie(int idx) {
		return mymovieDao.detailMyMovie(sqlSession, idx);
	}

	@Override
	public List<MyMovieDto> selectListMyMovie(int idx) {
		return mymovieDao.selectListMyMovie(sqlSession, idx);
	}

	@Override
	public void deleteMyMovie(MyMovieDto mymovieDto) {
		mymovieDao.deleteMyMovie(sqlSession, mymovieDto);
	}

	@Override
	public void insertMyMovie(MyMovieDto mymovieDto) {
		mymovieDao.insertMyMovie(sqlSession, mymovieDto);
	}

	@Override
	public MyMovieDto checkedMyMovie(MyMovieDto mymovieDto) {
		return mymovieDao.checkedMyMovie(sqlSession, mymovieDto);
	}

}