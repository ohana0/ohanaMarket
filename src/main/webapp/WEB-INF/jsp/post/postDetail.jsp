<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>        
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${post.title}</title>
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
			<div id="contentBox" class="card m-2">
				<div class="p-2 title-box">
					<h1 id="titleArea" class="m-2">${post.title }</h1>
					<div class="d-flex justify-content-between m-2">
						<div>
							<fmt:formatDate value="${post.createdAt}" pattern="yyyy-MM-dd HH:mm" type="date"/>
	


						</div>
						<a class="text-dark" href="/user/profile?userId=${post.userId }">${post.userId }</a>
					</div>
	

					
				</div> 
				<hr>
				<div class="content-box m-2" style="width:800px">
					<div>${post.content }</div>
				</div>
				<div class="comment-box bg-light m-2">
					<div>댓글${post.commentCount }개</div>
<c:forEach var="comment" items="${post.commentList }">
					<div class="d-flex m-2">
						<a href="/user/profile?userId=${comment.userId }" class="text-dark col-2">${comment.userId }</a>
						<div class="col-10">${comment.content}</div>
					</div>

					
</c:forEach>				
					<div class="comment-input d-flex">
						<input class="form-control" id="commentInput">
						<button type="button" class="btn btn-secondary" id="commentInputBtn">작성</button>
					</div>
			
				</div>
				
				<div class="d-flex justify-content-between m-2">
					<a href="/board/post/new"><button type="button" class="btn btn-warning">새글쓰기</button></a>
					<div class="d-flex">
						<a href="/board/post/main"><button class="btn btn-primary">목록으로</button></a>
<c:if test="${post.userId eq loginId }">						
						<a href="/board/post/update?id=${post.id }"><button class="btn btn-secondary">수정하기</button></a>
						<a href="#"><button class="btn btn-danger" id="deletePost">삭제하기</button></a>
</c:if>						
					</div>
				</div>
				
				
			
			
			</div>
		
		</section>
		
		<%@ include file="/WEB-INF/jsp/include/footer.jsp" %>
<script>
	$(document).ready(function(){
		$("#deletePost").on("click",function(){
			let postId = ${post.id};
			$.ajax({
				type:"delete"
				,url:"/board/post/delete"
				,data:{"postId":postId}
				,success:function(data){
					if(data.result == "success"){
						
						location.href="/board/post/main";
					}
					else{
						alert("게시글 삭제에 실패하였습니다.");
						return;
					}
				}
				,error:function(){
					alert("오류가 발생하였습니다");
					return;
				}
				
			})
		})
		
		
		
		$("#commentInputBtn").on("click",function(){
			let content = $("#commentInput").val();
			let postId = ${post.id};
			let userId = ${id};
			if(content ==""){
				alert("댓글을 입력하세요");
				return;
			}
			$.ajax({
				type:"post"
				,url:"/board/post/new/comment"
				,data:{"id":userId,"postId":postId,"content":content}
				,success:function(data){
					if(data.result == "success"){
						
						location.reload();
					}
					else{
						alert("댓글입력에 실패하였습니다");
						return;
					}
					
				}
				,error:function(){
					alert("오류가 발생하였습니다");
					return;
				}
			})
			
			
			
		})
		
	})
</script>
	</div>


</body>
</html>