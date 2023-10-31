package kr.co.jojo.mymovie.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.jojo.cart.model.dto.CartDto;
import kr.co.jojo.cart.model.service.CartServiceImpl;
import kr.co.jojo.mymovie.model.dto.MyMovieDto;
import kr.co.jojo.mymovie.model.dto.MyMovieMovie;
import kr.co.jojo.mymovie.model.dto.MyMovieMv;
import kr.co.jojo.mymovie.model.service.MyMovieServiceImpl;

@Controller
@RequestMapping("/mymovie")
public class MyMovieController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Autowired
	MyMovieServiceImpl service;
	@Autowired
	CartServiceImpl cartService;

	// 임시로
	int userId = 0;

	// 카트 목록
	@GetMapping("/list.do")
	public String getMyMovieList(HttpSession session, Model model) {

		userId = (int) session.getAttribute("memberIdx");

		List<MyMovieDto> mymovieList = service.selectListMyMovie(userId);
		model.addAttribute("mymovieList", mymovieList);

		List<MyMovieMovie> detailMyMovie = service.detailMyMovie(userId);

		session.setAttribute("MEMBER_INDEX", userId);

		List<MyMovieMovie> MyMovieMovieList = new ArrayList<>();

		for (int i = 0; i < detailMyMovie.size(); i++) {

			MyMovieMv mymovieMv = detailMyMovie.get(i);
			MyMovieMovie mymovieMovie = mymovieMv.getMovie();

			MyMovieMovieList.add(new MyMovieMovie(

					mymovieMovie.getMovie_index(), mymovieMovie.getMovie_title(),
					mymovieMovie.getMovie_upload_origin_name(), mymovieMovie.getMovie_price()));
		}
		model.addAttribute("detailMyMovie", MyMovieMovieList);

		return "mymovie/mymovie";
	}

	// 0824 하형 코드 통합
	@PostMapping("/add")
	@ResponseBody
	public String mymovieAdd(@RequestParam(value = "movieId") int[] movieId,
			@RequestParam(value = "memberId") int memberId) {
		for (int i = 0; i < movieId.length; i++) {
			service.insertMyMovie(new MyMovieDto(movieId[i], memberId));
			cartService.deleteCart(new CartDto(movieId[i], memberId));
		}
		return "success";
	}
}