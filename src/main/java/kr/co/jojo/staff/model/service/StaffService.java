package kr.co.jojo.staff.model.service;

import java.util.List;
import kr.co.jojo.staff.model.dto.Staff;

public interface StaffService {

	 int insertStaff(Staff s);
	 	 
	 public  List<Staff> selectStaffAll();
	 
	 public Staff selectStaffById(int idx);
	 
}
