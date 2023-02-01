<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="/resources/js/jquery-3.6.1.min.js"></script>

<script>
	$(function(){
		$("#boardType").change(function(){
			window.location="/sboard/list?boardType="+this.value;
		});
	});
</script>
<h1>/sboard/list</h1>

<select name="boardType" id="boardType">
	<option value="0">-------</option>
	<c:forEach var="typeDTO" items="${typeList2}">
		<option value="${typeDTO.num}">${typeDTO.typeName}</option>
	</c:forEach>
</select>
<br />
<c:forEach items="${list}" var="dto">		<!-- items 가 반복해야할 대상 -->
	${dto.num } 
	<c:if test="${dto.levels > 0}">
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	</c:if>
	<a href="/sboard/read?num=${dto.num }">${dto.subject }</a>  
	${dto.writer }
	${dto.reg } ${dto.readCount } <br />
</c:forEach>
<br />

<c:set var="pageCount" value="${count / pageSize + (count % pageSize == 0 ? 0 : 1)}" />

<c:set var="pageBlock" value="${10}" />
<fmt:parseNumber var="result" value="${pageNum / 10}" integerOnly="true" />
<c:set var="startPage"  value="${result *10 + 1}" />
<c:set var="endPage"  value="${startPage+pageBlock-1}" />

<c:if test="${endPage > pageCount}">
	<c:set var="endPage"  value="${pageCount}" />
</c:if>

<c:if test="${startPage > 10}">
	<a href="/sboard/list?pageNum=${startPage-10}">[이전]</a>
</c:if>

<c:forEach var="i" begin="${startPage}" end="${endPage}">
	<a href="/sboard/list?pageNum=${i}">[${i}]</a>
</c:forEach>

<c:if test="${endPage < pageCount}">
	<a href="/sboard/list?pageNum=${startPage+10}">[다음]</a>
</c:if>
<br /><br />




<input type="button" value="글쓰기" onclick="window.location='writeForm'" />

<form action="/sboard/searchList">

	<select name="search">
		<option value="writer">작성자</option>
		<option value="subject">제목</option>
		<option value="content">내용</option>
	</select>
	<input type="text" name="searchValue" />
	<input type="submit" value="검색" />
</form>