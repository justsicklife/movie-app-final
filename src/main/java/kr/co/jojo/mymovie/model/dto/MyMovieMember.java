package kr.co.jojo.mymovie.model.dto;

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
public class MyMovieMember {
	
	private String member_name;
	private String member_email;
	private String member_id;
	
}
