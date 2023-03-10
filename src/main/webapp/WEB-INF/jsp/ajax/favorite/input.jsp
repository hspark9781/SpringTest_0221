<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Favorite</title>
<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
</head>
<body>
	<div class="container">
		<h2>즐겨 찾기 추가하기</h2>
			<label>제목</label>
			<input type="text" class="form-control col-5" name="name" id="nameInput">
			<label class="mt-3">주소</label> 
			<div class="d-flex">
				<input type="text" class="form-control col-5" name="url" id="urlInput"> <button type="button" id="duplicateBtn" class="btn btn-info ml-2">중복확인</button>
			</div>
			<div id="duplicate_true" class="small text-danger d-none">중복된 url 입니다.</div>
			<div id="duplicate_false" class="small text-success d-none">사용 가능한 url 입니다.</div>
		<button type="submit" class="btn btn-success col-5 mt-3" id="addBtn">추가</button>
	</div>
	
	<script>
		$(document).ready(function() {
			
			var isChecked = false;
			var isDuplicate = true; 
			
			$("#urlInput").on("input", function() {
				isChecked = false;
				isDuplicate = true; 
				$("#duplicate_true").addClass("d-none");
				$("#duplicate_false").addClass("d-none");
			});
			
			$("#duplicateBtn").on("click", function() {
				let url = $("#urlInput").val();
				if(url == "") {
					alert("주소를 입력하세요.");
					return;
				} 
				
				$.ajax({
					type:"post"
					, url:"/ajax/favorite/is_duplicate"
					, data:{"url":url}
					, success:function(data) {
						isChecked = true;
						
						if(data.is_duplicate) {
							$("#duplicate_true").removeClass("d-none");
							$("#duplicate_false").addClass("d-none");
							
							isDuplicate = true;
						} else {
							$("#duplicate_false").removeClass("d-none");
							$("#duplicate_true").addClass("d-none");
							
							isDuplicate = false;
						}
					}
					, error:function() {
						alert("중복확인 에러");
					}
				});
				
			});
			
			
			$("#addBtn").on("click", function() {
				let name = $("#nameInput").val();
				let url = $("#urlInput").val();
				
				if(name == "") {
					alert("제목을 입력하세요.");
					return;
				}
				
				if(url == "") {
					alert("주소를 입력하세요.");
					return;
				} 
				
				if(!url.startsWith("http://") && !url.startsWith("https://")) {
					alert("주소 형식이 잘못되었습니다.");
					return;
				}
				
				if(!isChecked) {
					alert("중복체크를 진행해주세요.");
					return;
				}
				
				if(isDuplicate) {
					alert("중복된 url입니다.");
					return;
				}  
				
				$.ajax({
					type:"post"	
					, url:"/ajax/favorite/add"
					, data:{"name":name, "url":url}
					, success:function(data) {
						if(data.result = "success") {
							location.href = "/ajax/favorite/list";
						} else {
							alert("추가 실패");
						}
					}
					, error:function() {
						alert("추가 에러");
					}
				}); 
				
				/* $.ajax({
					type:"post"
					, url:"/ajax/favorite/is_duplicate"
					, data:{"url":url}
					, success:function(data) {
						if(data.is_duplicate) {
							alert("이메일이 중복되었습니다.");
						} else {
							$.ajax({
								type:"post"	
								, url:"/ajax/favorite/add"
								, data:{"name":name, "url":url}
								, success:function(data) {
									if(data.result == "success") {
										location.href = "/ajax/favorite/list";
									} else {
										alert("추가 실패");
									}
								}
								, error:function() {
									alert("추가 에러");
								}
							});		
						}
					}
					, error:function() {
						alert("중복확인 에러");
					}
				}); */ 
				
			});
			
		});
	</script>
									
				
				
				
				
				
	
	
	

</body>
</html>
				
				
				