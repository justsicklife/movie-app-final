package kr.co.jojo.wish.model.dto;

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
public class WishMember {
	
	private String member_name;
	private String member_email;
	private String member_id;
	
}
