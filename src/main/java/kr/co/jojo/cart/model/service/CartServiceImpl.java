package kr.co.jojo.cart.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jojo.cart.model.dao.CartDao;
import kr.co.jojo.cart.model.dto.CartDto;
import kr.co.jojo.cart.model.dto.CartMovie;

@Service
public class CartServiceImpl implements CartService {

	@Autowired
	private CartDao cartDao;

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<CartMovie> detailCart(int idx) {
		return cartDao.detailCart(sqlSession, idx);
	}

	@Override
	public List<CartDto> selectListCart(int idx) {
		return cartDao.selectListCart(sqlSession, idx);
	}
	
	@Override
	public void deleteCart(CartDto cartDto) {
		cartDao.deleteCart(sqlSession, cartDto);
	}

	@Override
	public void insertCart(CartDto cartDto) {
		cartDao.insertCart(sqlSession, cartDto);
	}

	@Override
	public CartDto checkedCart(CartDto cartDto) {
		return cartDao.checkedCart(sqlSession, cartDto);
	}

}