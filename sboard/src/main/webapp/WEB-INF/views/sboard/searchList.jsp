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
<h1>/sboard/searchList</h1>

<select name="boardType" id="boardType">
	<c:forEach var="typeDTO" items="${typeList }">
		<option value="${typeDTO.num}">${typeDTO.typeName }</option>
	</c:forEach>
</select>
<br />
<c:forEach items="${list }" var="dto">		<!-- items 가 반복해야할 대상 -->
	${dto.num } 
	<c:if test="${dto.levels > 0}">
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	</c:if>
	<a href="/sboard/read?num=${dto.num }">${dto.subject }</a>  
	${dto.writer }
	${dto.reg } ${dto.readCount } <br />
</c:forEach>
<br />

<form action="/sboard/searchList">
	<select name="search">
		<option value="writer">작성자</option>
		<option value="subject">내용</option>
		<option value="content">제목</option>
	</select>
	<input type="text" name="searchValue" />
	<input type="submit" value="검색" />
</form>