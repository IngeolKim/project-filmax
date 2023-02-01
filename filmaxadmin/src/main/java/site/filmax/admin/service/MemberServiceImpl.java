package site.filmax.admin.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import site.filmax.admin.dto.CouponDTO;
import site.filmax.admin.dto.Coupon_typeDTO;
import site.filmax.admin.dto.GuestDTO;
import site.filmax.admin.dto.LevelsDTO;
import site.filmax.admin.dto.MemberDTO;
import site.filmax.admin.dto.PointDTO;
import site.filmax.admin.dto.PointnameDTO;
import site.filmax.admin.dao.MemberMapper;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	public MemberMapper mapper;
	
	@Override
	public String main() {
		return "member/main";
	}

	@Override // 회원목록
	public String memberList(MemberDTO dto, Model model) {
		if(dto.getLevels() == 0) { // <옵션>회원아이디</옵션>를 선택했을때
			model.addAttribute("list", mapper.memberList());
			model.addAttribute("count", mapper.mCount()); 
		} else {
			model.addAttribute("list", mapper.idLevels(dto));  //레벨에맞춰 아이디 나옴
			model.addAttribute("count", mapper.mlCount(dto.getLevels())); 
			model.addAttribute("levels", dto.getLevels());
		}
		model.addAttribute("LT", mapper.levelsType()); //레벨이름 타입	
		return "member/memberList";
	}
	
	@Override // 비회원목록
	public String guestList(Model model) {
		model.addAttribute("glist", mapper.guestList());
		return "member/guestList";
	}
	
	@Override // 쿠폰목록
	public String couponList(CouponDTO dto, Model model, MemberDTO dto1) {
		if(dto.getIdCoupon() == null) { // <옵션>회원아이디</옵션>를 선택했을때
			model.addAttribute("clist", mapper.couponList()); // 전체쿠폰목록
		} else {
			model.addAttribute("clist", mapper.coupon_id(dto.getIdCoupon())); // 회원아이디로 검색
		}
		model.addAttribute("mlist", mapper.member_id(dto1));
		return "member/couponList";
	}
	
	@Override // 쿠폰검색
	public String searchCouponList(String search, String searchValue, Model model) {
		model.addAttribute("clist", mapper.searchCouponList(search, searchValue));
		model.addAttribute("search", search);
		model.addAttribute("searchValue", searchValue);
		return "member/searchCouponList";
	}

	@Override // 쿠폰타입목록
	public String coupon_typeList(Coupon_typeDTO dto, Model model) {
		model.addAttribute("ilist", mapper.coupon_typeList());
		return "member/coupon_typeList";
	}
	
	@Override // 포인트목록
	public String pointList(PointDTO dto, Model model, MemberDTO dto1) {
		if(dto.getIdPoint() == null) {
			model.addAttribute("plist", mapper.pointList());
		} else {
			model.addAttribute("plist", mapper.point_id(dto.getIdPoint()));
		}
		model.addAttribute("mlist", mapper.member_id(dto1));
		return "member/pointList";
	}

	@Override
	public String couponCreate() {
		return "member/couponCreate";
	}

	@Override
	public String couponCreatePro(Coupon_typeDTO dto) {
		mapper.couponCreate(dto);
		return "member/couponCreatePro";
	}

	@Override
	public String couponAdd(String user_id, Model model) {
		model.addAttribute("typeList", mapper.coupon_typeList());
		model.addAttribute("user_id", user_id);
		return "member/couponAdd";
	}

	@Override
	public String couponAddPro(Coupon_typeDTO dto) {
		mapper.couponAdd(dto);
		return "member/couponAddPro";
	}
	
	@Override
	public String pointAdd(String user_id, Model model) {
		model.addAttribute("pointnameList", mapper.pointnameList());
		model.addAttribute("user_id", user_id);
		return "member/pointAdd";
	}
	
	@Override
	public String pointAddPro(PointDTO dto) {
		mapper.pointUpdate(dto);
		return "member/pointAddPro";
	}

	public String login() {
		return "member/loginForm";
	}
	public String loginCh(MemberDTO dto , HttpSession session,LevelsDTO dto1) {
		String result = "member/loginPro";
		int count = mapper.idCount(dto);
		if(count == 1) {
			session.setAttribute("uid" , dto.getUser_id()); //아이디 확인 로그인
		
			session.setAttribute("stf",dto1.getStaff() ); //스테프 일경우 로그인 
			mapper.loginTime(dto);
			result = "redirect:/static/dashboard";
		}
	
		return result;
	}
	public String profile(MemberDTO dto, Model md) {
		md.addAttribute("dto", mapper.profile(dto));
		if(dto.getStaff() == 0) {
			md.addAttribute("list", mapper.levelsType());
		}else	{
		}
		return "member/profile";
	}
	public String profileLevelsCh(MemberDTO dto, Model md, HttpSession session) {
		int count = mapper.levelsCh(dto);
		md.addAttribute("count", count);
		return "member/profilePro"; 
	}
	
	
	
}
