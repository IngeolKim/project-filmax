<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%><!-- date 관련 영문표기법을 년 월 일 로 바꾸는 방법 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="/resources/js/jquery-3.6.1.min.js"></script>

<form action="movieUpdatePro" method="post" >
	영화제목 : <input type="text" value="${dto.title}" name="title" /> <br />
	<fmt:formatDate var="releaseDate" value="${dto.releaseDate }" pattern="yyy-MM-dd" /> <!-- date 관련 영문표기법을 년 월 일 로 바꾸는 방법 -->
	개봉일자 : <input type="date" value="${releaseDate }"name="releaseDate" /> <br />
	상영시간: <input type="text" value="${dto.runtime}" name="runtime" />분 <br /> 	
	상영여부: 
		<select name="screening_id">	
			<option value="${dto.screening_id}">현재값</option>
			<option value="5">상영전</option>
			<option value="6">상영중</option>
			<option value="7">상영종료</option>
			<option value="8">재개봉</option>
		</select> <br />
		
	장르: <select name="genre_id">
			<option value="${dto.genre_id }">현재값</option>
			<option value="52">액션</option>
			<option value="53">드라마</option>
			<option value="54">뮤지컬</option>
			<option value="55">코미디</option>
			<option value="56">멜로</option>
			<option value="57">호러</option>
			<option value="58">SF</option>
			<option value="59">스릴러</option>
			<option value="60">애니메이션</option>
			<option value="61">판타지</option>		
		</select> <br />
		
	국가: <select name="country_id">
			<option value="${dto.country_id }">현재값</option>
			<option value="82">South Korea</option>
			<option value="81">Japan</option>
			<option value="1">United States</option>
			<option value="33">France</option>
			<option value="86">China</option>
			<option value="44">United Kingdom</option>			
		</select> <br />
		
	연령제한: <select name="ageLimit_id">
			<option value="${dto.ageLimit_id }">현재값</option>
			<option value="1">전체이용가</option>
			<option value="2">7세</option>
			<option value="3">12세</option>
			<option value="4">15세</option>
			<option value="5">19세</option>			
			</select> <br />
	감독: <input type="text" name="director" value="${dto.director }"/> <br />
	출연: <input type="text" name="actor" value="${dto.actor }"/> <br />
	
	자막: <select name="subtitle_id">
			<option value="${dto.subtitle_id }">현재값</option>
			<option value="4">한글</option>
			<option value="5">영문</option>
			<option value="6">더빙</option>		
			</select> <br />
	
	줄거리 : <textarea name="summary" >${dto.summary }</textarea><br />
	
	<input type="hidden" value="${dto.movie_seq}" name="movie_seq"/>
	<input type="submit" value="수정완료!" />
</form>