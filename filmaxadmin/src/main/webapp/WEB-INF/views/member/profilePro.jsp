<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<c:if test="${count == 1 }">
	<script>
		alert("회원 레벨변경 되었습니다.");
		window.location="/member/memberList" ;
	</script>
</c:if>