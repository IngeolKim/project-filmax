package site.filmax.admin.service;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import site.filmax.admin.dto.CouponDTO;
import site.filmax.admin.dto.Coupon_typeDTO;
import site.filmax.admin.dto.GuestDTO;
import site.filmax.admin.dto.LevelsDTO;
import site.filmax.admin.dto.MemberDTO;
import site.filmax.admin.dto.PointDTO;
import site.filmax.admin.dto.PointnameDTO;

public interface MemberService {
	public String main();
	public String memberList(MemberDTO dto, Model model);
	public String guestList(Model model);
	public String couponList(CouponDTO dto, Model model, MemberDTO dto1);
	public String searchCouponList(String search, String searchValue, Model model);
	public String coupon_typeList(Coupon_typeDTO dto, Model model);
	public String pointList(PointDTO dto, Model model, MemberDTO dto1);
	public String couponCreate();
	public String couponCreatePro(Coupon_typeDTO dto);
	public String couponAdd(String user_id, Model model);
	public String couponAddPro(Coupon_typeDTO dto);
	public String pointAdd(String user_id, Model model);
	public String pointAddPro(PointDTO dto);
	
	//로그인
	public String login();
	public String loginCh(MemberDTO dto , HttpSession session,LevelsDTO dto1);
	
	public String profile(MemberDTO dto, Model md);
	public String profileLevelsCh(MemberDTO dto,Model md,HttpSession session);

}
