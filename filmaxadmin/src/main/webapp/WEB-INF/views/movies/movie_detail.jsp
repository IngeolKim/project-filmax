<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
.m_summary{
	width:1200px;
	line-height:400%;		
		 }
</style>
<script>
//영화 리뷰 댓글 팝업

  function reviewPop(){
   		var popup = window.open('/movies/reviewPopup?title=${dto.title}&movie_seq=${dto.movie_seq}', 
    							'리뷰팝업', 'width=800px,height=400px,top=150,left=300');
  }
  function updateReviewPop(reviews_seq, content){
		var popup = window.open('/movies/updateReview?title=${dto.title}&movie_seq=${dto.movie_seq}&reviews_seq='+reviews_seq+'&content='+content, 
	    							'리뷰수정팝업', 'width=800px,height=400px,top=150,left=300');
  }
  function deleteReview(reviews_seq){
		var popup = window.open('/movies/deleteReview?reviews_seq='+reviews_seq, 
	    							'리뷰삭제팝업', 'width=800px,height=400px,top=150,left=300');
  }
  $(function(){
	  $(".heart").click(function(event){
		reviews_seq = event.target.id;
		movie_seq = '${dto.movie_seq}';
		imgthis = $(this); // 이벤트 발생한 태그 
		$.ajax({
			  type:"get",
			  url:"/movies/reviewLike",
			  data: {reviews_seq :reviews_seq ,movie_seq:movie_seq},
			  success : function(data){	
				  tot = parseInt(imgthis.next().text());
				if(data=='1'){
				 	imgthis.attr("src","/resources/movie/reviewLike/after.png");
				 	imgthis.next().text(tot+1);
				}else{					
					imgthis.attr("src","/resources/movie/reviewLike/before.png");
					imgthis.next().text(tot-1);
				}
			  }
		  });
	  });
  });

</script>
<h1>영화상세정보</h1>

<input type="button" value="영화 메인으로" onclick="window.location='movieMain'"/> <br />
<input type="button" value="영화리스트" onclick="window.location='movieList'"/> <br />
<input type="button" value="삭제" onclick="window.location='movieDelete?movie_seq=${dto.movie_seq}'"/>
<form action="movieUpdate" method="post">
	<input type="hidden" value="${dto.movie_seq}" name="movie_seq" />
	<input type="hidden" value="${dto.title}" name="title"/>
	<input type="hidden" value="${dto.runtime}" name="runtime"/>
	<input type="hidden" value="${country}" name="country"/>
	<input type="hidden" value="${genre}" name="genre"/>
	<input type="hidden" value="${dto.releaseDate}" name="releaseDate"/>
	<input type="hidden" value="${dto.director}" name="director"/>
	<input type="hidden" value="${dto.actor}" name="actor"/>
	<input type="hidden" value="${subtitle}" name="subtitle"/>
	<input type="hidden" value="${ageLimit}" name="ageLimit"/>
	<input type="hidden" value="${screening}" name= "screening"/>
	<input type="hidden" value="${dto.summary}" name="summary"/>
	<input type="submit" value="정보수정" />
</form>
<form action="posterUpdate" method="post">
	<input type="hidden" value="${dto.movie_seq}" name="movie_seq" />
	<input type="hidden" value="${poster}" name="poster" />
	<input type="hidden" value="${dto.title}" name="title"/>
	<input type="submit" value="포스터 수정 및 추가" />
</form>
<c:forEach items="${posterMain}" var="dto2">
<p><img width="400" src="http://localhost:6060/poster/${dto2.poster}"></p>
</c:forEach>
<h2>${dto.title}</h2>
<h3>기본: ${dto.runtime}분, ${country}</h3> 
<h3>장르:${genre }</h3>
<h3>개봉: <fmt:formatDate value="${dto.releaseDate}" type="date" /></h3>
<h3>감독: ${dto.director}</h3>
<h3>출연진:${dto.actor} </h3>
<h3>자막:${subtitle}</h3>
<h3>연령제한:<c:if test="${ageLimit==0}">전체이용가</c:if> 
			<c:if test="${ageLimit != 0}">${ageLimit}세 이용가</c:if></h3>
