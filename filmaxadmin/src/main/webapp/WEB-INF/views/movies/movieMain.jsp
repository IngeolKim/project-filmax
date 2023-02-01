<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<h2>빠른 영화 검색</h2>
<form action="movieSearch">
	<input type="text" name="searchValue" class="form-control" placeholder="검색할 영화 제목을 입력해주세요" />
	
	<input type="submit" value="검색" class="btn btn-primary"/>
</form>