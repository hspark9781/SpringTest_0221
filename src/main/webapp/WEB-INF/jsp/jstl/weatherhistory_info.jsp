<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<link rel="stylesheet" href="/weatherhistory/style.css" type="text/css">
</head>
<meta charset="UTF-8">
<title>날씨</title>
</head>
<body>
	<div id="wrap">
		<section class="contents d-flex">
		<div class="side col-2 bg-primary">
			<div class="logo">
				<img alt="기상청 로고" width="170px" src="https://img1.daumcdn.net/thumb/R800x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FTxmeD%2FbtqCKArBvPm%2F2tzfJfINwg0WWmCzC4jKW0%2Fimg.jpg">
			</div>
			<nav class="main-menu">
				<ul class="nav flex-column mt-2">
					<li class="nav-item">
						<a class="nav-link font-weight-bold text-light" href="#">날씨</a>
					</li>
					<li class="nav-item">
						<a class="nav-link font-weight-bold text-light" href="/weatherhistory/input">날씨입력</a>
					</li>
					<li class="nav-item">
						<a class="nav-link font-weight-bold text-light" href="#">테마날씨</a>
					</li>
					<li class="nav-item">
						<a class="nav-link font-weight-bold text-light" href="#">관측 기후</a>
					</li>
				</ul>
			</nav>
		</div>
			
			<div class="contents1 col-10">
				<div class="mt-4">
					<h2>과거날씨</h2>
				</div>
				<table class="table text-center">
					<thead>
						<tr>
							<th>날짜</th>
							<th>날씨</th>
							<th>기온</th>
							<th>강수량</th>
							<th>미세먼지</th>
							<th>풍속</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach var="weatherhistory" items="${weatherhistoryList }">
						<tr>
							<fmt:formatDate value="${weatherhistory.date }" pattern="yyyy년 M월 d일" var="dateString"/>
							<td>${dateString }</td> 
							<c:choose>
								<c:when test="${weatherhistory.weather eq '비' }">
									<td> <img alt="비 이미지" src="http://marondal.com/material/images/dulumary/web/jstl/rainy.jpg"> </td>
								</c:when>
								<c:when test="${weatherhistory.weather eq '흐림' }">
									<td> <img alt="흐림 이미지" src="http://marondal.com/material/images/dulumary/web/jstl/cloudy.jpg"> </td>
								</c:when>
								<c:when test="${weatherhistory.weather eq '맑음' }">
									<td> <img alt="맑음 이미지" src="http://marondal.com/material/images/dulumary/web/jstl/sunny.jpg"> </td>
								</c:when>
								<c:otherwise>
									<td> <img alt="구름 조금 이미지" src="http://marondal.com/material/images/dulumary/web/jstl/sunny.jpg"> </td>
								</c:otherwise>
							</c:choose>
							<td>${weatherhistory.temperatures }</td>
							<td>${weatherhistory.precipitation }</td>
							<td>${weatherhistory.microDust }</td>
							<td>${weatherhistory.windSpeed }</td>
						</tr>
					</c:forEach>
					</tbody>				
				</table>
			</div>
		</section>
		<footer class="d-flex mt-3">
			<div class="d-flex align-items-center">
				<img alt="기상청 로고" width="150px" src="https://www.weather.go.kr/plus/resources/image/foot_logo.png">
			</div>
			<div class="d-flex align-items-center text-secondary ml-5 small">(07062) 서울시 동작구 여의대방로16길 61 <br> Copyright@2020 KMA. ALL RIghts RESERVED</div>
		</footer>
	</div>

</body>
</html>
		