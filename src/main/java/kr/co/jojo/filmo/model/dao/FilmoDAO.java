package kr.co.jojo.filmo.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.co.jojo.filmo.model.dto.Filmo;

@Repository
public class FilmoDAO {

	public int insertFilmo(SqlSessionTemplate sqlSession, Filmo filmo) {
		return sqlSession.insert("filmoMapper.insertFilmo", filmo);
	}

	public List<Filmo> selectFilmoByStaffId(SqlSessionTemplate sqlSession, int staffIdx) {
		return sqlSession.selectList("filmoMapper.selectFilmoByStaffId", staffIdx);
	}
	
	public List<Filmo> selectFilmoByMovieId(SqlSessionTemplate sqlSession, int movieIdx) {
		return sqlSession.selectList("filmoMapper.selectFilmoByMovieId", movieIdx);
	}

}
