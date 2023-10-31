package kr.co.jojo.wish.model.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.co.jojo.cart.model.dto.CartDto;
import kr.co.jojo.wish.model.dto.WishDto;
import kr.co.jojo.wish.model.dto.WishMovie;

@Repository
public class WishDao {

   private static String namespace = "wishMapper";

   
   
   public List<WishMovie> detailWish(SqlSessionTemplate sqlSession, int idx) {
      return sqlSession.selectList("wishMapper.detailWish", idx);
   }

   public List<WishDto> selectListWish(SqlSessionTemplate sqlSession, int idx) {
      return sqlSession.selectList("wishMapper.selectListWish", idx);
   }

   public void deleteWish(SqlSessionTemplate sqlSession, WishDto wishDto) {
      sqlSession.delete("wishMapper.deleteWish", wishDto);
   }

   public void insertWish(SqlSessionTemplate sqlSession, WishDto wishDto) {
      sqlSession.insert("wishMapper.insertWish", wishDto);

   }

	public WishDto checkedWish(SqlSessionTemplate sqlSession, WishDto wishDto) {
		return sqlSession.selectOne("wishMapper.checkedWish",wishDto);
	}
}