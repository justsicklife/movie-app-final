package kr.co.jojo.wish.controller;

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

import kr.co.jojo.movie.model.dto.Movie;
import kr.co.jojo.movie.model.service.MovieServiceImpl;
import kr.co.jojo.wish.model.dto.WishDto;
import kr.co.jojo.wish.model.dto.WishMovie;
import kr.co.jojo.wish.model.dto.WishMv;
import kr.co.jojo.wish.model.service.WishServiceImpl;

@Controller
@RequestMapping("/wish")
public class WishController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Autowired
	MovieServiceImpl movieService;
	@Autowired
	WishServiceImpl service;

	// 임시로
	int userId = 0;

	// 카트 목록
	@GetMapping("/myWish.do")
	public String getWishList(HttpSession session, Model model) {

		userId = (int) session.getAttribute("memberIdx");

		List<WishDto> wishList = service.selectListWish(userId);

		model.addAttribute("wishList", wishList);

		List<WishMovie> detailWish = service.detailWish(userId);

		session.setAttribute("MEMBER_INDEX", userId);

		List<WishMovie> WishMovieList = new ArrayList<>();

		for (int i = 0; i < detailWish.size(); i++) {
			WishMv wishMv = detailWish.get(i);

			WishDto wishDto = wishMv.getWish();

			WishMovie wishMovie = wishMv.getMovie();

			WishMovieList.add(new WishMovie(wishMovie.getMovie_index(), wishMovie.getMovie_title(),
					wishMovie.getMovie_upload_origin_name(), wishMovie.getMovie_price(), wishMovie.getMovie_genre(),
					wishMovie.getMovie_rating()));

		}

//      System.out.println("WishMovieList : " +  WishMovieList);

//      System.out.println(WishMovieList);
		model.addAttribute("detailWish", WishMovieList);
		model.addAttribute("memberIndex", userId);

//      views -> wish -> wish.jsp
		return "wish/wish";
	}

//    //카트 선택 삭제
//    @PostMapping(value = "/deleteWish")
//    @ResponseBody
//    public int ajaxTest(HttpServletRequest request, HttpSession session, Model model) throws Exception {
//            
//        String[] ajaxMsg = request.getParameterValues("valueArr");
//        
//        for(int i = 0 ; i < ajaxMsg.length; i++) {
//           System.out.println(ajaxMsg[i]);
//        }
//        
//        
//        Integer wrapper_member_index = (Integer)session.getAttribute("MEMBER_INDEX");
//        int member_index = wrapper_member_index;
//        
//        System.out.println("member_index : " + member_index);
//        
//        int size = ajaxMsg.length;
//        for(int i=0; i<size; i++) {
//           service.deleteWish(new WishDto(Integer.parseInt(ajaxMsg[i]),member_index));
//        }
//
//        return 1;
//    }

//   @PostMapping("/loadWish.do")
////   ResponseBody -> 스프링에서 비동기 처리시 return 값이 string이 아니어도 가능하게 함
//   @ResponseBody 
//   public void loadWishList(HttpSession session, Model model, HttpServletResponse response) throws Exception{
//
//      List<WishDto> list = service.selectListWish(userId);
//
//      JSONObject jsonoObj = new JSONObject();
//      
//      response.setCharacterEncoding("UTF-8");
//      jsonoObj.put("list", list);
////      System.out.println(jsonoObj);
//      
//      try {
//         response.getWriter().print(jsonoObj);
//      } catch (Exception e) {
//         e.printStackTrace();
//      }
//      
//   }

	@PostMapping("/like")
	@ResponseBody
	public String like(HttpSession session, @RequestParam(value = "id") int id) {
		userId = (int) session.getAttribute("memberIdx");
		service.insertWish(new WishDto(id, userId));
		
		Movie movie = movieService.selectMovieById(id);
		int like = movie.getMovieLike();
		movie.setMovieLike(like + 1);
		movieService.updateLike(movie);
		
		System.out.println("like");
		return "success";
	}

	@PostMapping("/unlike")
	@ResponseBody
	public String unlike(HttpSession session, @RequestParam(value = "id") int id) {
		userId = (int) session.getAttribute("memberIdx");

		service.deleteWish(new WishDto(id, userId));

		Movie movie = movieService.selectMovieById(id);
		int like = movie.getMovieLike();
		movie.setMovieLike(like - 1);
		movieService.updateLike(movie);
		
		System.out.println("unlike");

		return "success";
	}

	@PostMapping("/checked")
	@ResponseBody
	public String checked(@RequestParam(value = "member_index") int member_index,
			@RequestParam(value = "movie_index") int movie_index) {

		WishDto check = service.checkedWish(new WishDto(movie_index, member_index));
		System.out.println("check : " + check);
		if (check == null) {
			return "on";
		} else {
			return "off";
		}

	}
}