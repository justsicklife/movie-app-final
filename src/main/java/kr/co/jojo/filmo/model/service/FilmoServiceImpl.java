package kr.co.jojo.filmo.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jojo.filmo.model.dao.FilmoDAO;
import kr.co.jojo.filmo.model.dto.Filmo;

@Service
public class FilmoServiceImpl implements FilmoService{

	@Autowired
	FilmoDAO filmoDAO;
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public int insertFilmo(Filmo filmo) {
		return filmoDAO.insertFilmo(sqlSession, filmo);
	}
	
	@Override
	public List<Filmo> selectFilmoByStaffId(int staffIdx) {
		return filmoDAO.selectFilmoByStaffId(sqlSession, staffIdx);
	}

	@Override
	public List<Filmo> selectFilmoByMovieId(int movieIdx) {
		return filmoDAO.selectFilmoByMovieId(sqlSession, movieIdx);
	}

	

}

