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
public class SboardLikeDTO {
	private int num;
	private int sboardNum;
	private String writer;
}
