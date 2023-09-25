<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>     

		<header>
			<div class="d-flex align-items-center justify-content-between">
				<a class="d-flex" href="/board/post/main">
					<img src="/static/image/logoImage.png" height="75px" class="pl-2">
					<div id="logoStyle" class="pl-1 text-dark">OhanaMarket</div>
				</a>
<c:if test="${not empty loginId }">
<div>
	<a id="chatImage" href="/chat/main">
		<img alt="chatIcon" src="/static/image/chatImage.png" style="width:80px;height:80px">
	</a>
	<a id="searchImage" href="#"  data-toggle="modal" data-target="#searchBox">
		<img alt="searchIcon" src="/static/image/searchImage.png" style="width:80px;height:80px;border-radius:70%">
	</a>
	<a id="userProfileImage" href="#"  data-toggle="modal" data-target="#userNav">
		<img alt="userImage" src="${profileImagePath }" style="width:80px;height:80px;border-radius:70%">
	</a>
	
				

	
</div>
</c:if>
<!-- Modal -->
				<div class="modal fade" id="userNav" role="dialog" aria-hidden="true">
				  <div class="modal-dialog" role="document">
				  	<div class="modal-content">
				 		<div class="nav flex-column w-100">
				 			<button id="myProfileLink">${loginId }</button>
						    <a href="/user/logout" class="btn nav-link bg-secondary text-white font-weight-bold">로그아웃</a>
						    <a href="#" class="btn nav-link bg-secondary text-white font-weight-bold">정보수정</a>
						</div>
					</div>
				  </div>
				</div>
<!-- Modal -->
				<div class="modal fade" id="searchBox" role="dialog" aria-hidden="true">
				  <div class="modal-dialog" role="document">
				  	<div class="modal-content">
				 		<div class="nav flex-column w-100">
				 		<div class="d-flex">
					 		<label>거래게시판<input type="radio" name="searchType" value="keyWord" checked></label>
					 		<label>자유게시판<input type="radio" name ="searchType" value="keyWordPost"></label>
					 		<label>작성자<input type="radio" name = "searchType" value="user"></label>
					 		<label>지역<input type="radio" name ="searchType" value="region"></label>
				 		</div>
				 			<form class="keyword-search" id="searchByKeyWord" method="get" action="/board/trade/search">
				 				<input type="text" class="form-control" placeHolder="검색어를 정확하게 입력하세요" name="keyWord">
					 			<button type="submit" class="btn btn-block">검색</button>
				 			</form>
				 			
				 			<form class="post-search d-none" method="get" id="searchByKeyWordPost" action="/board/post/search">
				 				<input type="text" class="form-control" placeHolder="검색어를 정확하게 입력하세요" name="keyWord">
					 			<button type="submit" class="btn btn-block">검색</button>
				 			</form>
				 			
					 		<form class="user-search d-none" id="searchByUser" method="get" action="/user/profile">
					 			<input type="text" class="form-control" placeHolder="아이디를 정확하게 입력하세요" name="userId">
					 			<button type="submit" class="btn btn-block">검색</button>
					 		</form>
					 		
				 			<form class="region-search d-none" method="get" id="searchByRegion" action="/board/trade/search">
				 				<input type="text" class="form-control" placeHolder="지역정보를 입력하세요(예시:강남구)" name="searchRegion">
					 			<button type="submit" class="btn btn-block">검색</button>
				 			</form>
						</div>
					</div>
				  </div>
				</div>	
			</div>
			<hr>
<script>
$(document).ready(function(){
		$("#myProfileLink").on("click",function(){
			location.href="/user/profile?userId="+"${loginId}";
		})
        $("input[name=searchType]").on('change', function() {
            if($(this).val() == 'keyWord') {
                $("#searchByKeyWord").removeClass("d-none");
                $("#searchByKeyWordPost").addClass("d-none");
                $("#searchByUser").addClass("d-none");
                $("#searchByRegion").addClass("d-none");
            } 
            else if($(this).val() == "keyWordPost"){
                $("#searchByKeyWord").addClass("d-none");
                $("#searchByKeyWordPost").removeClass("d-none");
                $("#searchByUser").addClass("d-none");
                $("#searchByRegion").addClass("d-none");
            }
            else if($(this).val() == "user"){
                $("#searchByKeyWord").addClass("d-none");
                $("#searchByKeyWordPost").addClass("d-none");
                $("#searchByUser").removeClass("d-none");
                $("#searchByRegion").addClass("d-none");
            }
            else{
                $("#searchByKeyWord").addClass("d-none");
                $("#searchByKeyWordPost").addClass("d-none");
                $("#searchByUser").addClass("d-none");
                $("#searchByRegion").removeClass("d-none");
            }
        });
})

</script>
		</header>