<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>favorite list</title>
<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</head>
<body>
	<div class="container">
	
		<h2>즐겨찾기 목록</h2>
		
		<table class="table text-center">
		
			<thead>
				<tr>
					<th>No.</th>
					<th>이름</th>
					<th>주소</th>
					<th></th>
				</tr>
			</thead>
			
			<tbody>
				<c:forEach var="favorite" items="${favoriteList }" varStatus="status">
				<tr>
					<td>${status.count }</td>
					<td>${favorite.name }</td>
					<td>${favorite.url }</td>
					<td><button type="button" class="btn btn-danger btn-sm delete-btn" data-favorite-id="${favorite.id }">삭제</button></td>
				</tr>
				</c:forEach>
				
				
			</tbody>
		
		</table>
	
	</div>
	
	<script>
		$(document).ready(function() {
			$(".delete-btn").on("click", function() {
				
				// 삭제 대상의 id 
				let id = $(this).data("favorite-id");
				
				// ajax를 통해서 delete api 호출
				$.ajax({
					type:"get"
					, url:"/ajax/favorite/delete"
					, data:{"id":id}
					, success:function(data) {
						// 성공 : {"result":"success"}
						// 	실패 : {"result":"fail"}
						if(data.result = "success") {
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