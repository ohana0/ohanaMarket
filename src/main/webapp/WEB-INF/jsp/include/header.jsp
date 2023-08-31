<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>     

		<header>
			<div class="d-flex align-items-center justify-content-between">
				<div class="d-flex">
					<img src="/static/image/logoImage.png" height="75px" class="pl-2">
					<div id="logoStyle" class="pl-1">OhanaMarket</div>
				</div>
<c:if test="${not empty loginId }">
	<a id="userProfileImage" href="#"  data-toggle="modal" data-target="#userNav">
		<img alt="userImage" src="${profileImagePath }" style="width:80px;height:80px;border-radius:70%">
	</a>
				

	
</c:if>
<!-- Modal -->
				<div class="modal fade" id="userNav" role="dialog" aria-hidden="true">
				  <div class="modal-dialog" role="document">
				  	<div class="modal-content">
				 		<div class="nav flex-column w-100">
				 			<button>${loginId }</button>
						    <a href="/user/logout" class="btn nav-link bg-secondary text-white font-weight-bold">로그아웃</a>
						    <a href="#" class="btn nav-link bg-secondary text-white font-weight-bold">정보수정</a>
						</div>
					</div>
				  </div>
				</div>	
			</div>
			<hr>
		</header>