package org.spring.smember.dto;

import java.util.Date;

import org.spring.sboard.dto.SboardDTO;

import lombok.Data;
@Data
public class SmemberDTO {
		private String id;
		private String pw;
		private String name;
		private String tel;
		private Date birth;		
		private String img;
		private int slevel;
		private Date reg;
	
}