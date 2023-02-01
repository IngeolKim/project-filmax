<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 콘텐츠부분 -->
<section>
<div>
	<button onclick="window.location='/member/memberList'" class="btn btn-default">전체 회원 목록</button>
	<button onclick="window.location='/member/guestList'" class="btn btn-default">게스트 목록</button>
	<button onclick="window.location='/member/couponList'" class="btn btn-default">회원 쿠폰목록</button>
	<button onclick="window.location='/member/pointList'" class="btn btn-default">회원 포인트목록</button>
	<button onclick="window.location='http://localhost:8080/cs/main'" class="btn btn-default">고객센터</button>
</div>
<div>
	<button onclick="window.location='/member/coupon_typeList'" class="btn btn-default">쿠폰목록</button>
	<button onclick="window.location='/member/logout'" class="btn btn-default">로그아웃</button>
</div>
</section>


