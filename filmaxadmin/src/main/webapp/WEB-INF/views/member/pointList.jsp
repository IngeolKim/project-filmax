<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<h3>포인트리스트</h3>
<script>
	$(function(){
		$("#idPoint").change(function(){
			window.location="/member/pointList?idPoint="+this.value;
		});
	});
</script>

<select name="idPoint" id="idPoint">
	<option value="0">--선택--</option>
	<c:forEach var="idList" items="${mlist}">
		<option value="${idList.user_id}">${idList.user_id}</option>
	</c:forEach>
</select>

<button onclick="window.location='/member/pointList'">포인트전체목록</button>
<table border="1" style="text-align: center">
	<tr>
		<td>번호</td>
		<td>상세정보</td>
		<td>유저아이디</td>
		<td>적립 포인트</td>
		<td>사용 포인트</td>
		<td>포인트</td>
		<td>날짜</td>
	</tr>
	<c:forEach items="${plist}" var="dto">
	<tr>
		<td>${dto.num}</td>
		<td>${dto.pointinfo}</td>
		<td>${dto.user_id}</td>
		<td>${dto.pluspoint}</td>
		<td>${dto.usepoint}</td>
		<td>${dto.totalpoint}</td>
		<td><fmt:formatDate value="${dto.usedate}" type="date"/></td>
	</tr>
	</c:forEach>
</table>