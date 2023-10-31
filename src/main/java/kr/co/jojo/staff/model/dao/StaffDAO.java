package kr.co.jojo.staff.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.co.jojo.staff.model.dto.Staff;

@Repository
public class StaffDAO {

	public int insertStaff(SqlSessionTemplate sqlSession, Staff staff) {
		return sqlSession.insert("staffMapper.insertStaff", staff);
	}

	public List<Staff> staffSelectAll(SqlSessionTemplate sqlSession) {
		return sqlSession.selectList("staffMapper.selectStaffAll");
	}

	public Staff staffSelectById(SqlSessionTemplate sqlSession, int staffIdx) {
		return sqlSession.selectOne("staffMapper.selectStaffById", staffIdx);
	}

}
