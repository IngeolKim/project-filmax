<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="/resources/js/jquery-3.6.1.min.js"></script>
<h1>/smember/loginForm</h1>

<form action="/smember/loginPro" method = "post" >
	id: <input type="text" name="id" /> <br />
	pw: <input type="password" name="pw" /> <br />
		 <input type="submit" value="로그인" /> <br />
		 <input type="button" value="회원가입" onclick="window.location='/smember/inputForm'" />  
</form>