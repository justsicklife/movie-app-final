package kr.co.jojo.movie.controller;

import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Objects;
import java.util.Random;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import kr.co.jojo.common.template.AlertMessage;
import kr.co.jojo.filmo.controller.FilmoController;
import kr.co.jojo.filmo.model.dto.Filmo;
import kr.co.jojo.filmo.model.service.FilmoServiceImpl;
import kr.co.jojo.movie.model.dto.Movie;
import kr.co.jojo.movie.model.service.MovieServiceImpl;
import kr.co.jojo.review.model.dto.Review;
import kr.co.jojo.review.model.service.ReviewServiceImpl;
import kr.co.jojo.staff.model.dto.Staff;
import kr.co.jojo.staff.model.service.StaffServiceImpl;

@Controller
@RequestMapping("/movie")
public class MovieController {
	
	// 영화 포스터 업로드 경로
	public static final String UPLOAD_PATH = "D:\\web_Prj\\STS\\workspace-sts-3.9.18.RELEASE\\movie-app-main-10-31\\src\\main\\webapp\\resources\\uploads\\";

	@Autowired 
	FilmoController filmoController;
	@Autowired
	private MovieServiceImpl movieService;
	@Autowired
	private ReviewServiceImpl reviewService;
	@Autowired
	private FilmoServiceImpl filmoService;
	@Autowired
	private StaffServiceImpl staffService;
	
	@GetMapping("/list.do")
	public String movieList(@RequestParam(value="searchMovie", defaultValue="") String searchMovie,
							HttpSession session, Model model) {
		
		// 전체 영화 수 구하기
		int listCount = movieService.selectListCount(searchMovie);
		
		// 영화 목록 불러오기
		List<Movie> movieList = movieService.selectListAll(searchMovie);
		
		model.addAttribute("movieList", movieList);	// 객체 바인딩
		
		AlertMessage.getAlert(session, model);
		
		if (searchMovie.equals("")) {
			return "movie/home";	// /WEB-INF/views/movie/home.jsp로 포워딩			
		} else {
			return "movie/movie_search";
		}
	}
	
	// home.jsp에서 특정 영화를 클릭하면 해당 영화의 movieIdx와 함께 detail.do로 넘어옴
	@GetMapping("detail.do")
	public String detailMovie(@RequestParam(value="movieIdx") int movieIdx, Model model, HttpSession session, HttpServletRequest req) {
		// 선택한 영화 정보 불러오기 (movie-mapper)
		Movie detail = movieService.detailMovie(movieIdx);
		
		// 좋아요 / 영화추천
		List<Movie> likeMovie = movieService.rankMovie();
		
		// 가격에 콤마 표시
		int priceFront = 0;
		int thousand = 0;
		int hundred = 0;
		int ten = 0;
		int priceAll = detail.getMoviePrice();
		String priceNew = "";
		
		if (detail.getMoviePrice() >= 1000) {
			priceFront = priceAll / 1000;
			thousand = priceAll % 1000;
			hundred = priceAll % 100;
			ten = priceAll % 10;
			priceNew = priceFront + "," + thousand + hundred + ten;
		}
		if (!priceNew.equals("")) {
			model.addAttribute("priceNew", priceNew);
		}
		
		// 리뷰 불러오기 (review-mapper)
		List<Review> reviewList = reviewService.selectListAll(movieIdx);
		
		// 출연진 불러오기 (filmo-mapper)
		List<Filmo> filmoList = filmoService.selectFilmoByMovieId(movieIdx);
		List<Staff> staffList = new ArrayList<>();
		
//		int userId =  (int) session.getAttribute("memberIdx");
		
		for (int i=0; i < filmoList.size(); i++) {
			staffList.add(staffService.selectStaffById(filmoList.get(i).getStaffIdx()));
		}
		
		// 현재 페이지 URL 주소 전달
		String url = req.getRequestURL().toString();
		url += "?movieIdx=";
		url += movieIdx;
		req.setAttribute("url", url);
		
		
		System.out.println(detail);
		System.out.println(reviewList);
		if (!Objects.isNull(detail)) {
			model.addAttribute("detail", detail);			// 영화 정보
			System.out.println(detail.getMovieLike());
			model.addAttribute("reviewList", reviewList);	// 리뷰 정보
			model.addAttribute("staffList", staffList);		// 출연진 정보
//			model.addAttribute("loginMemberIdx", session.getAttribute("memberIdx"));
//			model.addAttribute("memberIndex",userId);
			model.addAttribute("memberIdx", session.getAttribute("memberIdx"));
			model.addAttribute("rankMovie", likeMovie);
			
			AlertMessage.getAlert(session, model);
			
			return "movie/movie";
		} else {
			return "common/errorPage";
		}
	}
	
	// 관리자 계정일 경우 영화 추가 페이지로 이동
	@GetMapping("/registerForm.do")
	public String registerForm(HttpSession session, Model model) {
		AlertMessage.getAlert(session, model);
		return "movie/movie_register";
	}
	
	// 관리자가 영화 추가
	@PostMapping("/register.do")
	public String registerMovie(MultipartFile upload, Movie movie,@RequestParam(value="genre", defaultValue="") String[] genre, 
								HttpSession session, @RequestParam(value="id", defaultValue="") int[] numberList) {

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
			movie.setMovieUploadPath(UPLOAD_PATH);
			movie.setMovieUploadName(originalName);
			movie.setMovieUploadOriginName(fileName);
			System.out.println(movie);
			
		} else {
			AlertMessage.setAlert(session, "사진을 업로드해주세요.", "Error", "error");
			return "redirect:/movie/registerForm.do";
		}
		
		// 장르 저장
		System.out.println("genre: " + genre);
		Arrays.sort(genre);
		String genreStr = "";
		for (int i = 0 ; i < genre.length; i++) {
			genreStr += genre[i];
			if (i != genre.length - 1) {
				genreStr += ", ";
			}
		}
		System.out.println("genreStr: " + genreStr);
		movie.setMovieGenre(genreStr);
		
		if (genreStr.trim().equals("")) {
			AlertMessage.setAlert(session, "장르를 선택해주세요.", "ERROR", "error");
			return "redirect:/movie/registerForm.do";
		}
		
		int result = movieService.insertMovie(movie);
		
		System.out.println(movie);
		int id = movieService.selectMovieId(movie);
		System.out.println(id);

		for (int i = 0 ; i < numberList.length ; i++) {
			Filmo f= new Filmo(0, id, numberList[i]);
			filmoController.insertFilmo(f);
		}
		
		AlertMessage.setAlert(session, "영화 추가 성공!!!", "Success", "success");
		return "redirect:/movie/list.do";
				
	}
}
