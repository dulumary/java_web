<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>한 페이지 레이아웃</title>

  <!-- bootstrap CDN link -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

  <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  
  <style>
  	#wrap {width:100%; height:900px;}
  	header {height:50px;}
  	menu {width:15%; height:900px; margin:0;}
  	.right {width:85%;}
  	.content {height:90%;}
  	footer {height:10%;}
  </style>
</head>
<body>
	<div id="wrap">
		<header class="bg-success">
			<h2>Marondal</h2>
		</header>
		<div class="d-flex">
			<menu class="bg-info">
				<ul>
					<li>메뉴1</li>
					<li>메뉴2</li>
					<li>메뉴3</li>
					<li>메뉴4</li>
				</ul>
			</menu>
			<div class="right">
				<section class="content bg-warning">
					<img src="https://static.priviatravel.com/event/prm-gen-img/6ace76cf-6c3d-47ad-9e36-2f2537471329.jpg?1600914920403" alt="이미지 설명" width="600px">
					수채화 같은 가을 풍경
					추천 지역 & 호텔 
				</section>
				<footer class="bg-danger">
					<address>
					주소:서울특별시 강남구 강남대로94길 13 삼경빌딩 1층~5층<br>
					사업자번호: 852-85-01066 통신판매업신고번호: 제2019-서울강남-02814호 학원운영등록번호: 제12954호
					</address>
				</footer>
			</div>
		</div>
	</div>
</body>
</html>