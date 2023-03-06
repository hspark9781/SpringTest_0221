<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<link rel="stylesheet" href="/weatherhistory/style.css" type="text/css">
</head>
<meta charset="UTF-8">
<title>weatherhistory_info</title>
</head>
<body>
	<div id="wrap" class="d-flex">
		<nav class="main-menu bg-primary">
			<div class="logo bg-danger">
				<img alt="기상청 로고" width="200px" src="https://blog.kakaocdn.net/dn/TxmeD/btqCKArBvPm/2tzfJfINwg0WWmCzC4jKW0/img.jpg">
			</div>
			<ul class="nav flex-colum">
				<li class="nav-item">
					<a class="nav-link" href="#">날씨</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="#">날씨입력</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="#">테마날씨</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="#">관측 기후</a>
				</li>
			</ul>
		</nav>
		<section class="contents bg-warning"></section>
		<footer class="bg-success"></footer>
	</div>

</body>
</html>