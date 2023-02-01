<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:if test="${result==1}">
	<tr>
		<td>${replyDTO.id }</td> <td>${relpyDTO.content}</td>
	</tr>	
</c:if>
