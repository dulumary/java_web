<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <title>배탈의 민족</title>
        <meta charset="utf-8">
        <link rel="stylesheet" href="/lesson05/test06/css/style.css" type="text/css">

        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>        
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>

    </head>

    <body>

        <div id="wrap" >
            <header class="bg-info d-flex align-items-center">
                <a href="/lesson05/test06/stores"><h2 class="text-white ml-4">배탈의 민족</h2></a>
            </header>

            <section class="contents mb-2">
                <div class="display-4 mt-2">${storeName} - 리뷰 </div>
                <c:if test="${empty reviews}">
                	<div class="m-5">
                		<h1>작성된 리뷰가 없습니다.</h1>
                	</div>
                </c:if>
                <c:forEach var="review" items="${reviews}">
                <div class="border border-info rounded mt-3 p-3">
                    <div class="d-flex">
                        <div class="font-weight-bold">${review.userName }</div>
                        <div class="ml-2">
                        <c:forEach begin="1" end="${review.point}" step="1">
                            <img src="/lesson05/test06/images/star_fill.png" width="15">
                        </c:forEach>
                        <c:if test="${review.point % 1 != 0}">
                        	<img src="/lesson05/test06/images/star_half.png" width="15">
                        </c:if>
                        
                        <c:forEach begin="1" end="${5 - review.point}" step="1">
                            <img src="/lesson05/test06/images/star_empty.png" width="15">
                        </c:forEach>
                        </div>
                    </div>
                    <small class="text-secondary"><fmt:formatDate value="${review.createdAt }" pattern="yyyy년 M월 d일" /></small>
                    <div class="mt-2 mb-1">${review.review }</div>
                    <span class="menu p-1 rounded "> ${review.menu} </span>
                    
                </div>
                </c:forEach>
            </section>
            
            <footer> 
                <hr>
                <h5>(주)우와한형제</h5>
                <div class="text-secondary">고객센터 : 1500-1500</div>

            </footer>

        </div>

    </body>

</html>
