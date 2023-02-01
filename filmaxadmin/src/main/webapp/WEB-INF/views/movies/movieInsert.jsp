<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="/resources/js/jquery-3.6.1.min.js"></script>
<h1>영화등록</h1>
<script>
$(function(){
	$("#addsub").click(function(){
		$("#subfile").append("<input type='file' name='uploadsub' /> <br />");				
	});	
	$("#addstil").click(function(){
		$("#stilfile").append("<input type='file' name='uploadstil' /> <br />");				
	});
});
</script>
<form action="movieInsertPro" method="post" enctype="multipart/form-data">
	영화제목 : <input type="text" name="title" /> <br />
	개봉일자 : <input type="date" name="releaseDate" /> <br />
	상영시간: <input type="text" name="runtime" />분 <br /> 	
	상영여부: 
		<select name="screening_id">
			<option value="5">상영전</option>
			<option value="6">상영중</option>
			<option value="7">상영종료</option>
			<option value="8">재개봉</option>
		</select> <br />
		
	장르: <select name="genre_id">
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
			<option value="82">South Korea</option>
			<option value="81">Japan</option>
			<option value="1">United States</option>
			<option value="33">France</option>
			<option value="86">China</option>
			<option value="44">United Kingdom</option>			
		</select> <br />
		
	연령제한: <select name="ageLimit_id">
			<option value="1">전체이용가</option>
			<option value="2">7세</option>
			<option value="3">12세</option>
			<option value="4">15세</option>
			<option value="5">19세</option>			
			</select> <br />
	감독: <input type="text" name="director" /> <br />
	출연: <input type="text" name="actor" /> <br />
	
	자막: <select name="subtitle_id">
			<option value="4">한글</option>
			<option value="5">영문</option>
			<option value="6">더빙</option>		
			</select> <br />
	메인 포스터:<div id="file">
			 <input type="file" name="upload" /> <br />
		  </div>
	서브 포스터:<div id="subfile">
			 <input type="file" name="uploadsub" /> <br />
		  </div>
		  <input type="button" value="추가" id="addsub"/> <br /> 
	스틸컷 포스터:<div id="stilfile">
			 <input type="file" name="uploadstil" /> <br />
		  </div>
		  <input type="button" value="추가" id="addstil"/> <br /> 
	줄거리 :<br /> <textarea cols="50" rows="15" name="summary"></textarea><br />
		<input type="submit" value="등록하기" />
</form>

