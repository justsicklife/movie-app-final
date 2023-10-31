package kr.co.jojo.filmo.model.service;

import java.util.List;

import kr.co.jojo.filmo.model.dto.Filmo;

public interface FilmoService {
	
	int insertFilmo(Filmo filmo);
	
	// staff_list.jsp에서 스태프 목록 불러오기
	List<Filmo> selectFilmoByStaffId(int staffIdx);
	
	// movie.jsp에서 출연진 목록 불러오기
	List<Filmo> selectFilmoByMovieId(int movieIdx);
}
