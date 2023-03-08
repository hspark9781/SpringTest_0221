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
		<div>
			<label>제목</label> <br>
			<input type="text" class="form-control col-5" name="name" id="nameInput">
		</div>
		<div>
			<label>주소</label> <br>
			<input type="text" class="form-control col-5" name="url" id="urlInput">
		</div>
		
		<button type="submit" class="btn btn-success col-5 mt-3" id="addBtn">추가</button>
	</div>
	
	<script>
		$(document).ready(function() {
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
				
				if(url.startsWith("http://")) {
					alert("https:// 로 입력해주세요.");
					return;
				}
				
				
				$.ajax({
					type:"get"	
					, url:"/ajax/favorite/add"
					, data:{"name":name, "url":url}
					, success:function(data) {
						// 성공 : {"result":"success" }
						// 실패 : {"result":"fail"}
						if(data.result == "success") {
							// 리스트 페이지로 이동
							location.href = "/ajax/favorite/list";
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