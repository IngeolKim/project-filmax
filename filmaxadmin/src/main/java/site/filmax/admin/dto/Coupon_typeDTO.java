package site.filmax.admin.dto;

import java.util.Date;

import lombok.Data;

@Data
public class Coupon_typeDTO {
	private String user_id;
	private int type;
	private String name;
	private String info;
	private int sale;
	private int expiredate;
}
