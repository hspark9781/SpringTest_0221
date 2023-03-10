<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>통나무팬션</title>
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
                    <li class="nav-item"><a href="#" class="nav-link text-light">예약안내</a></li>
                    <li class="nav-item"><a href="#" class="nav-link text-light">커뮤니티</a></li>
                </ul>
            </nav>

            <section class="contents">
                <article class="banner">
                    <div>
                        <img class="imageBox" id="images" src="/pension_images/banner1.jpg" alt="통나무팬션 이미지">
                    </div>
                </article>
                <aside class="d-flex">
                    <div class="reservation d-flex justify-content-center align-items-center">
                        <a class="display-4 text-light" href="#">실시간 <br> 예약하기</a>
                    </div>
                    <div class="input">
                        <div class="d-flex align-items-end ml-4 mt-4">
                            <h4 class="text-light mt-2">예약확인</h4>
                            <div class="col-5" id="checkReservation">
                                <label class="text-light">회원</label> <input type="radio" name="check" value="members">
                                <label class="text-light ml-2">비 회원</label> <input type="radio" name="check" value="non-members">
                            </div>
                        </div>
                        <div class="inputBox ml-4 mt-3">
                            <div id="membersInput">
                                <div class="d-flex">
                                    <label class="text-light">아이디 : </label> <input type="text" class="form-control col-8 ml-4" id="idInput" autocomplete="off">
                                </div>
                                <div class="d-flex mt-3">
                                    <label class="text-light">비밀번호 : </label> <input type="password" class="form-control col-8 ml-2" id="passwordInput" autocomplete="off">
                                </div>
                            </div>
                            
                            <div class="d-none" id="non-membersInput">
                                <div class="d-flex mt-3">
                                    <label class="text-light ml-3">이름 :</label><input type="text" class="form-control col-8 ml-4" id="nameInput" autocomplete="off">
                                </div>
                                <div class="d-flex mt-3">
                                    <label class="text-light">전화번호 : </label><input type="text" class="form-control col-8 ml-2" id="phoneNumber" autocomplete="off">
                                </div>
                                <div class="d-flex mt-3">
                                    <label class="text-light ml-3">날짜 :</label><input type="text" class="form-control col-8 ml-4" id="date" autocomplete="off">
                                </div>
                                
                            </div>
                            <div class="d-flex justify-content-end mt-3 mr-5">
                                <button type="button" id="button" class="mr-4 bg-success form-control col-3 text-light ">조회하기</button>
                            </div>
                        </div>
                    </div>

                    <div class="callCenter">
                        <h4 class="text-light ml-5 mt-5">예약문의 : </h4>
                        <div class="display-4 text-light ml-5">010- <br>000-1111</div>
                    </div>
                </aside>
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
                var index = 0;
                var imageList = ["/pension_images/banner1.jpg", "/pension_images/banner2.jpg", "/pension_images/banner3.jpg" , "/pension_images/banner4.jpg"];
                //setInterval
               setInterval(function () {
                index++;
                if(index == imageList.length) {
                    index = 0;
                }
                $("#images").attr("src",imageList[index]);
               }, 3000);

                // 유효성 검사
                $("#button").on("click", function() {
                    let value = $("input[name='check']:checked").val();
                    let text = $("#phoneNumber").val();
                    if(value == "non-members") {
                        if($("#nameInput").val() == "") {
                            alert("이름을 입력하세요");
                            return;
                        }

                        if($("#phoneNumber").val() == "") {
                            alert("전화번호를 입력하세요");
                            return;
                        }

                        if(text.startsWith("010") == false) {
                            alert("010을 포함해서 입력해주세요.");
                            return;
                        }
                        
                        if($("#date").val() == "") {
                            alert("날짜를 입력하세요");
                            return;
                        }
                        alert("이름 : " + $("#nameInput").val() + 
                                "\n" + "전화번호" + $("#phoneNumber").val() + 
                                "\n" + "날짜" + $("#date").val() 
                            )
                    } else {
                        if($("#idInput").val() == "") {
                            alert("아이디를 입력하세요");
                            return;
                        }

                        if($("#passwordInput").val() == "") {
                            alert("비밀번호를 입력하세요");
                            return;
                        }
                    }
                });
                            
                // 날짜 오늘 이후 선택
                $("#date").datepicker({
                    dateFormat: "yy"+"년 " + "mm" + "월 " + "dd" + "일",
                    monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
                    dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
                    yearSuffix: '년',
                    showbButtonPanel:true,
                    currentText: "Today",
                    minDate:0
                });

                // 비회원 선택시
                $("input[name='check']").on("click", function() {
                    let value = $(this).val(); //"input[name='check']:checked"
                    if(value == "non-members") {
                        $("#non-membersInput").removeClass("d-none");
                        $("#membersInput").addClass("d-none");
                    } else {
                        $("#membersInput").removeClass("d-none");
                        $("#non-membersInput").addClass("d-none");
                    }
                });
            });
        </script>



</body>
</html>

                
                

                
                        


                
