<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix ="c"%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="/resources/js/jquery-3.6.1.min.js"></script>
<script>
	$(function(){
		$("#addFile").click(function(){
			$("#file").append("<input type='file' name='upload' /> <br />");				//append 는 이어서 추가한다
		});					//#은 id를 찾아간다
	});
</script>
<h1>/sboard/writeForm</h1>
<form action="/sboard/writePro" method="post" enctype="multipart/form-data" >
	<input type="hidden" name="num" value="${sboardDTO.num }" />
	<input type="hidden" name="ref" value="${sboardDTO.ref }" />
	<input type="hidden" name="levels" value="${sboardDTO.levels }" />
	<input type="hidden" name="step" value="${sboardDTO.step }" />
	타입: 
	<c:if test="${sboardDTO.num == 0 }">
		<select name="boardType">
			<option >--선택--</option>
				<c:forEach var="dto" items="${boardType}" >
				<option value="${dto.num}">${dto.typeName}</option> 
			</c:forEach> 			
		</select> <br />
	</c:if>
	<c:if test="${sboardDTO.num > 0 }">
		<input type="hidden" name="boardType" value="${sboardDTO.boardType}" />
	</c:if>	
	작성자: <input type="text" name="writer" /> <br />
	제목: <input type="text" name="subject" /> <br />
	email: <input type="text" name="email" /> <br />
	첨부파일: <div id="file">
			 <input type="file" name="upload" /> <br />
			</div>
			<input type="button" value="파일추가" id="addFile"/> <br /> 
	내 용: <textarea rows="5" cols="30" name="content" ></textarea> <br />
	비밀번호: <input type="password" name="pw" /> <br />	
	
		<input type="button" value="취소" />
		<input type="reset" value="다시작성" />
		<input type="submit" value="글쓰기" />
</form>