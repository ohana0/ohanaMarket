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
			<div id="chatListBox" class="col-6" style="border:solid;height:500px">
<c:forEach var="chat" items="${chatList }">
	<a class="card" href="/chat/main/?id=${chat.id }">
		<div>
		<div>${chat.host.loginId},${chat.guest.loginId }</div>
		<img src="${chat.host.profileImagePath }" width="60px" height="60px">
		</div>
		<div>${chat.lastMessage }</div>
		<div>${chat.updatedAt }</div>	
	</a>
</c:forEach>			
			</div>
			<div id="chatBox" class="col-6" style="border:solid;height:500px">
				<div style="height:440px">
<c:forEach var="message" items="${thisChat.messageList }">
	<c:if test="${message.userId ne id }">
					<div class="text-left">${message.content }</div>	
	</c:if>
	<c:if test="${message.userId eq id }">
					<div class="text-right">${message.content }</div>
	</c:if>
</c:forEach>
				</div>
				<label class="d-flex">
					<input type="text" class="form-control" id="messageInput">
					<button class="btn btn-info" id="sendBtn">보내기</button>
					<h3><i class="bi bi-arrow-clockwise" id="reloadBtn"></i></h3>
				</label>
			</div>
		
		
		
		</section>


		<%@ include file="/WEB-INF/jsp/include/footer.jsp" %>
<script>
	$(document).ready(function(){
		$("#sendBtn").on("click",function(){
			let content = $("#messageInput").val();
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
			
		})
		$("#reloadBtn").on("click",function(){
			location.reload();
			
		})

		
		
		
	})
</script>
	</div>


</body>
</html>