package site.filmax.admin.dto;

import java.util.Date;

import lombok.Data;
@Data
public class ReviewDTO {
	private int reviews_seq;
	private int movie_seq;
	private String user_id;
	private Date reg;
	private String content;
	private int rating;
	private int start;
	private int end;
	private int count;
}
