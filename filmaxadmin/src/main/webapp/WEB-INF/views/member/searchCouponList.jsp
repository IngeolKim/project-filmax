<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<h3>쿠폰목록</h3>
<script>
	$(function(){
		$("#idCoupon").change(function(){
			window.location="/member/couponList?idCoupon="+this.value;
		});
	});
</script>

<div id="couponList">
<div>
<select name="idCoupon" id="idCoupon">
	<option value="0">--선택--</option>
	<c:forEach var="idList" items="${mlist}">
		<option value="${idList.user_id}">${idList.user_id}</option>
	</c:forEach>
</select>
<button onclick="window.location='/member/couponList'">쿠폰전체목록</button>

<form action="/member/searchCouponList" method="get">
	<select name="search">
		<option value="${search}">
			<c:if test="${search=='user_id'}">아이디</c:if>
			<c:if test="${search=='sale'}">할인금액</c:if>
			<c:if test="${search=='usetime'}">유효기간</c:if>
		</option>
		<option value="user_id">아이디</option>
		<option value="sale">할인금액</option>
		<option value="usetime">유효기간</option>
	</select>
	<input type="text" name="searchValue" value="${searchValue}" size="10"/>
	<input type="submit" value="검색"/>
</form>
</div>

<table border="1">
	<tr>
		<td>번호</td>
		<td>아이디</td>
		<td>쿠폰종류</td>
		<td>쿠폰정보</td>
		<td>할인금액</td>
		<td>사용여부</td>
		<td>유효기간</td>
	</tr>
	<c:forEach items="${clist}" var="dto">
	<tr>
		<td>${dto.num}</td>
		<td>${dto.user_id}</td>
		<td>${dto.name}</td>
		<td>${dto.info}</td>
		<td>${dto.sale}원</td>
		<td>${dto.use}</td>
		<td>~<fmt:formatDate value="${dto.usetime}" type="date"/></td>
	</tr>
	</c:forEach>
</table>
</div>
