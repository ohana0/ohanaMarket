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
	
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=597e8a0237aa981812cfe1237d7a949b&libraries=services"></script>

    <style>
    .map_wrap {position:relative;width:100%}
    .hAddr {position:absolute;left:10px;top:10px;border-radius: 2px;background:#fff;background:rgba(255,255,255,0.8);z-index:1;padding:5px;}
    #centerAddr {display:block;margin-top:2px;font-weight: normal;}
    .bAddr {padding:5px;text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
    </style>
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
								<button type="button" class="btn btn-block"a id="regionInput" data-toggle="modal" data-target="#regionMapInput">지도펼치기</button>
								<input id="locationInput" type="text" class="form-control" disabled>
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
<!-- Modal -->
		<div class="modal fade" id="regionMapInput" role="dialog" aria-hidden="true">
		  <div class="modal-dialog" role="document">
		  	<div class="modal-content m-0" style="width:405px;height:438px">
		 		<div class="nav flex-column w-100">
		 			<div id="map" style="width:400px;height:400px;"></div>

				</div>
				<button type="button" class="btn btn-block" id="closeModal">입력하기</button>
			</div>
		  </div>
		</div>			
	</div>
	
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
mapOption = {
    center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
    level: 6 // 지도의 확대 레벨
};  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 지도에 확대 축소 컨트롤을 생성한다
var zoomControl = new kakao.maps.ZoomControl();

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

var marker = new kakao.maps.Marker(), // 클릭한 위치를 표시할 마커입니다
infowindow = new kakao.maps.InfoWindow({zindex:1}); // 클릭한 위치에 대한 주소를 표시할 인포윈도우입니다

// 지도를 클릭했을 때 클릭 위치 좌표에 대한 주소정보를 표시하도록 이벤트를 등록합니다
kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
	map.relayout();
	searchAddrFromCoords(mouseEvent.latLng, function(result, status) {
	    if (status === kakao.maps.services.Status.OK) {
	        var infoDiv = mouseEvent.latLng;
		
	        for(var i = 0; i < result.length; i++) {
	            // 행정동의 region_type 값은 'H' 이므로
	            if (result[i].region_type === 'H') {
	                var addrInfo = result[i].address_name;
	                break;
	            }
	        }

	        var content = '<div class="bAddr">' +
	                        addrInfo +
	                    '</div>';
	
	        // 마커를 클릭한 위치에 표시합니다 
	        marker.setPosition(mouseEvent.latLng);
	        marker.setMap(map);
	
	        // 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
	        infowindow.setContent(content);
	        infowindow.open(map, marker);
					
	        var regionInput = document.getElementById("locationInput");
	        regionInput.setAttribute("value",addrInfo);
	    }   	
	});
});

function searchAddrFromCoords(coords, callback) {
	// 좌표로 행정동 주소 정보를 요청합니다
	geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);         
}

function searchDetailAddrFromCoords(coords, callback) {
	// 좌표로 법정동 상세 주소 정보를 요청합니다
	geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
}
</script>	
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