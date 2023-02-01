<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>
/* 포인트추가 영역 */
.pointAdd{
	border : 2px solid grey;
	width : 250px;
	height : 450px auto;
	margin: 10px;
}
*{
	box-sizing: border-box;
}
.pointAdd_div{
	font-size: 25px;
    line-height: 35px;
    font-weight: bold;
}
</style>

<div class="pointAdd">
<form action="/member/pointAddPro" method="post" class="form-inline">
	<div class="pointAdd_div">포인트지급</div>
	<div>
		<input type="hidden" name="user_id" value="${user_id}"/>
		<label>아이디 : ${user_id}</label><br/>
		<div>
			<label>포인트사유</label><br/>
			<select name="pointnum" id="idpoint" style="text-align: center">
				<option value="0">--선택--</option>
					<c:forEach items="${pointnameList}" var="plist">
						<option value="${plist.pointnum}"> ${plist.pointinfo} </option>
					</c:forEach>
			</select>
		</div>
		<div>
			<label>적립 포인트</label>
			<input type="text" name="pluspoint" id="pluspoint"/>
		</div>
		<div>
			<label>사용 포인트</label>
			<input type="text" name="usepoint" id="usepoint"/>
		</div>
	</div>
	
	<div>
		<input type="submit" value="지급" class="btn btn-default"/>
		<input type="button" value="취소" onclick="window.close()" class="btn btn-default"/>
	</div>
	
	
</form>

</div>
