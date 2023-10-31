package kr.co.jojo.cart.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.co.jojo.cart.model.dto.CartDto;
import kr.co.jojo.cart.model.dto.CartMovie;

@Repository
public class CartDao {

	private static String namespace = "cartMapper";

	public List<CartMovie> detailCart(SqlSessionTemplate sqlSession, int idx) {
		return sqlSession.selectList("cartMapper.detailCart", idx);
	}

	public List<CartDto> selectListCart(SqlSessionTemplate sqlSession, int idx) {
		return sqlSession.selectList("cartMapper.selectListCart", idx);
	}

	public void deleteCart(SqlSessionTemplate sqlSession, CartDto cartDto) {
		sqlSession.delete("cartMapper.deleteCart", cartDto);
	}

	public void insertCart(SqlSessionTemplate sqlSession, CartDto cartDto) {
		sqlSession.insert("cartMapper.insertCart", cartDto);
	}

	public CartDto checkedCart(SqlSessionTemplate sqlSession, CartDto cartDto) {
		return sqlSession.selectOne("cartMapper.checkedCart", cartDto);
	}

}