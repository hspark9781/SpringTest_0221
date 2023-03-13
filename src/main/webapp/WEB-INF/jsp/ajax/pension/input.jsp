<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	                    <li class="nav-item"><a href="/ajajx/pensoin/list" class="nav-link text-light">예약목록</a></li>
	                </ul>
	            </nav>
	
	            <section class="contents d-flex justify-content-center">
	            <div>
	            	<h2 class="text-center mt-5">예약하기</h2>
	            		<label>이름</label> <br>
	            		<input type="text" name="name" class="form-control" id="nameInput">
	            		<label>예약날짜</label> <br>
	            		<input type="text" name="date" class="form-control" id="dateInput">
		            	<label>숙박일수</label> <br>
		            	<input type="text" name="day" class="form-control" id="dayInput">
		            	<label>숙박인원</label> <br>
		            	<input type="text" name="headcount" class="form-control" id="headcountInput">
		            	<label>전화번호</label> <br>
		            	<input type="text" name="phoneNumber" class="form-control" id="phoneNumberInput">
	            	<button type="submit" class="mt-3 btn btn-warning col-6" id="addBtn">예약하기</button>
	            </div>
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
			$("#addBtn").on("click", function() {
				let name = $("#nameInput").val();
				let date = $("#dateInput").val();
				let day = $("#dayInput").val();
				let headcount = $("#headcountInput").val();
				let phoneNumber = $("#phoneNumberInput").val();
				if(name == "") {
					alert("이름을 입력하세요.");
					return;
				}
				
				if(date == "") {
					alert("날짜를  입력하세요.");
					return;
				} 
				
				if(day == "") {
					alert("숙박일수를 입력하세요.");
					return;
				} 
				
				if(headcount == "") {
					alert("숙박인원을 입력하세요.");
					return;
				} 
				
				if(phoneNumber == "") {
					alert("전화번호를 입력하세요.");
					return;
				} 
				
				$.ajax({
					type:"get"	
					, url:"/ajax/pension/add"
					, data:{"name":name, "date":date, "day":day, "headcount":headcount, "phoneNumber":phoneNumber}
					, success:function(data) {
						if(data.result = "success") {
							location.href = "/ajax/pension/list";
						} else {
							alert("추가 실패");
						}
					}
					, error:function() {
						alert("추가 에러");
					}
				}); 
			});
		});
	</script>

</body>
</html>
	            
	                