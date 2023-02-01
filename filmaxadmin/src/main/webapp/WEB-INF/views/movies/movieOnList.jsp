<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<h1>상영중인 영화</h1>
<input type="button" value="영화 메인으로" onclick="window.location='movieMain'"/> <br />
<input type="button" value="전체영화리스트" onclick="window.location='movieList'" />

<c:forEach items="${onScreen}" var="dto">
	<div id="onScreen">
		<tr>
			<td>			
				<a href="/movies/movie_detail?movie_seq=${dto.movie_seq}">
					<img width="250" src="http://localhost:6060/poster/${dto.poster}">
				</a>	<br />
				<a href="/movies/movie_detail?movie_seq=${dto.movie_seq}">${dto.title} </a> <br>
				<fmt:formatDate value="${dto.releaseDate}" type="date" /> <strong>개봉</strong> <br />
				<br />
			</td>
		</tr>		
	</div>
</c:forEach> 

<style>
	.movie_list { display:none; }
</style>
	<button id="more_Movie"> 더 보기</button>
<script>
$(function(){
    $(".movie_list").slice(0, 5).show(); // select the first ten
    $("#more_Movie").click(function(e){ // click event for load more
        e.preventDefault();
        $(".movie_list:hidden").slice(0, 3).show(); // select next 10 hidden divs and show them
        if($(".movie_list:hidden").length == 0){ // check if any hidden divs still exist
            alert("더 이상 없습니다!"); // alert if there are none left
        }
    });
});
</script>