<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>날씨입력</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<link rel="stylesheet" href="/weatherhistory/style.css" type="text/css">
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
						<a class="nav-link font-weight-bold text-light" href="/weatherhistory/info">날씨</a>
					</li>
					<li class="nav-item">
						<a class="nav-link font-weight-bold text-light" href="#">날씨입력</a>
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
				<div><h2>날씨 입력</h2></div>
				<form method="get" action="/jstl/weatherhistory/add">
						<div class="d-flex">
							<div class="d-flex col-4">
								<label class="d-flex align-items-end">날짜</label><input type="text" class=" col-7 form-control" name="date">
							</div>
							<div class="d-flex col-4">
								<label class="d-flex align-items-end">날씨</label>
								<select class="form-control col-7" name="weather">
									<option>맑음</option>
									<option>흐림</option>
									<option>구름조금</option>
									<option>비</option>
								</select>
							</div>
							<div class="d-flex col-4">
								<label class="ml-5 d-flex align-items-end">미세먼지</label>
								<select class="form-control col-7" name="microDust">
									<option>좋음</option>
									<option>보통</option>
									<option>나쁨</option>
									<option>최악</option>
								</select>
							</div>
						</div>
						<div>
						
						</div>
						<div class="mt-4 d-flex justify-content-between">
							<div class="input-group col-3">
		                        <input type="text" class="form-control" name="temperatures">
		                        <div class="input-group-append">
		                          <button class="btn">°C</button>
		                        </div>
		                    </div>
							<div class="input-group col-3">
		                        <input type="text" class="form-control" name="precipitation">
		                        <div class="input-group-append">
		                          <button class="btn">mm</button>
		                        </div>
		                    </div>
							<div class="input-group col-3">
		                        <input type="text" class="form-control" name="windSpeed">
		                        <div class="input-group-append">
		                          <button class="btn">km/h</button>
		                        </div>
		                    </div>
						</div>
						<div class=" mt-4 d-flex justify-content-end">	
							<button type="submit" class="btn btn-success">저장</button>
						</div>
				</form>
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
									
						
					
					