<h3>상영상태:${screening}</h3>
<c:forEach items="${posterSub}" var="dto2">
<p><img width="300" src="http://localhost:6060/poster/${dto2.poster}"></p>
</c:forEach>
<br />
<h3>줄거리 </h3><br/>
<div class="m_summary">
<h4>${dto.summary}</h4>
</div>
<br />
<h3>스틸컷</h3>  

<c:forEach items="${posterStill}" var="dto2">		
	<img id="imgSlide" width="300" src="http://localhost:6060/poster/${dto2.poster}">		
</c:forEach>



<c:if test="${sessionScope.uid != null}">
	<button onclick="reviewPop()">평점입력</button>
	<c:forEach items="${reviewPaging}" var="dto2">
		<div>
			<tr>
				<td>		
					<input type="button" value="리뷰삭제하기" onclick="deleteReview('${dto2.reviews_seq}')"/>
						
					<h4>${dto2.user_id}</h4>	
					<h3>${dto2.content}</h3> 
					<fmt:formatDate value="${dto2.reg}" type="date" />
					<c:if test="${dto2.count == 0}">
						<img class="heart" id="${dto2.reviews_seq}" src="/resources/movie/reviewLike/before.png"  width="30" />
					</c:if>
					<c:if test="${dto2.count == 1}">
						<img class="heart" id="${dto2.reviews_seq}" src="/resources/movie/reviewLike/after.png"  width="30" />
					</c:if>
					[<label>${dto2.rating}</label>]
					<br />
					----------------------------------------
					<br />
				</td>
			</tr>		
		</div>
	</c:forEach> 
</c:if>
<c:if test="${sessionScope.uid == null}">
	<c:forEach items="${reviewPaging2}" var="dto2">
		<div>
			<tr>
				<td>		
				<input type="button" value="리뷰삭제하기" onclick="deleteReview('${dto2.reviews_seq}')"/>
					<h4>${dto2.user_id}</h4>	
					<h3>${dto2.content}</h3> 
					<fmt:formatDate value="${dto2.reg}" type="date" />
					<c:if test="${dto2.count == 0}">
						<img class="heart" id="${dto2.reviews_seq}" src="/resources/movie/reviewLike/before.png"  width="30" />
					</c:if>
					<c:if test="${dto2.count == 1}">
						<img class="heart" id="${dto2.reviews_seq}" src="/resources/movie/reviewLike/after.png"  width="30" />
					</c:if>
					[<label>${dto2.rating}</label>]
					<br />
					----------------------------------------
					<br />
				</td>
			</tr>		
		</div>
	</c:forEach> 
</c:if>

<c:set var="pageCount" value="${reviewCount / pageSize + (reviewCount % pageSize == 0 ? 0 : 1)}" />

<c:set var="pageLast" value="${10}" />
<fmt:parseNumber var="result" value="${pageNum / 10}" integerOnly="true" />
<c:set var="startPage" value="${result * 10 + 1}"/>
<c:set var="endPage" value="${startPage + pageLast -1 }" />

<c:if test="${endPage > pageCount}">
	<c:set var="endPage" value="${pageCount}" />
</c:if>

<c:if test="${startPage > 10}">
	<a href = "/movies/movie_detail?pageNum=${startPage - 10}&movie_seq=${dto.movie_seq}">[이전]</a>
</c:if>
<c:if test="${endPage < pageCount}">
	<a href = "/movies/movie_detail?pageNum=${startPage + 10}&movie_seq=${dto.movie_seq}">[다음]</a>
</c:if>
<c:forEach var="i" begin="${startPage}" end="${endPage}" >
	<a href = "/movies/movie_detail?pageNum=${i}&movie_seq=${dto.movie_seq}">[${i}]</a>
</c:forEach>



