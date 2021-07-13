<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>통나무 펜션</title>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>        
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>

        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

        <link rel="stylesheet" href="/lesson06/test03/css/style.css" type="text/css">
    </head>

    <body>
        <div id="wrap" >
            <div class="text-center display-4">통나무 팬션</div>
            <header class="mt-4">
                
                <nav class="mt-4">
                    <ul class="nav nav-fill">
                        <li class="nav-item"><a class="nav-link" href="#">팬션소개</a></li>
                        <li class="nav-item"><a class="nav-link" href="#">객실보기</a></li>
                        <li class="nav-item"><a class="nav-link" href="/lesson06/test03/insert_view">예약하기</a></li>
                        <li class="nav-item"><a class="nav-link" href="/lesson06/test03/booking_list">예약목록</a></li>
                    </ul>
                </nav>
            </header>
            <section>
                <table class="table text-center">
                    <h2 class="my-4 text-center">예약 목록 보기</h2>
                    <thead>
                        <tr>
                            <th>이름</th>
                            <th>예약날짜</th>
                            <th>숙박일수</th>
                            <th>숙박인원</th>
                            <th>전화번호</th>
                            <th>예약상태</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                    	<c:forEach var="booking" items="${bookingList }">
                        <tr>
                            <td>${booking.name}</td>
                            <td><fmt:formatDate value="${booking.date }" pattern="yyyy년 M월 d일" /></td>
                            <td>${booking.day}</td>
                            <td>${booking.headcount}</td>
                            <td>${booking.phoneNumber}</td>
                            <td>
                            	<c:choose>
                            		<c:when test="${booking.state eq '확정' }">
                            			<span class="text-success">	
                            		</c:when>
                            		<c:when test="${booking.state eq '대기중' }">
                            			<span class="text-info">
                            		</c:when>
                            		<c:when test="${booking.state eq '취소' }">
                            			<span class="text-danger">
                            		</c:when>
                            	</c:choose>
                            	
                            		${booking.state}
                            	</span>
                            </td>
                            <td><button class="btn btn-danger deleteBtn" data-booking-id="${booking.id }">삭제</button></td>
                        </tr>
                      	</c:forEach>
                    </tbody>

                </table>

            </section>
            

            <footer class="mt-3 ml-4">
                <address>
                    제주특별자치도 제주시 애월읍  <br>
                    사업자등록번호: 111-22-255222 / 농어촌민박사업자지정 / 대표:김통목 <br>
                    Copyright 2025 tongnamu All right reserved
                </address>

            </footer>


        </div>

    <script>
        $(document).ready(function() {
        	
			$(".deleteBtn").on("click", function() {
				
				var deleteId = $(this).data("booking-id");
				$.ajax({
					type:"POST",
					url:"/lesson06/test03/delete_booking",
					data:{"id":deleteId},
					success:function(data) {
						if(data.result == "success") {

							alert("삭제 하였습니다.");
							location.reload();	
						}
						
					}, error:function(e) {
						alert("error " + e.message);
					}
				});
			});
          
        } );
    </script>
    </body>
</html>