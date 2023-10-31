package kr.co.jojo.cart.model.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class CartMovie extends CartMv{
	
	int movie_index;
	String movie_title;
	String movie_upload_origin_name;
	int movie_price;
	
}
