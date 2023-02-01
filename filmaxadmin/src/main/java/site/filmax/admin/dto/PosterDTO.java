package site.filmax.admin.dto;

import lombok.Data;

@Data
public class PosterDTO {
	private int poster_id;
	private int movie_seq;
	private String poster;
	private int levels;
}
