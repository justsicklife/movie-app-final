package kr.co.jojo.wish.model.service;

import java.util.List;

import kr.co.jojo.wish.model.dto.WishDto;
import kr.co.jojo.wish.model.dto.WishMovie;

public interface WishService {

	List<WishMovie> detailWish(int idx);

	public void deleteWish(WishDto wishDto);

	List<WishDto> selectListWish(int idx);

	public void insertWish(WishDto wishDto);

	WishDto checkedWish(WishDto wishDto);
}