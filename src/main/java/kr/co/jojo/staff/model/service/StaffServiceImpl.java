package kr.co.jojo.staff.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jojo.staff.model.dao.StaffDAO;
import kr.co.jojo.staff.model.dto.Staff;

@Service
public class StaffServiceImpl implements StaffService{

	@Autowired
	StaffDAO staffDAO;
	@Autowired
	SqlSessionTemplate sqlSession;
	
	
	@Override
	public int insertStaff(Staff staff) {
		return staffDAO.insertStaff(sqlSession, staff);
	}
	
	@Override
	public List<Staff> selectStaffAll() {
		return staffDAO.staffSelectAll(sqlSession);
	}

	@Override
	public Staff selectStaffById(int staffIdx) {
		return staffDAO.staffSelectById(sqlSession, staffIdx);
	}
}
