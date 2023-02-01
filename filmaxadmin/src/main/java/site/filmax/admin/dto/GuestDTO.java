package site.filmax.admin.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class GuestDTO {
	private boolean ruleagree;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date birth;
	private String phone;
	private String password;
	private String password_check;
	private Date joindate;
}
