<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
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
		<section style="height:400px" class="d-flex justify-content-center align-items-center">
			<div id="loginBox">
				<h1>로그인</h1>
				<div class="id-input-div input-div card d-flex">
					<i class="bi bi-person-fill p-2"><input type="text" class="input-box" id="idInput" placeholder="아이디"></i>
				</div>
				<div class="pw-input-div input-div card d-flex">
					<i class="bi bi-key p-2"><input type="password" class="input-box" id="pwInput" placeholder="비밀번호"></i>
				</div>
				<button type="submit" class="btn btn-success btn-block" id="loginBtn">로그인</button>

				<div>회원이아니라면? <a href="/user/join/view">회원가입 하러가기</a></div>
			</div>
		
		
		</section>
		<%@ include file="/WEB-INF/jsp/include/footer.jsp" %>
	</div>
	
	<script>
		$(document).ready(function(){
			$("#loginBtn").on("click",function(){
				let loginId = $("#idInput").val();
				let password = $("#pwInput").val();
				if(loginId == ""){
					alert("아이디를 입력하세요");
					return;
				}
				if(password == ""){
					alert("비밀번호를 입력하세요");
				}
				
				$.ajax({
					type:"post"
					,url:"/user/login"
					,data:{"loginId":loginId,"password":password}
					,success:function(data){
						if(data.result == "success"){
							location.href="/board/post";
						}
						else{
							alert("아이디나 비밀번호가 틀렸습니다.");
							return;
						}
					}
					,error:function(){
						alert("오류발생");
						return;
					}
				})				
				
				
			})
		})
	
	</script>
</body>
</html>