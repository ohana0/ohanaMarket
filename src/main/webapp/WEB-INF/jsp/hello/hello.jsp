<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>helloworld</title>
	<script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
	<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css" />
	
	<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
	<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
</head>
<body>
	<h1 style="text-weight:bold">helloWorld!</h1>
	<div class="slider-wrap" style="width:400px">
	<c:forEach var="image" items="${imageList }">
		<img src="${image.url}" width="280px" id="tradeImage">
	</c:forEach>
	</div>
<script>
	$(document).ready(function(){
		$('.slider-wrap').slick({
	        autoplay: true,
	        autoplaySpeed: 2000,
	        dots: true,
	        infinite: true,
	        speed: 500,
	        fade: true,
	        cssEase: 'linear',
	        adaptiveHeight: true
		});
	});
</script>


	
	
</body>

</html>