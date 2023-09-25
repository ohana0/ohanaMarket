<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>        
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${trade.title}</title>
	<script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
	<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
	<link rel="stylesheet" href="/static/css/style.css" type="text/css">
	<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
	<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css" />
</head>
<body>
	<div id="wrap">

		<%@ include file="/WEB-INF/jsp/include/header.jsp" %>
		<%@ include file="/WEB-INF/jsp/include/nav.jsp" %>

		<section class="d-flex justify-content-center">
		
		
			<div id="contentBox" class="d-flex">
				<div class="image-area m-2 p-2" style="width:300px;height:430px">
					<div class="image-box" style="height:380px">
						<div class="slider-wrap">
<c:forEach var="url" items="${imageList }">
							<div><img src="${url}" width="284px" id="tradeImage"></div>
</c:forEach>
						</div>
					</div>
					

				</div>
				
				
				
				<div class="ml-5" style="width:500px">
					<div class="content-area" style="height:400px">
						<h1>${trade.title }</h1>
						<a class="text-dark" href="/user/profile?userId=${trade.userId }">${trade.userId }</a>
						<div style="height:240px">
							<div>${trade.content }</div>
<c:if test="${trade.userId eq loginId }">	
							<div class="d-flex">
								<label>판매등록<input type="radio" name="state" value="판매등록"></label>
								<label>거래대기<input type="radio" name="state" value="거래대기"></label>
								<label>거래완료<input type="radio" name="state" value="거래완료"></label>
							</div>
								<button id="updateStateBtn" type="button" class="btn btn-block">변경</button>
</c:if>

						</div>
						<h5>희망가격: ${trade.price }원</h5>
<c:if test="${not empty trade.tradeLocation }">
						<div>거래희망장소: ${trade.tradeLocation }</div>
</c:if>
						<div>현재상태: ${trade.state }</div>
					
					</div>
				
			
					<div class="button-area d-flex justify-content-between">
<c:if test="${trade.userId eq loginId }">			
						<div>
							<button type="button" class="btn btn-danger" id="deleteBtn">삭제하기</button>
							<button type="button" class="btn btn-secondary" id="updateBtn"><a class="text-light" href="/board/trade/update?id=${trade.id }">수정하기</a></button>
						</div>
</c:if>
						<div>
							<c:if test="${trade.userId ne loginId}">
								<button type="button" class="btn btn-danger" id="newChatBtn">채팅시작하기</button>
							</c:if>
							<a href="/board/trade/main"><button type="button" class="btn btn-primary" >목록으로</button></a>
						</div>		
					</div>
				</div>
			</div>
		</section>
		
		<%@ include file="/WEB-INF/jsp/include/footer.jsp" %>
	</div>
		
<script>

	$(document).ready(function(){
		$("#newChatBtn").on("click",function(){
			alert();
			let hostId = ${id};
			let guestId = "${trade.userId}";
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
		
		$("#updateStateBtn").on("click",function(){
			let state = $('input[name="state"]:checked').val();
			let postId = ${trade.id};
			$.ajax({
				type:"post"
				,url:"/board/trade/changestate"
				,data:{"state":state,"postId":postId}
				,success:function(data){
					if(data.result == "success"){
						location.reload();
					}
					else{
						alert("변경실패");
					}
				}
				,error:function(){
					alert("오류발생");
				}
				
			})
			
		})
		$('.slider-wrap').slick({
			slidesToShow: 1,
			slide: "div",
			slidesToScroll: 1,
			arrows : true, 		// 옆으로 이동하는 화살표 표시 여부
			dots:true,
			prevArrow : "<button type='button' class='slick-prev bg-dark'></button>",		// 이전 화살표 모양 설정
			nextArrow : "<button type='button' class='slick-next bg-dark'></button>",
		})


		$("#deleteBtn").on("click",function(){
			let postId = ${trade.id};
			$.ajax({
				type:"delete"
				,url:"/board/trade/delete"
				,data:{"postId":postId}
				,success:function(data){
					if(data.result =="success"){
						location.href="/board/trade/main";
						
					}
					else{
						alert("삭제에 실패했습니다.");
						return;
					}
					
				}
				,error:function(){
					alert("오류발생");
				}
			})
			
		})
		

		

	})
</script>


</body>
</html>