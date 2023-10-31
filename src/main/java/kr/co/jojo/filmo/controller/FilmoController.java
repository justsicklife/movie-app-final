package kr.co.jojo.filmo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.jojo.filmo.model.dto.Filmo;
import kr.co.jojo.filmo.model.service.FilmoServiceImpl;

@Controller
@RequestMapping("/filmo")
public class FilmoController {
	
	@Autowired
	FilmoServiceImpl filmoService;
	
	@ResponseBody
	public int insertFilmo(Filmo filmo) {
		
		int result = filmoService.insertFilmo(filmo);
		return result;
	}
}
