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
		<%@ include file="/WEB-INF/jsp/include/header.jsp" %>
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
				<div>회원이라면? <a href="/user/login/view">로그인하러가기</a></div>
			</div>

		</section>
		<%@ include file="/WEB-INF/jsp/include/footer.jsp" %>

	</div>

</body>

<script>
$(document).ready(function(){
	let idCheck = false;
	let nicknameCheck = false;
	let passwordCheck = false;
	let phoneCheck = false;
	let regionCheck = false;
	
	$("#submitBtn").on("click",function(){
		if(!idCheck){
			alert("아이디를 확인하세요");
			return;
		}
		if(!passwordCheck){
			alert("비밀번호를 확인하세요");
			return;
		}
		if(!nicknameCheck){
			alert("닉네임을 확인하세요");
			return;
		}
		if(!phoneCheck){
			alert("전화번호를 확인하세요");
			return;
		}
		if(!regionCheck){
			alert("지역설정을 확인하세요");
			return;
		}
		
		let loginId = $("#idInput").val();
		let password = $("#pwInput").val();
		let nickname = $("#nicknameInput").val();
		let phoneNumber = $("#phoneInput").val();
		var file = $("#imageInput")[0].files[0];
		let region = $("#regionInput").val();
		let introduce = $("#introduceInput").val();
		
		var formData = new FormData();
		formData.append("loginId",loginId);
		formData.append("password",password);
		formData.append("nickname",nickname);
		formData.append("phoneNumber",phoneNumber);
		formData.append("profileImage",file);
		formData.append("region",region);
		formData.append("introduce",introduce);
		
		$.ajax({
			type:"post"
			,url:"/user/join"
		    ,enctype: 'multipart/form-data' // 파일 업로드를 위한 필수 설정
		   	,processData: false             // 파일 업로드를 위한 필수 설정
		    ,contentType: false              // 파일 업로드를 위한 필수 설정
			,data:formData
			,success:function(data){
				if(data.result == "success"){
					alert("가입 성공");
					location.href="/user/login/view";
				}
				else{
					alert("가입 실패");
					return;
				}
			}
			,error:function(){
				alert("오류발생");
				return;
			}
		})
		
		
	})
	
//region 유효성검사: 빈칸만아니게
	$("#regionInput").on("input",function(){
		let region = $(this).val();
		if(region == ""){
			regionCheck = false;
		}
		else{
			regionCheck = true;
			
		}
		if(!regionCheck){
			$(".region-input-div").addClass("border-red")
		}
		else{
			$(".region-input-div").removeClass("border-red")
		}
		
		
		
	})
	
	
//phonenumber 유효성검사: 정규식 활용
	$("#phoneInput").on("input",function(){
		let phoneNumber = $(this).val();
		//숫자만 입력할수 있도록 하는 유효성검사.
		let check = /^[0-9]+$/; 
		if (!check.test(phoneNumber)||phoneNumber == ""||phoneNumber.length>11) {
			phoneCheck = false;
		}
		else{
			phoneCheck = true;
		}
		if(!phoneCheck){
			$(".phone-input-div").addClass("border-red")
		}
		else{
			$(".phone-input-div").removeClass("border-red")
		}
		
		
	})

	
	
	
//nickname 유효성 검사: 글자수체크,중복확인
	$("#nicknameInput").on("input",function(){
		let nickname = $(this).val();
		if(nickname == ""){
			nicknameCheck = false;
			$(".nickname-input-div").addClass("border-red");
			return;
		}
		$.ajax({
			type:"post"
			,url:"/user/join/duplicateNickname"
			,data:{"nickname":nickname}
			,success:function(data){
				if (data.result == "duplicate"){
					nicknameCheck = false;
					$(".nickname-input-div").addClass("border-red");
					return;
				}
				else{
					nicknameCheck = true;
					$(".nickname-input-div").removeClass("border-red");
					return;
				}
				
			}
		})

		
		
	})
	
//password유효성검사: 글자수 체크하여 passwordCheck 객체값으로 유효성을 저장하고, 빨간색으로 배경이표시되도록 함. 	
	$("#pwInput").on("input",function(){
		let password = $("#pwInput").val();

		if(password == ""||password.length<4){
			passwordCheck = false;
		}
		else{
			passwordCheck = true;
		}
		
		if(!passwordCheck){
			$(".pw-input-div").addClass("border-red")
		}
		else{
			$(".pw-input-div").removeClass("border-red")
		}

	})	

//loginId유효성검사: 중복확인 및 글자수 체크하여 idcheck 객체값으로 유효성을 저장하고, 빨간색으로 배경이표시되도록 함. 이거 한박자씩 느리게 발동되는 오류가있음.
	$("#idInput").on("focus keyup",function(){
		let loginId = $("#idInput").val();

		if(loginId == ""||loginId.length<4){
			idCheck = false;
			$(".id-input-div").addClass("border-red")
			return;
		}
		
		$.ajax({
			type:"post"
			,url:"/user/join/duplicateId"
			,data:{"loginId":loginId}
			,success:function(data){
				if (data.result == "duplicate"){
					idCheck = false;
					$(".id-input-div").addClass("border-red")

				}
				else{
					idCheck = true;
					$(".id-input-div").removeClass("border-red")

				}
				
			}
			,error:function(){
				alert("오류발생");
			}
		})


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