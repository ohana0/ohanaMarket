<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>        
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${user.nickname}님의 프로필</title>
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
<c:if test="${empty user }">
	<div>검색된 유저가 존재하지 않습니다.</div>
	<a href="/board/post/main">돌아가기</a>
</c:if>
		<section >
			<div class="d-flex ml-4">
				<img src="${user.profileImagePath }" height="100px">
				<div class="profile-info ml-4">
					<h1>${user.loginId }</h1>
					<div>닉네임: ${user.nickname }</div>
					<div>지역: ${user.region }</div>
					<div>소개: ${user.introduce }</div>
					
				
				</div>
<c:if test="${id ne user.id }">
				<div>
					<button class="btn btn-info" type="button" id="hostChat">채팅걸기</button>
				</div>
</c:if>
			</div>
			
		<hr>
		<div class="d-flex">
			<div class="col-5">
				<h5>자유게시판</h5>
<c:forEach var="post" items="${postList }" >

				<a href="/board/post?id=${post.id }" class="text-secondary">
					<div class="card profile-post-card">
						<div class="d-flex justify-content-between align-items-center m-2">
							<div>
								<b class="main-title">${post.title }</b>
							</div>
							<div class="d-flex align-items-center">							
								${post.thumbnail }
							</div>
						</div>
					</div>
				</a>
</c:forEach>		
			
			</div>
			
			<div class="col-5">
				<h5>거래게시판</h5>
			
<c:forEach var="trade" items="${tradeList }" >


				<a href="/board/trade/?id=${trade.id }" class="text-secondary">		
					<div class="card profile-post-card" data-trade-id="${trade.id }">

						<div class="d-flex justify-content-between align-items-center m-2">
							<div>
								<b class="main-title">${trade.title }</b>
							</div>
							<div class="d-flex align-items-center">
<c:if test="${trade.thumbnailImagePath ne null }">										
								<img src="${trade.thumbnailImagePath }" width="60px" height="60px">
</c:if>

							</div>
						</div>
					
					</div>
				</a>
</c:forEach>			
			</div>
		</div>
		
		
		
		</section>
		<%@ include file="/WEB-INF/jsp/include/footer.jsp" %>
<script>
	$(document).ready(function(){
		$("#hostChat").on("click",function(){
			let guestId=${user.id};
			$.ajax({
				type:"post"
				,url:"/chat/new"
				,data:{"guestId":guestId}
				,success:function(data){
					if(data.result =="success"){
						location.href="/chat/main?id="+data.chatId;
					}
					else{
						alert("채팅생성실패");	
					}					
				}
				,error:function(){
					alert("에러발생");
				}
				
			})
			
		})
		
	})
</script>
	</div>


</body>
</html>