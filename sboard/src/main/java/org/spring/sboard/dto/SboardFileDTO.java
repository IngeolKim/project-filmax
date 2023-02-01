package org.spring.sboard.dto;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class SboardFileDTO {
	private int num;
	private int sboardNum;
	private String fileName;
}
