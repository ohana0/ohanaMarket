<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>        
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
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
		<section class="d-flex justify-content-center">
			<div id="contentListArea" style="overflow:auto">
<c:forEach var="trade" items="${tradeList }" >
<c:if test="${trade.state eq  '거래완료'}">						
<a href="/board/trade/?id=${trade.id }" class="text-light">
								<div class="card post-card" style="border-color:gray">
</c:if>
<c:if test="${trade.state ne '거래완료' }">
<a href="/board/trade/?id=${trade.id }" class="text-secondary">		
								<div class="card post-card border-black" data-trade-id="${trade.id }">
</c:if>
									<div class="d-flex justify-content-between align-items-center m-2">
										<div>
											<b class="main-title">${trade.title }</b>
											<div>${trade.userId }</div>
										</div>
										<div class="d-flex align-items-center">
										<div>
										
											<h3><fmt:formatNumber value="${trade.price}" pattern="#,###" />원</h3>
											<div>${trade.tradeLocation }</div>
										</div>
<c:if test="${trade.thumbnailImagePath ne null }">										
											<img src="${trade.thumbnailImagePath }" width="60px" height="60px">
</c:if>
<c:if test="${trade.dateAgo eq 0 }">
											<div>오늘</div>
</c:if>
<c:if test="${trade.dateAgo ne 0 }">
											<div>${trade.dateAgo }일전</div>
</c:if>
										</div>
									</div>
				
				</div>
</a>
</c:forEach>
				</div>
		</section>
		<a href="/board/trade/new"><button type="button" class="btn btn-warning m-4">새글쓰기</button></a>
		
		<%@ include file="/WEB-INF/jsp/include/footer.jsp" %>
	</div>
<script>
	$(document).ready(function(){
		$("#completed-trade-card").on("click",function(){
			var tradeId = $(this).attr("data-trade-id");
			if(tradeId != ${loginId}){
				alert("완료된 거래입니다");
				return;
			}
		})

		
	})
</script>


</body>
</html>