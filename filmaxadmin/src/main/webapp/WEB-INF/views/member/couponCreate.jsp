<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<title>쿠폰추가</title>
<style>
/* 쿠폰추가 영역 */
.couponAdd{
	border : 2px solid grey;
	width : 250px;
	height : 450px auto;
	margin: 10px;
}
*{
	box-sizing: border-box;
}
.couponAdd_div{
	font-size: 25px;
    line-height: 35px;
    font-weight: bold;
}
</style>

<div class="couponAdd">
	<form action="couponCreatePro" method="get" enctype="multipart/form-data" class="form-inline">
		<div class="couponAdd_div">쿠폰생성</div>
		<div>
			<label>쿠폰이름</label>
			<input type="text" name="name" id="name" placeholder="ex)생일쿠폰,할인쿠폰" class="form-control"/>
		</div>
		<div>
			<label>카테고리</label>
			<input type="text" name="info" id="name" placeholder="할인정보 ex)3천원할인" class="form-control"/>
		</div>
		<div>
			<label>할인가격</label>
			<input type="text" name="sale" id="name" placeholder="할인가격" class="form-control"/>
		</div>
		<div>
			<label>사용기간</label>
			<input type="text" name="expiredate" id="name" placeholder="사용기간(7,14,30일)" class="form-control"/>
		</div>
		<div>
			<input type="submit" value="생성" class="btn btn-default"/>
		</div>
	</form>
</div>