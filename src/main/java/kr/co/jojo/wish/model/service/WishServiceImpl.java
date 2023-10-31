package kr.co.jojo.wish.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jojo.cart.model.dto.CartDto;
import kr.co.jojo.wish.model.dao.WishDao;
import kr.co.jojo.wish.model.dto.WishDto;
import kr.co.jojo.wish.model.dto.WishMovie;

@Service
public class WishServiceImpl implements WishService{

   @Autowired
   private WishDao wishDao;
   @Autowired
   private SqlSessionTemplate sqlSession;
   
   @Override
   public List<WishMovie> detailWish(int idx) {
      return wishDao.detailWish(sqlSession, idx);
   }
   
   @Override
   public List<WishDto> selectListWish(int idx) {
      return wishDao.selectListWish(sqlSession, idx);
   }

   @Override
   public void deleteWish(WishDto wishDto) {
      wishDao.deleteWish(sqlSession,wishDto);
   }

   @Override
   public void insertWish(WishDto wishDto) {
      wishDao.insertWish(sqlSession, wishDto);
   }

   @Override
	public WishDto checkedWish(WishDto wishDto) {
		return wishDao.checkedWish(sqlSession,wishDto);
	}
}