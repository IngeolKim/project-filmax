package site.filmax.admin.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import site.filmax.admin.service.MemberService;
import site.filmax.admin.dto.CouponDTO;
import site.filmax.admin.dto.Coupon_typeDTO;
import site.filmax.admin.dto.PointDTO;
import site.filmax.admin.dto.PointnameDTO;
import site.filmax.admin.dto.GuestDTO;
import site.filmax.admin.dto.LevelsDTO;
import site.filmax.admin.dto.MemberDTO;

@Controller
@RequestMapping("/member/*")
public class MemberController {
	@Autowired
	private MemberService service;
	
	// 마이페이지 메인
	@GetMapping("main")
	public String user_main() {
		return service.main();
	}
	
	@GetMapping("memberList")
	public String user_memberList(MemberDTO dto, String birth, Model model,
			@RequestParam(value="pageNum" ,required=false ,defaultValue = "1") int pageNum,
			@RequestParam(value="levels" , required=false ,defaultValue = "0") int levels) {
		int pageSize = 10;
		int start = (pageNum -1) * pageSize +1;
		int end = pageNum * pageSize;
		dto.setStart(start);
		dto.setEnd(end);
		model.addAttribute("pageSize" , pageSize);
		model.addAttribute("levels", levels);
		return service.memberList(dto, model);
	}
	
	@GetMapping("loginForm")
	public String login() {
		return service.login();
	}
	@PostMapping("loginPro")
	public String loginPro(MemberDTO dto , HttpSession session,LevelsDTO dto1) {
		return service.loginCh(dto , session,dto1);
	}
	@GetMapping("profile")
	public String user_profile(MemberDTO dto, Model md) {
		return service.profile(dto, md);
	}
	@PostMapping("profilePro")
	public String profilePro(MemberDTO dto,Model md,HttpSession session) {
		return service.profileLevelsCh(dto, md, session);
	}
	// 로그아웃
	@GetMapping("logout")
	public String logout(HttpSession session) {
		session.invalidate(); //모든 세션삭제
		return "redirect:loginForm";
	}
	
	@GetMapping("guestList")
	public String guestList(Model model){
		return service.guestList(model);
	}
	
	@GetMapping("couponList")
	public String couponList(CouponDTO dto, Model model, MemberDTO dto1) {
		return service.couponList(dto, model, dto1);
	}
	@GetMapping("searchCouponList")
	public String searchCouponList(String search, String searchValue, Model model) {
		return service.searchCouponList(search, searchValue, model);
	}
	@GetMapping("coupon_typeList")
	public String coupon_typeList(Coupon_typeDTO dto, Model model) {
		return service.coupon_typeList(dto, model);
	}
	
	@GetMapping("pointList") // 전체회원 포인트목록
	public String pointList(PointDTO dto, Model model, MemberDTO dto1) {
		return service.pointList(dto, model, dto1);
	}
	
	@GetMapping("couponCreate") // 쿠폰 생성
	public String couponCreate() {
		return service.couponCreate();
	}
	@GetMapping("couponCreatePro")
	public String couponCreatePro(Coupon_typeDTO dto) {
		return service.couponCreatePro(dto);
	}
	
	@GetMapping("couponAdd") // 쿠폰 지급
	public String couponAdd(String user_id, Model model) {
		return service.couponAdd(user_id, model);
	}
	@PostMapping("couponAddPro")
	public String couponAddPro(Coupon_typeDTO dto, String typedate) {
		String [] td = typedate.split("-"); // "-"를 기준으로 앞뒤 변수생성 - 배열 리턴
		dto.setType(Integer.parseInt(td[0]) );
		dto.setExpiredate(Integer.parseInt(td[1]) );
		return service.couponAddPro(dto);
	}

	@GetMapping("pointAdd")
	public String pointAdd(String user_id, Model model) {
		return service.pointAdd(user_id, model);
	}
	@PostMapping("pointAddPro")
	public String pointAddPro(PointDTO dto) {
		return service.pointAddPro(dto);
	}
	
	
	
	
}
