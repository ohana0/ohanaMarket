<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="/static/css/style.css" type="text/css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
</head>
<body>
	<div id="wrap">
		<header>
			<div class="d-flex align-items-center">
				<img src="/static/image/logoImage.png" height="75px" class="pl-2">
				<div id="logoStyle" class="pl-1">OhanaMarket</div>
			</div>
			<hr>
		</header>
		<section style="height:400px" class="d-flex justify-content-center">
			<div class="join-box text-center">
				<h1 class="pb-3">회원가입</h1>
<!-- joinbox1 -->
				<div id="joinBox1">
					<div class="id-input-div input-div card d-flex">
						<i class="bi bi-person-fill p-2"><input type="text" class="input-box" id="idInput" placeholder="아이디"></i>
					</div>
					<div class="pw-input-div input-div card d-flex">
						<i class="bi bi-key p-2"><input type="password" class="input-box" id="pwInput" placeholder="비밀번호"></i>
					</div>
					<div class="nickname-input-div input-div card d-flex">
						<i class="bi bi-person p-2"><input type="text" class="input-box" id="nicknameInput" placeholder="닉네임"></i>
					</div>
					<div class="phone-input-div input-div card d-flex">
						<i class="bi bi-phone-fill p-2"><input type="text" class="input-box" id="phoneInput" placeholder="전화번호, -를 생략하고 숫자만 입력하세요"></i>
					</div>
					<div class="input-div d-flex justify-content-center">
						<button type="button" class="btn btn-info btn-block" id="nextBtn">다음으로</button>
					</div>
				</div>
<!-- joinbox2 -->
				<div id="joinBox2" class="d-none">
					<div class="image-input-div input-div card d-flex">
						<i class="bi bi-file-image p-2"><input type="file" class="input-box" id="imageInput"></i>
					</div>
					<div class="region-input-div input-div card d-flex">
						<i class="bi bi-map p-2"><input type="text" class="input-box" id="regionInput" placeholder="지역"></i>
					</div>
					<div class="introduce-input-div card d-flex text-left input-div">
						<i class="bi bi-blockquote-left p-2"></i>
						<textarea id="introduceInput" class="form-control border-0" placeholder="자기소개"></textarea>
					</div>
					<div class="input-div d-flex justify-content-center">
						<button type="button" class="btn btn-info btn-block" id="beforeBtn">이전으로</button>
					</div>
				
				
				</div>
				<button type="button" class="btn btn-success btn-block" id="submitBtn">가입하기</button>
			</div>

		</section>
		
		<footer class="d-flex align-items-center">
			<div id="footerText">Copyright 2023. Ohana0 all rights reserved.</div>
		</footer>
	
	</div>

</body>

<script>
$(document).ready(function(){
	let idCheck = false;
	let nicknameCheck = false;
	let passwordCheck = false;
	let phoneCheck = false;
	$("#submitBtn").on("click",function(){
		let loginId = $("#idInput").val();
		$.ajax({
			type:"post"
			,url:"/user/join/duplicateId"
			,data:{"loginId":loginId}
			,success:function(data){
				if (data.result == "duplicate"){
					alert("중복된 아이디입니다.");
					idCheck = false;
					return;
				}
				else{
					alert("사용가능한 아이디입니다.");
					idCheck = true;
					return;
				}
				
			}
			,error:function(){
				alert("오류발생");
			}
		})
		
		if(!idCheck){
			$(".id-input-div").addClass("border-red")
		}
		else{
			$(".id-input-div").removeClass("border-red")
		}
		
	})
	
	
	$("#nextBtn").on("click",function(){

		$("#joinBox1").addClass("d-none");
		$("#joinBox2").removeClass("d-none");
	})
	$("#beforeBtn").on("click",function(){
		
		$("#joinBox2").addClass("d-none");
		$("#joinBox1").removeClass("d-none");
		
	})
	

	
})


</script>
</html>