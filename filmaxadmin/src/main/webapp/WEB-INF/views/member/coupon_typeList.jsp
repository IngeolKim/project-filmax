<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<h1>쿠폰종류</h1>
<div id="coupon_typeList">

<table border="1" >
	<tr>
		<td>번호</td>
		<td>쿠폰종류</td>
		<td>쿠폰정보</td>
		<td>할인금액</td>
		<td>사용기간</td>
	</tr>
	<c:forEach items="${ilist}" var="dto">
	<tr>
		<td>${dto.type}</td>
		<td>${dto.name}</td>
		<td>${dto.info}</td>
		<td>${dto.sale}원</td>
		<td>${dto.expiredate}일</td>
	</tr>
	</c:forEach>

</table>
<button onclick="window.location='/member/couponCreate'" class="btn btn-default">쿠폰추가</button>
</div>
