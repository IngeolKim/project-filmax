package org.spring.sboard.dto;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class SboardDTO {
	private int num;
	private String writer;
	private String subject;
	private String email;
	private String pw;
	private String content;
	private Date reg;
	private int files;
	private int readCount;
	private int	likes;
	private int ref;
	private int boardType;
	private int levels;
	private int step;
	private int start;
	private int end;
}
