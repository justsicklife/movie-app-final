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
public class CartDto {
	
	private int movie_index;
	private int member_index;
	
//	private String member_name;
//	private String member_email;
//	private String member_id;
	
//	private CartMember cartMember;
}
