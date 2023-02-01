<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="/resources/js/jquery-3.6.1.min.js"></script>
<script src="/resources/sboard/read.js"></script>
<script>
	$(function(){
		var reTag;
		$(".re").click(function(){
			if(reTag != null){			//this 는 발생하는 이벤트의 위치, parent는 속해있는 상위태그! 예시) $(this).parent().append("hello");
				reTag.hide();
			}
			reTag = $(this).parent().parent().next();
			reTag.show();
		});
		
		$("#replyBtn").click(function(){
			$.ajax({
				url : "/sboard/reply/replyPro",
				data: {	boardNum:$("#boardNum").val(),
						id:$("#id").val(), 
						content:$("#content").val()},
				success: function(value){
					$("#replyList").append(value);
				}		
			});
		});
		
		$(".reBtn").click(function(event){
			form = event.target.form;
			tar = $(this).parent().parent();
			$.ajax({
				url : "/sboard/reply/replyPro",
				data: {	boardNum:form.boardNum.defaultValue,
						id:form.id.value, 
						content:form.content.value,
						ref:form.ref.defaultValue,
						step:form.step.defaultValue,
						levels:	form.levels.defaultValue},
				success: function(value){
					tar.html(value);
				}		
			});
			return false;
		});
		
		
		$("#reply").click(function(){
			window.location="/sboard/writeForm?num=${dto.num}&ref=${dto.ref}&levels=${dto.levels}&step=${dto.step}&boardType=${dto.boardType}";			
		});
		$("#heart").click(function(){
			srcVal = $(this).attr("src");			//attr 은 속성을 바꾸는 역할
			if(srcVal == "/resources/img/before.png"){
				//좋아요
				likeChange(1);
				$(this).attr("src","/resources/img/after.png");
			}else{
				//취소
				likeChange(0);
				$(this).attr("src","/resources/img/before.png");
			}
		})
	});
	function likeChange(ch){
		$.ajax({
			type:"get",
			url: "/sboard/like",
			data: {sboardNum:'${dto.num}', change: ch},
			success: function(value){				
			}
		});
	}	
</script>
<h1>/sboard/read</h1>

좋아요 : 
	<c:if test="${like == 0}">	
	<img id="heart" src="/resources/img/before.png" width="50"/> 
	</c:if>
	<c:if test="${like == 1}">
	<img id="heart" src="/resources/img/after.png" width="50"/> 
	</c:if>
<br />
	작성자 : ${dto.writer} <br />
	제목: ${dto.subject} <br />
	내용: ${dto.content} <br />
<c:if test="${dto.files > 0 }"> 
	첨부파일: 
	<c:forEach items="${fileList }" var="fileName">
	${fileName } 
	</c:forEach>
	<br />
</c:if>
	내 용 : ${dto.content} <br />
	작성일: ${dto.reg} <br />
	조회수: ${dto.readCount} <br />

<input type="button" value="답글쓰기" id="reply" class="btn btn-success"/>		<br /><br />
<table id="replyList" border="1">
	<c:forEach var="replyDTO" items="${replyList}">
		<tr>
			<td>
				<c:if test="${replyDTO.levels > 0 }">
					<img src="/resources/img/zz.png" width="${replyDTO.levels * 20}" height = "10" />
				</c:if>
				${replyDTO.id}
			</td>
			<td>${replyDTO.content}</td>
			<td><button id="re" class="re">답글</button></td>
		</tr>
		<tr style="display:none;" >
			<form>
				<td colspan="2">
					<input type="hidden"  name="boardNum" value="${replyDTO.boardNum}" />	
					<input type="hidden"  name="ref" value="${replyDTO.ref}" />	
					<input type="hidden"  name="step" value="${replyDTO.step}" />	
					<input type="hidden"  name="levels" value="${replyDTO.levels}" />	
					<input type="text"  name="id" placeholder="작성자" />	<br />								<!-- colspan="2" 은 두칸을 한칸으로 사용한다 -->
					<textarea rows="4" cols="30" id="content" name="content" placeholder="내 용"></textarea>
				</td>
				<td>
					<button class="reBtn">등록</button>
				</td>
			</form>	
		</tr>
	</c:forEach>
</table>
<br />
<form>
	<input type="hidden" id="boardNum" value="${dto.num}" />
	작성자: <input type="text" id="id" />	<br />
	내 용: <textarea rows="4" cols="30" id="content" ></textarea>	<br />
			<input type="button" id="replyBtn" value="등록" />
</form>
