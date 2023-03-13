<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>bookingList</title>
<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<link rel="stylesheet" href="/pension/style.css" type="text/css">
</head>
<body>

<div id="wrap">
	            <header class="d-flex align-items-center justify-content-center">
	                <div class="display-4">통나무팬션</div>
	            </header>
	            <nav class="main-menu d-flex align-items-center justify-content-between">
	                <ul class="nav nav-fill w-100">
	                    <li class="nav-item"><a href="#" class="nav-link text-light">팬션소개</a></li>
	                    <li class="nav-item"><a href="#" class="nav-link text-light">객실보기</a></li>
	                    <li class="nav-item"><a href="/ajax/pension/input" class="nav-link text-light">예약하기</a></li>
	                    <li class="nav-item"><a href="/ajax/pension/list" class="nav-link text-light">예약목록</a></li>
	                </ul>
	            </nav>
	
	            <section class="contents">
	            <h2 class="text-center mt-5"> 예약 목록 보기</h2>
	                <table class="table mt-4 text-center">
	                	<thead>
	                		<tr>
	                			<th>이름</th>
	                			<th>예약날짜</th>
	                			<th>숙박일수</th>
	                			<th>숙박인원</th>
	                			<th>전화번호</th>
	                			<th>예약상태</th>
	                			<th></th>
	                		</tr>
	                	</thead>
	                	<tbody>
	                	<c:forEach var="booking" items="${bookingList }">
						<fmt:formatDate value="${booking.date }" pattern="yyyy년 M월 d일" var="dateString"/>
	                		<tr>
	                			<td>${booking.name }</td>
	                			<td>${dateString }</td>
	                			<td>${booking.day }</td>
	                			<td>${booking.headcount }</td>
	                			<td>${booking.phoneNumber }</td>
	                			<c:choose>
		                			<c:when test="${booking.state eq '대기중'}">
		                			<td class="text-info">${booking.state }</td>
		                			</c:when>
		                			<c:when test="${booking.state eq '확정' }">
		                			<td class="text-success">${booking.state }</td>
		                			</c:when>
		                			<c:when test="${booking.state eq '취소' }">
		                			<td class="text-danger">${booking.state }</td>
		                			</c:when>
		                			<c:otherwise>
		                			<td>${booking.state }</td>
		                			</c:otherwise>
	                			</c:choose>
	                			<td> <button type="button" class="btn btn-danger delete-btn" data-booking-id="${booking.id }">삭제</button> </td>
	                		</tr>
	                	</c:forEach>
	                	</tbody>
	                </table>
	            </section>
	            
	            <footer class="d-flex">
	                <div class="small text-secondary mt-3">제주특별자치도 제주시 애월읍  <br>
	                    사업자 등록번호 : 111-22-255222 / 농어촌민박사업자지정 / 대표 : 김동욱 <br>
	                    Copyright 20205 tongnamu All right reserved
	                </div>
	            </footer>
	</div>
	
	<script>
	$(document).ready(function() {
		$(".delete-btn").on("click", function() {
			// 삭제 버튼에 해당하는 행의 id를 얻어온다.
			let bookingId = $(this).data("booking-id");
			
			$.ajax({
				type:"get"
				, url:"/ajax/pension/delete"
				, data:{"id":bookingId}
				, success:function(data) {
					if(data.result == "success") {
						location.reload();
					} else {
						alert("삭제 실패");
					}
				}
				, error:function() {
					alert("삭제 에러");
				}
			});
			
		});
	});
	
	</script>

</body>
</html>
				
				
				
			
		
		
		
		
	                			