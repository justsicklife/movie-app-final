package kr.co.jojo.cart.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
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
import kr.co.jojo.cart.model.dto.CartMovie;
import kr.co.jojo.cart.model.dto.CartMv;
import kr.co.jojo.cart.model.service.CartServiceImpl;
import kr.co.jojo.mymovie.model.dto.MyMovieDto;
import kr.co.jojo.mymovie.model.service.MyMovieServiceImpl;

@Controller
@RequestMapping("/cart")
public class CartController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Autowired
	CartServiceImpl service;
	@Autowired
	MyMovieServiceImpl mymovieService;

	// 임시로
	int userId = 0;

	// 카트 목록
	@GetMapping("/myCart.do")
	public String getCartList(HttpSession session, Model model) {

		userId = (int) session.getAttribute("memberIdx");

		List<CartDto> cartList = service.selectListCart(userId);
		System.out.println(cartList);
		model.addAttribute("cartList", cartList);

		List<CartMovie> detailCart = service.detailCart(userId);
		System.out.println("detailCart: " + detailCart);
		List<CartMovie> CartMovieList = new ArrayList<>();

		for (int i = 0; i < detailCart.size(); i++) {
			CartMv cartMv = detailCart.get(i);

			CartMovie cartMovie = cartMv.getCartMovie();

			CartMovieList.add(new CartMovie(cartMovie.getMovie_index(), cartMovie.getMovie_title(),
					cartMovie.getMovie_upload_origin_name(), cartMovie.getMovie_price()));
		}

		System.out.println("cartMovieList: " + CartMovieList);
		model.addAttribute("userId", userId);
		model.addAttribute("detailCart", CartMovieList);

		return "cart/cart";
	}

	// 카트 선택 삭제
	@PostMapping(value = "/deleteCart")
	@ResponseBody
	public int ajaxTest(HttpServletRequest request, HttpSession session, Model model) throws Exception {

		String[] ajaxMsg = request.getParameterValues("valueArr");

		for (int i = 0; i < ajaxMsg.length; i++) {
			System.out.println(ajaxMsg[i]);
		}

		Integer wrapper_member_index = (Integer) session.getAttribute("memberIdx");
		int member_index = wrapper_member_index;

		System.out.println("member_index : " + member_index);

		int size = ajaxMsg.length;
		for (int i = 0; i < size; i++) {
			service.deleteCart(new CartDto(Integer.parseInt(ajaxMsg[i]), member_index));
		}

		return 1;
	}

	@PostMapping("/like")
	@ResponseBody
	public String like(HttpSession session, @RequestParam(value = "id") int id) {

		userId = (int) session.getAttribute("memberIdx");
		service.insertCart(new CartDto(id, userId));

		return "success";
	}

	@PostMapping("/unlike")
	@ResponseBody
	public String unlike(HttpSession session, @RequestParam(value = "id") int id) {

		userId = (int) session.getAttribute("memberIdx");

		service.deleteCart(new CartDto(id, userId));

		return "success";
	}
	
	// 0824 하형 코드 통합
	@PostMapping("/checked")
	@ResponseBody
	public String checked(@RequestParam(value = "member_index") int member_index,
			@RequestParam(value = "movie_index") int movie_index) {
		CartDto check = service.checkedCart(new CartDto(movie_index, member_index));
		
		MyMovieDto myMovieDto = mymovieService.checkedMyMovie(new MyMovieDto(movie_index,member_index));
		System.out.println("myMovieDto : " + myMovieDto);
		if (myMovieDto == null) {			
			if (check == null) {
				return "on";
			} else {
				return "off";
			}
		} else {
			return "keep";
		}
	}
}