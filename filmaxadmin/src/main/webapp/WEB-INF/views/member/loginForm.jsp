<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js"></script>

<script type="text/javascript" >
$(document).ready(function(){
    // 저장된 쿠키값을 가져와서 ID 칸에 넣어준다. 없으면 공백으로 들어감
    var userInputId = getCookie("userInputId");	//저장된 쿠키값 가져오기
    $("input[name='user_id']").val(userInputId); 
     
    if($("input[name='user_id']").val() != ""){ 	// 그 전에 ID를 저장해서 처음 페이지 로딩 시, 입력 칸에 저장된 ID가 표시된 상태라
        $("#save_id").attr("checked", true); 	// ID 저장하기를 체크 상태로 유지
    }
     
    $("#save_id").change(function(){ 	// 체크박스에 변화가 발생
        if($("#save_id").is(":checked")){ 	// ID 저장하기 체크했을때
            var userInputId = $("input[name='user_id']").val();
            setCookie("userInputId", userInputId, 7); 	// 7일 동안 쿠키 보관
        }else{ 	// ID 저장하기 체크 해제 시, delteCookie 삭제 
            deleteCookie("userInputId");
        }
    });
     
    // ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
    $("input[name='user_id']").keyup(function(){ 	// ID 입력 
        if($("#save_id").is(":checked")){ 	// ID 저장하기를 체크한 상태
            var userInputId = $("input[name='user_id']").val();
            setCookie("userInputId", userInputId, 7); 	// 7일 동안 쿠키 보관
        }
    });
});
 
function setCookie(cookieName, value, exdays){	//생성쿠키 이름값,휴효날짜를 파라미터로 박아서 쿠키를설정
    var exdate = new Date();
    exdate.setDate(exdate.getDate() + exdays);
    var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
    document.cookie = cookieName + "=" + cookieValue;
}
 
function deleteCookie(cookieName){	//삭제하는 쿠키 
    var expireDate = new Date();
    expireDate.setDate(expireDate.getDate() - 1);
    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
}
 
function getCookie(cookieName) {	//얻기쿠키, 쿠키이름을 받아서 들어있는값을 반환
    cookieName = cookieName + '=';
    var cookieData = document.cookie;
    var start = cookieData.indexOf(cookieName);
    var cookieValue = '';
    if(start != -1){
        start += cookieName.length;
        var end = cookieData.indexOf(';', start);
        if(end == -1)end = cookieData.length;
        cookieValue = cookieData.substring(start, end);
    }
    return unescape(cookieValue);
}
</script>
<body class="bg-gradient-primary">
    <div class="container">
        <!-- Outer Row -->
        <div class="row justify-content-center">
            <div class="col-xl-5 col-lg-12 col-md-9">
                <div class="card o-hidden border-0 shadow-lg my-5">
                    <div class="card-body p-0">
                        <!-- Nested Row within Card Body -->
						<div class="p-5">
						    <div class="text-center">
						        <h1 class="h4 text-gray-900 mb-4">FILMAX 관리자 로그인</h1>
						    </div>
						    <form action="loginPro" method="post" class="user">
						        <div class="form-group">
						            <input type="text" class="form-control form-control-user" id="user_id" name="user_id" aria-describedby="emailHelp" placeholder="아이디">
						        </div>
						        <div class="form-group">
						            <input type="password" class="form-control form-control-user" id="user_pw" name="user_pw" placeholder="패스워드">
						        </div>
						        <div class="form-group">
						            <div class="custom-control custom-checkbox small">
						                <input type="checkbox" id="save_id"  class="custom-control-input" >
						                <label class="custom-control-label" for="save_id">아이디 저장</label>
						            </div>
						        </div>
						        <input type="submit" value="로그인" class="btn btn-primary btn-user btn-block" /> 
						    </form>
							<hr>
						    <div class="text-center">
						    	<a class="small" href="window.location='findId'">아이디찾기</a> 
								<a class="small" href="window.location='findPw'">비밀번호찾기</a>
						    </div>
						    <div class="text-center">
								<a class="small" href="window.location='joinAgreement'">회원가입</a>
							</div>
						</div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>