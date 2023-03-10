<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL fmt 라이브러리</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
</head>
<body>
	<div class="container">
		<h1>1.후보자 득표율</h1>
		<table class="table">
			<thead>
				<tr class="text-center">
					<th>기호</th>
					<th>득표수</th>
					<th>득표율</th>
				</tr>				
			</thead>
			<tbody>
				<c:forEach var="candidate" items="${candidate }" varStatus="status">
				<tr class="text-center">
					<td>${status.count }</td>
					<td><fmt:formatNumber value="${candidate }"/></td>
					<td><fmt:formatNumber value="${candidate / 1000000 }" type="percent"/></td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
		
		<h1>2.카드 명세서</h1>
		<table class="table border border-success">
			<thead class="bg-success text-light">
				<tr>
					<th>사용처</th>
					<th>가격</th>
					<th>사용 날짜</th>
					<th>할부</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="cardBill" items="${cardBills }">
				<fmt:formatNumber value="${cardBill.pay }" type="currency" var="pay"/>
				<fmt:parseDate value="${cardBill.date }" pattern="yyyy-MM-dd" var="date"/>
				<fmt:formatDate value="${date }" pattern="yyyy년 M월 d일" var="dateString"/>
				<tr>
					<td>${cardBill.store }</td>
					<td>${pay }</td>
					<td>${dateString }</td>
					<td>${cardBill.installment }</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
	
	</div>
	

</body>
</html>