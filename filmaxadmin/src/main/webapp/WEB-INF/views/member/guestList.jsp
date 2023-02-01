<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<div>
<h3>게스트 목록</h3>
<table border="1">
	<tr>
		<td>생년월일</td>
		<td>연락처</td>
	</tr>
<c:forEach items="${glist}" var="dto" >
	<tr>
		<td><fmt:formatDate value="${dto.birth}" type="date"/></td>
		<td>${dto.phone}</td>
	</tr>
</c:forEach>
</table>
</div>
