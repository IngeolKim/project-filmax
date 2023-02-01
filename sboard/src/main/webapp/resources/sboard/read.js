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
		
		$(".reBtn").click(function(){
			alert("aaaa");
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