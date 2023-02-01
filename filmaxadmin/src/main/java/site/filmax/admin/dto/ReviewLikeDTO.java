package site.filmax.admin.dto;

import lombok.Data;

@Data
public class ReviewLikeDTO {
	private int review_like_seq;
	private int movie_seq;
	private String user_id;
	private int reviews_seq;
}
