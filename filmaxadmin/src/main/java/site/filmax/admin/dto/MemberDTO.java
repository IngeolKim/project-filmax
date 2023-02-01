package site.filmax.admin.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data

public class MemberDTO {

	private int user_no;
	private String user_id;
	private String user_pw;
	private String user_pwd;
	private String name;
	private String gender;
	//temp
	/*@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date birth;*/
	private String birth;
	private String phone;
	private String email;
	private int levels;
	private String levels_name;
	private Date joindate;
	private Date lastlogin;
	private String nickname;
	private String profile;
	private int marketing;
	private int staff;
	
	private int start;
	private int end;
}

