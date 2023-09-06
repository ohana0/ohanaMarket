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
			<div>
<c:forEach var="trade" items="${tradeList }" >

<a href="/board/trade?id=${trade.id }" class="text-secondary">
				<div class="card post-card">
					<div class="d-flex justify-content-between align-items-center m-2">
						<div>
							<b class="main-title">${trade.title }</b>
							<div>${trade.userId }</div>
						</div>
						<div class="d-flex align-items-center">
						
							
							${trade.thumbnail }
							<div class="card m-2 text-center" style="width:60px;height:60px">${trade.commentCount }</div>
							<fmt:formatDate value="${trade.createdAt}" pattern="yyyy-MM-dd" type="date" var="createdAt"/>
							<fmt:parseDate value="${createdAt }" var="createdAtDate" pattern="yyyy-MM-dd"/>
							<fmt:parseNumber value="${createdAtDate.time / (1000*60*60*24)}" integerOnly="true" var="createdAtNumber"></fmt:parseNumber>
							<br>
							<fmt:formatDate value="<%=new java.util.Date()%>" pattern="yyyy-MM-dd mm:ss" type="date" var="now"/>
							<fmt:parseDate value="${now }" var="nowDate" pattern="yyyy-MM-dd"/>
							<fmt:parseNumber value="${nowDate.time / (1000*60*60*24)}" integerOnly="true" var="nowDateNumber"></fmt:parseNumber>
							<c:if test="${nowDateNumber eq createdAtNumber}">
								<div>오늘</div>
								
							</c:if>
							<c:if test="${nowDateNumber ne createdAtNumber}">
								<div>${nowDateNumber-createdAtNumber }일전</div>
							</c:if>
						</div>

					</div>
				</div>
</a>
</c:forEach>

				<a href="/board/trade/new"><button type="button" class="btn btn-warning">새글쓰기</button></a>
			</div>
			
		
		
		
		
		</section>
		
		<%@ include file="/WEB-INF/jsp/include/footer.jsp" %>
<script>
	$(document).ready(function(){
		
		
	})
</script>
	</div>


</body>
</html>