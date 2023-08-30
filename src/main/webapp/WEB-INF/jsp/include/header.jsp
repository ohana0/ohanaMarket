<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>     
<!DOCTYPE html>
		<header>
			<div class="d-flex align-items-center">
				<img src="/static/image/logoImage.png" height="75px" class="pl-2">
				<div id="logoStyle" class="pl-1">OhanaMarket</div>
<c:if test=${not empty id }>
	<div>나는살아있다</div>
</c:if>				
			</div>
			<hr>
		</header>