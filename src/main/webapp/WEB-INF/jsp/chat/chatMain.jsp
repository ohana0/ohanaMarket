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
			<div id="chatListBox" class="col-6" style="border:solid;height:500px;overflow:auto">
<c:forEach var="chat" items="${chatList }">
	<a class="card d-flex text-dark chat-card" href="/chat/main/?id=${chat.id }" style="height:90px;overflow:hidden">
		<div>
			<div>${chat.yourProfile.loginId}</div>
			<img src="${chat.yourProfile.profileImagePath }" width="60px" height="60px">
		</div>
		<div>
			<div>${chat.lastMessage }</div>
			<div>${chat.updatedAt }</div>	
		</div>
	</a>
</c:forEach>			
			</div>
			<div id="chatBox" class="col-6" style="border:solid;height:500px">
			<c:if test="${not empty thisChat }">
				<div class="mt-2">${thisChat.yourProfile.loginId }님과의 대화</div>
				<div style="height:380px;overflow:auto">
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
				<div class="d-flex">
					<input type="text" class="form-control" id="messageInput">
					<button type="submit" class="btn btn-info" id="sendBtn">보내기</button>
					<h3><i class="bi bi-arrow-clockwise" id="reloadBtn"></i></h3>
				</div>
			</c:if>
			</div>
		
		
		
		</section>


		<%@ include file="/WEB-INF/jsp/include/footer.jsp" %>
<script>
	$(document).ready(function(){

        setInterval(function() {
              	

        }, 3000); 

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
			
		});
		$("#reloadBtn").on("click",function(){
			location.reload();
			
		});

		
		
		
	})
</script>
	</div>


</body>
</html>