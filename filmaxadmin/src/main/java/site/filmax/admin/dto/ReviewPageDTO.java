package site.filmax.admin.dto;

import lombok.Data;

@Data
public class ReviewPageDTO {
	private int startPage;
	private int endPage;
	private boolean prev, next;
	private int total;
}
