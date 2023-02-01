<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="/resources/js/jquery-3.6.1.min.js"></script>
<h1>/smember/inputFrom</h1>

<form action="/smember/inputPro" method="post" enctype="multipart/form-data">
	id: <input type="text" name="id" id="id"/> 
		<input type="button" id="check" value="중복확인" />	<br />
		
	pw: <input type="password" name="pw" /> <br />
	name: <input type="text" name="name" /> <br />
	tel: <input type="text" name="tel" /> <br />
	birth: <input type="date" name="birth" /> <br />
	image: <input type="file" name="upload" /> <br />
			<input type="submit" value="가입" />
	
</form>