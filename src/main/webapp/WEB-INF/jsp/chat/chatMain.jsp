<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>        
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>대화</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="/static/css/style.css" type="text/css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
</head>
<body>
	<div id="wrap">
		<%@ include file="/WEB-INF/jsp/include/header.jsp" %>
		<%@ include file="/WEB-INF/jsp/include/nav.jsp" %>
		<section class="d-flex">
			<div id="chatListBox" class="col-6 p-0">
<div>
			
<c:forEach var="chat" items="${chatList }">
<c:if test="${empty chatList }">
	<h1>연결된채팅이없습니다.</h1>
</c:if>
	<div class="d-flex text-dark chat-card justify-content-between" data-url="/chat/main/?id=${chat.id }">
		<div class="pl-2">
		
			<div>${chat.yourProfile.loginId}</div>
			<img src="${chat.yourProfile.profileImagePath }" width="60px" height="60px">
		</div>
		
		<div class="pr-3 text-right">
<c:if test="${chat.dateAgo eq 0 }">
			<div>오늘</div>
</c:if>
<c:if test="${chat.dateAgo ne 0 }">
			<div>${chat.dateAgo } 일전</div>	
</c:if>
<br>
			<div>${chat.lastMessage }</div>			
			

		</div>
	</div>
</c:forEach>
			
</div>
			</div>
			<div id="chatBox" class="col-6" style="border:solid;height:500px;border-right:none;">
			<c:if test="${not empty thisChat }">
				<div id="chattingArea">
				<div class="mt-2">${thisChat.yourProfile.loginId }님과의 대화</div>
				<div id="messageArea" style="height:380px;overflow:auto">
				<hr>
					<c:forEach var="message" items="${thisChat.messageList }">
						<c:if test="${message.userId ne id }">
							<div class="d-flex">	
										<img alt="yourProfile" src="${thisChat.yourProfile.profileImagePath }" style="width:80px;height:80px;border-radius:70%">
										<div class="word-break-break-all" style="width:450px">${message.content }</div>
							</div>
						</c:if>
						<c:if test="${message.userId eq id }">
							<div class="d-flex justify-content-end">	
										<div style="word-break:break-all">${message.content }</div>
										<img alt="myProfile" src="${thisChat.myProfile.profileImagePath }" style="width:80px;height:80px;border-radius:70%">
							</div>
						</c:if>
					</c:forEach>
						</div>
				<hr>
				</div>
				<div class="d-flex">
					<input type="text" class="form-control" id="messageInput">
					<button type="submit" class="btn btn-info" id="sendBtn">보내기</button>
					<h3><i class="bi bi-arrow-clockwise" id="reloadBtn"></i></h3>
				</div>
			</c:if>
			</div>
		
		
		</section>
<button type="button" class="btn btn-info btn-block" data-toggle="modal" data-target="#newChat">
	대화시작
</button>			


		<%@ include file="/WEB-INF/jsp/include/footer.jsp" %>
		<!-- Modal -->
				<div class="modal fade" id="newChat" role="dialog" aria-hidden="true">
				  <div class="modal-dialog" role="document">
				  	<div class="modal-content">
				 		<div class="nav flex-column w-100">
					 		<form action="#">
					 			<input class="form-control" name="guestLoginId" id="newChatGuestId">
				 				<button type="submit" id="newChatSubmitBtn" class="btn btn-block">대화시작</button>
				 			</form>
				 		</div>
					</div>
				  </div>
				</div>
<script>
	$(document).ready(function(){
		$("#newChatSubmitBtn").on("click",function(){
			let guestId=$("#newChatGuestId").val();
			
			let hostId = ${id};
			$.ajax({
				type:"post"
				,url:"/chat/new"
				,data:{"guestLoginId":guestId}
				,success:function(data){
					if(data.result=="success"){
						location.href="/chat/main?id="+data.chatId;
					}
					else{
						alert("채팅생성에 실패하였습니다");
					}
					
				}
				,error:function(data){
					alert("오류발생");
				}
			})
			
			
			
		})
		
		
				


		$(".chat-card").on("click",function(){
			let url = $(this).attr("data-url");
			location.href=url;
		})
		function reloadChat(){
			$("#messageArea").load(location.href+' #messageArea');

			
		}
		setInterval(function() {
			$("#messageArea").load(location.href + ' #messageArea');
//			scrollToBottom();
		}, 5000);

		$("#reloadBtn").on("click",function(){
			scrollToBottom();

			
		});
		function scrollToBottom(){
			var scrollHeight = $("#messageArea")[0].scrollHeight;
			
			$("#messageArea").scrollTop(scrollHeight);
			
		};

		
		
		
	})
</script>
<c:if test="${not empty thisChat}">
<script>
$(document).ready(function(){
	
$("#messageInput").on("keypress", function (e) {
	  if (e.key === "Enter") { // "Enter" 문자열로 엔터 키를 감지합니다.
	    e.preventDefault(); // 엔터 키의 기본 동작(폼 제출)을 막습니다.
	    $("#sendBtn").click(); // 보내기 버튼을 클릭합니다.
	  }
});

$("#sendBtn").on("click",function(){
	let content = $("#messageInput").val();
	if (content == ""){
		return;
	}
	let chatId=${thisChat.id};
	$.ajax({
		type:"post"
		,url:"/chat/sendMessage"
		,data:{"chatId":chatId,"content":content}
		,success:function(data){
			if(data.result =="success"){
				location.reload();
			}

			else{
				alert("메세지 전송에 실패하였습니다");
				return;
			}
		}
		,error:function(){
			alert("오류발생");
			return;
		}
		
		
		
	})
	
});

})
</script>
</c:if>
	</div>


</body>
</html>