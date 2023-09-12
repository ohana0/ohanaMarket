<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>        
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
	
	<script src="/static/summernote/summernote-lite.js"></script>
	<script src="/static/summernote/lang/summernote-ko-KR.js"></script>
	
	<link rel="stylesheet" href="/static/summernote/summernote-lite.css">
</head>
<body>
	<div id="wrap">
		<%@ include file="/WEB-INF/jsp/include/header.jsp" %>
		<%@ include file="/WEB-INF/jsp/include/nav.jsp" %>
		<section class="d-flex justify-content-center">
			<div>
				<br>	
				<div class="card post-input-box">
					<div class="title-input-box">
						<label class="p-2 m-2 d-flex w-100 text-center align-items-center" style="font-weight:bold;font-size:20px"><div>제목</div>
						<input class="form-control col-10 m-2" id="titleInput"></label>
					</div>
					<div class="d-flex">
						<div class="content-input-area col-8">
						
						 	<textarea class="form-control" rows="15" id="contentInput"></textarea>
						
						</div>
						
						<div class="price-type-location-area col-4">
							<br>
							<div class="price-area m-2">
								<label class="p-1 d-flex align-items-center w-100"><div class="mr-1">가격</div>
								<input id="priceInput" type="number" class="form-control col-9"></label>
							</div>
							<div class="type-area m-2">
								<label><input type="radio" name="type" value="delivery" checked>택배</label>
								<br>
								<label><input type="radio" name="type" value="direct">직거래</label>
							</div>
							<div class="trade-location-area m-2">
								<div>여기는 지도입력이들어갈 자리임</div>
								<input id="locationInput" type="text" placeholder="일단 대충 text입력으로놔둠" class="form-control">
							</div>
							<div class="image-input-area m-2">
								<label>이미지 등록
									<input id="imageInput" type="file" class="form-control" accept="image/*" multiple/>
								</label>
								
							</div>
						
						</div>
				
					</div>
					<button id="submitBtn" class="btn btn-secondary btn-block mt-2" type="button">작성</button>
				</div>
			</div>

		</section>
		
		<%@ include file="/WEB-INF/jsp/include/footer.jsp" %>
	</div>
<script>
$(document).ready(function() {
	$("#submitBtn").on("click",function(){
		let title = $("#titleInput").val();
		let content = $("#contentInput").val();
		let tradeLocation = $("#locationInput").val();
		let price = $("#priceInput").val();
		var type = $('input[name="type"]:checked').val();
	    var fileInput = document.getElementById("imageInput");
		let files = fileInput.files;	
		let formData = new FormData();
		
		if(title == ""){
			alert("제목을 입력하세요");
			return;
		}
		if(content == "" || price == "" || type == ""){
			alert("내용을 입력하세요");
			return;
		}
		if(type == "direct" && tradeLocation == ""){
			alert("거래장소를 입력하세요");
			return;
		}
		
		formData.append("title",title);
		formData.append("content",content);
		formData.append("price",price);
		formData.append("type",type);
		formData.append("tradeLocation",tradeLocation);
		for(let i = 0; i< files.length; i++){
			formData.append("files",files[i]);
		}



		$.ajax({
			type:"post"
			,url:"/board/trade/new/input"
			,data:formData
			,enctype: 'multipart/form-data' // 파일 업로드를 위한 필수 설정
			,processData: false             // 파일 업로드를 위한 필수 설정
			,contentType: false              // 파일 업로드를 위한 필수 설정
			,success:function(data){
				if(data.result == "success"){

					location.href="/board/trade/main";
				}
				else{
					alert("업로드에 실패했습니다");
					return;
				}
			}
			,error:function(){
				alert("에러가 발생했습니다.");
			}
		
			
		})
		
		
		
		
		
		
	})
		
})

</script>
</body>
</html>