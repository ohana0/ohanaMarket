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
					<div class="title-input-box d-flex text-center">
						<label class="col-2 p-1 m-1" style="font-weight:bold;font-size:20px">제목</label><input class="form-control">
					</div>
				 	<textarea id="summernote"></textarea>
					<button id="submitBtn" class="btn btn-secondary btn-block" type="button">클릭</button>
				</div>
			</div>

		</section>
		
		<%@ include file="/WEB-INF/jsp/include/footer.jsp" %>
	</div>
<script>
$(document).ready(function() {
	$("#submitBtn").on("click",function(){
		alert($("#summernote").val());

		
	})

	//여기 아래 부분
	$('#summernote').summernote({
		height: 400,		          // 에디터 높이
		lang: "ko-KR",					// 한글 설정
		focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
		minHeight: null,             // 최소 높이
		maxHeight: null,             // 최대 높이
		placeholder: '최대 2048자까지 쓸 수 있습니다',	//placeholder 설정
		toolbar:[
		 // [groupName,[list of button]]
		 ['fontname',['fontname']],
		 ['fontsize',['fontsize']],
		 ['style',['bold','italic','underline']],
		 ['color', ['color']],
		 ['height', ['height']],
		 ['insert',['picture']]
		],
		fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
		fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']
		,callbacks: {	//여기 부분이 이미지를 첨부하는 부분
			onImageUpload : function(files) {
				let file = files[0];
				uploadFile(file,this);



			}
		}
		
	});
	
	function uploadFile(file,editor){
		let formData = new FormData();
		formData.append("file",file);
		
		$.ajax({
			type:"post"
			,url:"/uploadSummernoteImageFile"
			,enctype: 'multipart/form-data' // 파일 업로드를 위한 필수 설정
			,processData: false             // 파일 업로드를 위한 필수 설정
			,contentType: false              // 파일 업로드를 위한 필수 설정
			,data: FormData
			,function(data){
				if(data.result =="success"){
					
					return data;
				}

			}
			,error(){
				alert("이미지 등록에 오류가 발생했습니다.");
			}
		
		})
	}
	



});
</script>
</body>
</html>