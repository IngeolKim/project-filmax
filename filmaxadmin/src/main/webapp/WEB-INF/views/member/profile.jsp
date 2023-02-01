<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<style>
	#profile{
		border : 5px solid #0e0e0e; /* 박스 테두리 */
		width : 400px ;
		height : 450px auto;
		margin: 50px auto;
	}
	*{
		box-sizing: border-box;
	}
</style>

<div id="profile">
<form action="profilePro" method="post" class="form-inline">
	<table class="table">
		<tr>
			<th colspan="2">
				FILMAX 회원 프로필
			</th>
		</tr>
		<tr>
			<td>
				아이디
			</td>
			<td>
				${dto.user_id} 
				<input type="hidden" id="user_id" name="user_id" value="${dto.user_id}">
			</td>
		</tr>
		<tr>
			<td>
				이름
			</td>
			<td>
				${dto.name}
			</td>
		</tr>
		<tr>
			<td>
				생년월일
			</td>
			<td>
				${dto.birth}
			</td>
		</tr>
		<tr>
			<td>
				성별
			</td>
			<td>
				<c:if test="${dto.gender=='m'}">
					남자
				</c:if>
				<c:if test="${dto.gender=='w'}">
					여자
				</c:if>
			</td>
		</tr>
		<tr>
			<td>
				핸드폰
			</td>
			<td>
				${dto.phone}
			</td>
		</tr>
		<tr>
			<td>
				이메일
			</td>
			<td>
				${dto.email}
			</td>
		</tr>
		<tr>
			<td>
				닉네임
			</td>
			<td>
				<c:choose>
					<c:when test="${empty dto.nickname}">
						설정안함
					</c:when>
					<c:otherwise>
						${dto.nickname}
					</c:otherwise>
				</c:choose>
			</td>
		</tr>
		<tr>
			<td>
				회원 등급
			</td>
			<td>
				<select id="levelsType" name="levels">
					<option>${dto.levels_name}</option>
					<c:forEach var="leveln" items="${list}">
						<option value="${leveln.levels}">${leveln.levels_name}</option>
					</c:forEach>
				</select>
			</td>
		</tr>
		<tr>
			<td>
				회원 가입일
			</td>
			<td>
				<fmt:formatDate type="date"  value="${dto.joindate}"  />
			</td>
		</tr>
		<tr>
			<td>
				최근접속일
			</td>
			<td>
				<fmt:formatDate type="date"  value="${dto.lastlogin}"  />
			</td>
		</tr>
		<tr>
			<td>
				마캐팅
			</td>
			<td>
				<label class="checkbox-inline">
					<input type="checkbox" name="marketing" class="all_list" value="1" <c:if test="${dto.marketing == '1'}">checked</c:if>/>광고ㆍ이벤트 알림(선택)
				</label>
			</td>
		</tr>
		<tr>
			<td>
				<input type="submit"  value="수 정"  class="btn btn-default" />
				<input type="button"  value="취 소"  class="btn btn-default" onclick="window.location='memberList'"/>
			</td>
		</tr>
	
	</table>
		
</form>
</div>	
