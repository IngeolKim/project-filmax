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
public class SboardReplyDTO {
	private int num;
	private int boardNum;
	private int ref;
	private int levels;
	private int step;
	private String id;
	private String content;
	private Date reg;
}
