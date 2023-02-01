package site.filmax.admin.dao;

import java.util.HashMap;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import site.filmax.admin.dto.CouponDTO;
import site.filmax.admin.dto.GuestDTO;
import site.filmax.admin.dto.LevelsDTO;
import site.filmax.admin.dto.MemberDTO;
import site.filmax.admin.dto.Coupon_typeDTO;
import site.filmax.admin.dto.PointDTO;
import site.filmax.admin.dto.PointnameDTO;

public interface MemberMapper {

	public List<MemberDTO> memberList();
	public List<MemberDTO> member_id(MemberDTO dto);
	
	
	public MemberDTO profile(MemberDTO dto);
	public int idCount(MemberDTO dto);
	public int levelsCh(MemberDTO dto);
	
	public List<LevelsDTO> levelsType();
	public void loginTime(MemberDTO dto);
	public List<MemberDTO> idLevels(MemberDTO dto);
	public int mCount();
	public int mlCount(int levels);
	
	public List<HashMap> sumAllMemberByMonth(@Param("startDate")String startDate,
												@Param("endDate")String endDate,
												@Param("descOrNot")String descOrNot,
												@Param("startRNum")int startRNum,
												@Param("endRNum")int endRNum);
	
	
	public List<GuestDTO> guestList();
	public List<CouponDTO> couponList();
	public List<CouponDTO> coupon_id(String idCoupon);
	public List<CouponDTO> searchCouponList(
			@Param("search") String search,
			@Param("searchValue") String searchValue);
	public List<Coupon_typeDTO> coupon_typeList();
	public List<PointDTO> pointList();
	public List<PointDTO> point_id(String idPoint);
	public int couponCreate(Coupon_typeDTO dto); // 쿠폰생성
	public int couponAdd(Coupon_typeDTO dto); // 쿠폰지급
	public List<PointnameDTO> pointnameList();
	public int pointUpdate(PointDTO dto);
	
}
