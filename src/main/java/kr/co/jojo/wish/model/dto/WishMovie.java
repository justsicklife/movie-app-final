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
public class WishMovie extends WishMv{
	
	int movie_index;
	String movie_title;
	String movie_upload_origin_name;
	int movie_price;
	String movie_genre;
	String movie_rating;
	
}
