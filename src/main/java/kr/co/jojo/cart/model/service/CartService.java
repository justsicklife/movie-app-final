package kr.co.jojo.cart.model.service;

import java.util.List;

import kr.co.jojo.cart.model.dto.CartDto;
import kr.co.jojo.cart.model.dto.CartMovie;

public interface CartService {

   List<CartMovie> detailCart(int idx);
   
   public void deleteCart(CartDto cartDto);
   
   List<CartDto> selectListCart(int idx); 
   
   public void insertCart(CartDto cartDto);
   
   public CartDto checkedCart(CartDto cartDto);
}