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
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
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
	
	            <section class="contents d-flex justify-content-center">
	            <div class="col-6">
	            	<h2 class="text-center mt-5">예약하기</h2>
	            		<label class="mt-4">이름</label> <br>
	            		<input type="text" name="name" class="form-control" id="nameInput">
	            		<label class="mt-4">예약날짜</label> <br>
	            		<input type="text" name="date" class="form-control" id="dateInput"  autocomplete="off">
		            	<label class="mt-4">숙박일수</label> <br>
		            	<input type="text" name="day" class="form-control" id="dayInput">
		            	<label class="mt-4"l>숙박인원</label> <br>
		            	<input type="text" name="headcount" class="form-control" id="headcountInput">
		            	<label class="mt-4">전화번호</label> <br>
		            	<input type="text" name="phoneNumber" class="form-control" id="phoneNumberInput">
	            	<button type="submit" class="mt-4 btn btn-warning col-12" id="addBtn">예약하기</button>
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
			
			 $("#dateInput").datepicker({
				 dateFormat: 'yy-mm-dd',
                 monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
                 dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
                 yearSuffix: '년',
                 showbButtonPanel:true,
                 currentText: "Today",
                 minDate:0,
             });
                 
                 
			
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
				
				// day가 숫자만 입력된 경우
				// day에 숫자가 아닌 문자가 포함된 경우
				// Not a Number
				if(isNaN(day)) {
					alert("숙박일수는 숫자만 입력가능합니다.");
					return;
				}
				
				if(headcount == "") {
					alert("숙박인원을 입력하세요.");
					return;
				} 
				
				if(isNaN(headcount)) {
					alert("숙박인원은 숫자만 입력가능합니다.");
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
						if(data.result == "success") {
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
	            
	                