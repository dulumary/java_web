<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>

	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

  	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  	
  	 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
  	 
  	 <link rel="stylesheet" href="/css/style.css">
  
</head>
<body>

	<div class="container">
		<c:import url="/WEB-INF/jsp/include/header.jsp" />
		<section class="d-flex justify-content-center">
			<div class="col-lg-7">
				<!--  입력 상자  -->
				<div class="border rounded mt-3">
					<div>
						<textarea class="form-control w-100 border-0 non-resize" rows=3 id="contentInput"></textarea>
					</div>
					<div class="d-flex justify-content-between m-2">
						<input class="input-control d-none" type="file" id="fileInput">
						<a href="#" id="imageFileInput" class="image-icon"><i class="bi bi-card-image"></i></a>
						<button class="btn btn-sm btn-info">업로드</button>
					</div>
				</div>
				
				<!-- 피드 -->
				
				<c:forEach  var="post" items="${postList }">
				
				<div class="card border rounded mt-3">
					<!-- 타이틀 -->
					<div class="d-flex justify-content-between p-2 border-bottom">
						<div class="font-weight-bold"> ${post.userName }</div>
						<div>
							<a href="#" class="more-icon text-dark deleteModalBtn" >
								<i class="bi bi-three-dots-vertical"></i>
							</a>						
						</div>
					</div>
					<!--이미지 -->
					<div>
						<img src="${post.imagePath }" class="w-100">
					</div>
					<!-- 좋아요 -->
					
					<div class="m-2">
						
						<a href="#" class="likeBtn">
							<i class="bi bi-heart-fill heart-icon text-danger" ></i>	
						</a>
						<span class="middle-size ml-1"> 좋아요 2개 </span>
					</div>
					
					<!--  content -->
					<div class="middle-size m-2">
						<b>${post.userName }</b> ${post.content }
					</div>
					
					<!--  댓글 -->
					
					<div class="mt-2">
					
						<div class=" border-bottom ">
						<!-- 댓글 타이틀 -->
							<div  class="middle-size ml-3 mb-1 ">
								댓글
							</div>
						</div>
						
						<!--  댓글  -->
						<div  class="middle-size m-2">
							
							<div class="mt-1">
								<b>유재석</b> 오오 좀 되는듯 
							</div>
							
						</div>
						
						
						<!-- 댓글 입력 -->
						<div class="d-flex mt-2 border-top">
							<input type="text" class="form-control border-0">
							<button class="btn btn-info btn-sm commentBtn">게시</button>
						</div>
						
					
					</div>
			
				</div>
				
				</c:forEach>
			</div>
			
		</section>
		
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />

	
	</div>

</body>
</html>