<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


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
                <h2 class="text-white ml-4">배탈의 민족</h2>
            </header>

            <section class="contents mb-3">
                <div class="display-4 mt-2">우리동네 가게</div>
                <c:forEach var="store" items="${storesInfo}" >
                <a href="/lesson05/test06/reviews?storeId=${store.id }&storeName=${store.name}" class="store-link">
                    <div class="border border-info rounded mt-3 p-3">
                        <h4>${store.name}</h4>
                        <div>전화 번호 : ${store.phoneNumber }</div>
                        <div>주소 : ${store.address} </div>
                    </div>
                </a>
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