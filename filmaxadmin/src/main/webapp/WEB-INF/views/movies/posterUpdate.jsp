<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="/resources/js/jquery-3.6.1.min.js"></script>
<script>
/* 체크박스 전체선택, 전체해제 */
function checkAll(){
      if( $("#th_checkAll").is(':checked') ){
        $("input[name=checkRow]").prop("checked", true);
      }else{
        $("input[name=checkRow]").prop("checked", false);
      }
}

$(function(){
	$("#addsub").click(function(){
		$("#subfile").append("<input type='file' name='uploadsub' /> <br />");				
	});	
	$("#addstil").click(function(){
		$("#stilfile").append("<input type='file' name='uploadstil' /> <br />");				
	});
});
</script>
<table border="1">
	<tr>
		<td>전체 <input type="checkbox" name="checkAll" id="th_checkAll" onclick="checkAll();"/></td>
		<td>저장된 포스터</td>
		<td><input type="button" value="전체삭제" onclick="window.location='posterDeleteAll?movie_seq=${dto.movie_seq}'"/></td>
	</tr>
<c:forEach items="${posterList}" var="dto">
	<tr>
		<td><input type="checkbox" name="checkRow" value="${dto.poster}"/></td>
		<td>${dto.poster}</td>
		<td><input type="button" value="삭제" onclick="window.location='posterDelete?movie_seq=${dto.movie_seq}&poster_id=${dto.poster_id}'"/></td>
	</tr>	
</c:forEach>
</table>
<form action="posterUpdatePro" method="post" enctype="multipart/form-data">
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
			
			<input type="hidden" value="${moviesDTO.title}" name="title"/> <br /> 
			<input type="hidden" value="${moviesDTO.movie_seq}" name="movie_seq"/> <br />
			<input type="submit" value="수정완료!" />		  
</form>
