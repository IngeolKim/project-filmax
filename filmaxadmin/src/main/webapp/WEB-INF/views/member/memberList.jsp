<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<h4>회원목록</h4>
<script>
	$(function(){
		$("#levelsType").change(function(){
			window.location="/member/memberList?levels="+this.value;
		});
	});
</script>

<div id="memberList">
	<div>
	<select name="levelsType" id="levelsType">
		<option value="${levelsDTO.levels != 0}">==선택==</option>
		<c:forEach var="levelsDTO" items="${LT}">
			<option value="${levelsDTO.levels}">${levelsDTO.levels_name}</option>
		</c:forEach>
	</select>
	<button onclick="window.location='/member/memberList'">회원전체목록</button>
	</div>

	<table border="1" style="text-align: center">
		<tr>
			<td>회원ID</td>
			<td>이름</td>
			<td>성별</td>
			<td>등급</td>
			<td>가입일</td>
			<td>마지막접속일</td>
			<td>닉네임</td>
			<td>마케팅동의</td>
			<td>쿠폰/포인트</td>
		</tr>
		<c:forEach items="${list}" var="dto" >
			<tr>
				<td><a href="/member/profile?user_id=${dto.user_id}">${dto.user_id}</a></td>
				<td>${dto.name}</td>
				<td>${dto.gender}</td>
					<!-- String [] br = birth.split(" ");
					dto.setBirth((br[0])); -->
				<td>${dto.levels_name}</td>
				<td><fmt:formatDate value="${dto.joindate}" type="date"/></td>
				<td><fmt:formatDate value="${dto.lastlogin}" type="date"/></td>
				<td>${dto.nickname}</td>
				<c:if test="${dto.marketing == '1'}">	<td>O</td>	</c:if>
				<c:if test="${dto.marketing == '0'}">	<td>X</td>	</c:if>
				<td><button value="${dto.user_id}" 
							onclick="window.open('/member/couponAdd?user_id=${dto.user_id}', '쿠폰지급', 'width=400, height=500')">
					지급</button>
				</td>
			</tr>
		</c:forEach>
	</table>
</div>

<center>
	<c:set var="pageCount" value="${count / pageSize + (count % pageSize == 0 ? 0 : 1)}" />
	<c:set var="pageBlock" value="${10}" />
	<fmt:parseNumber var="result" value="${pageNum / 10}" integerOnly="true" />
	<c:set var="startPage"  value="${result * 10+1}" />
	<c:set var="endPage"  value="${startPage+pageBlock-1}" />
	
	<c:if test="${endPage > pageCount}">
		<c:set var="endPage"  value="${pageCount}" />
	</c:if>
	
	<c:if test="${startPage > 10}">
		<a href="/member/memberList?pageNum=${startPage-10}">[이전]</a>
	</c:if>
	
	<c:forEach var="i" begin="${startPage}" end="${endPage}">
		<a href="/member/memberList?pageNum=${i}&levels=${levels}">[${i}]</a>
	</c:forEach>
	
	<c:if test="${endPage < pageCount}">
		<a href="/member/memberList?pageNum=${startPage+10}">[다음]</a>
	</c:if>
</center>