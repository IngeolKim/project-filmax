<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:forEach items="${list}" var="dto">
	<div id="list" class="movie_list">
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
<form action="movieSearch">
	
	<input type="text" name="searchValue" />
	<input type="submit" value="검색" />
</form>

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