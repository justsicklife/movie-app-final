package kr.co.jojo.staff.controller;

import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Random;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.co.jojo.common.template.AlertMessage;
import kr.co.jojo.filmo.model.dto.Filmo;
import kr.co.jojo.filmo.model.service.FilmoServiceImpl;
import kr.co.jojo.movie.model.dto.Movie;
import kr.co.jojo.movie.model.service.MovieServiceImpl;
import kr.co.jojo.staff.model.dto.Staff;
import kr.co.jojo.staff.model.service.StaffServiceImpl;

@Controller
@RequestMapping("/staff")
public class StaffController {

	public static final String UPLOAD_PATH = "D:\\web_Prj\\STS\\workspace-sts-3.9.18.RELEASE\\movie-app-main-10-31\\src\\main\\webapp\\resources\\uploads\\";
	
	@Autowired
	StaffServiceImpl staffService;
	@Autowired
	FilmoServiceImpl filmoService;
	@Autowired
	MovieServiceImpl movieService;
	
	// 관리자 계정일 경우 영화 관계자 추가 페이지로 이동
	@GetMapping("/registerForm.do")
	public String registerForm(HttpSession session, Model model) {
		AlertMessage.getAlert(session, model);
		return "staff/staff_register";
	}
	
	@PostMapping("/register.do")
	public String registerStaff(Staff s, MultipartFile upload, HttpSession session) { 
		
		if (!upload.isEmpty()) {
			
			String originalName = upload.getOriginalFilename();
		
			String extension = originalName.substring(originalName.lastIndexOf("."));
			
			LocalDateTime now = LocalDateTime.now();
			
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyMMddHHmmss");
			String output = now.format(formatter);
			
			int length = 8;
			String characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
			
			Random random = new Random();
			String randomString = random.ints(length,0,characters.length())
					.mapToObj(characters::charAt)
					.map(Object::toString)
					.collect(Collectors.joining());
			
			String fileName = (output + "_" + randomString + extension);
			String filePathName = UPLOAD_PATH + fileName;
			
			Path filePath = Paths.get(filePathName);
			
			try {
				upload.transferTo(filePath);
			} catch(IllegalStateException e) {
				e.printStackTrace();
			} catch(IOException e) {
				e.printStackTrace();
			}
			s.setStaffUploadPath(UPLOAD_PATH);
			s.setStaffUploadName(originalName);
			s.setStaffUploadOriginName(fileName);
			
			System.out.println(s);
		} else {
			AlertMessage.setAlert(session, "사진을 업로드해주세요.", "Error", "error");
			return "redirect:/staff/registerForm.do";
		}
		System.out.println(staffService.insertStaff(s));
		
		return "redirect:/staff/list.do";
	}

	@PostMapping("/ajax")
	@ResponseBody
	public void ajaxStaff(HttpServletResponse response) {
		List<Staff> list = staffService.selectStaffAll();
		JSONObject jsonDorian = new JSONObject();
		response.setCharacterEncoding("UTF-8");
		jsonDorian.put("list", list);
		System.out.println(jsonDorian);
		
		try {
			response.getWriter().print(jsonDorian);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@GetMapping("/list.do")
	public String staffList(Model m) {
		List<Staff> list = staffService.selectStaffAll();
		m.addAttribute("staffList",list);
		return "staff/staff_list";
	}
	
	@GetMapping("/detail.do")
	public String staffDetail(@RequestParam(value="id") int staffIdx,Model model) {
		Staff staff =staffService.selectStaffById(staffIdx);

		List<Filmo> filmoList = filmoService.selectFilmoByStaffId(staff.getStaffIdx());
		
		System.out.println(filmoList);
		
		List<Movie> movieList = new ArrayList<Movie>();
		
		for(int i = 0 ; i < filmoList.size() ; i++) {
			movieList.add(movieService.selectMovieById(filmoList.get(i).getMovieIdx()));
		}
		
		String outputAge = calculatorAge(staff.getStaffBirth());
		
		System.out.println(outputAge);
		
	     model.addAttribute("age",outputAge);
	     
		model.addAttribute("movieList", movieList);
		
		model.addAttribute("staff", staff);
		
		return "staff/staff_detail";
	}
	
	private String calculatorAge(Date inputAge) {
		Calendar now = Calendar.getInstance();
		int currentYear = now.get(Calendar.YEAR);
		
		//태어난년도를 위한 세팅
		 SimpleDateFormat format = new SimpleDateFormat("yyyy");
		 String stringBirthYear = format.format(inputAge); //년도만받기
		 //태어난 년도
		 Integer birthYear = Integer.parseInt(stringBirthYear);

		 // 현재 년도 - 태어난 년도 => 나이 (만나이X)
	     int age = (currentYear - birthYear +1);
	     String outputAge = Integer.toString(age);
		return outputAge;
	}
}
