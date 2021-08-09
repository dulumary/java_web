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
				<c:if test="${not empty userId }">
				<!--  입력 상자  -->
				<div class="border rounded mt-3">
					<div>
						<textarea class="form-control w-100 border-0 non-resize" rows=3 id="contentInput"></textarea>
					</div>
					<div class="d-flex justify-content-between m-2">
						<input class="input-control d-none" type="file" id="fileInput">
						<a href="#" id="imageFileInput" class="image-icon"><i class="bi bi-card-image"></i></a>
						<button class="btn btn-sm btn-info" id="uploadBtn">업로드</button>
					</div>
				</div>
				</c:if>
				
				<!-- 피드 -->
				
				<c:forEach items="${postList }" var="postWithComments">
				
				<div class="card border rounded mt-3">
					<!-- 타이틀 -->
					<div class="d-flex justify-content-between p-2 border-bottom">
						<div class="font-weight-bold"> ${postWithComments.post.userName }</div>
						<div>
							
							<a href="#" class="more-icon text-dark deleteModalBtn">
								<i class="bi bi-three-dots-vertical"></i>
							</a>		
						</div>
					</div>
					<!--이미지 -->
					<div>
						<img src="${postWithComments.post.imagePath }" class="w-100">
					</div>
					<!-- 좋아요 -->
					
					<div class="m-2">
						<c:if test="${not empty userId }">
						<a href="#" class="likeBtn" data-post-id="${postWithComments.post.id }">
							
							<c:choose>
							<c:when test="${postWithComments.like eq true}">
								<i class="bi bi-heart-fill heart-icon text-danger" id="heartIcon${postWithComments.post.id }"></i>	
							</c:when>
							<c:otherwise>
								<i class="bi bi-heart heart-icon text-dark" id="heartIcon${postWithComments.post.id }"></i>
							</c:otherwise>
							</c:choose>
							
						</a>
						</c:if>
						<span class="middle-size ml-1"> 좋아요 <span id="likeCount${postWithComments.post.id }">${postWithComments.likeCount }</span>개 </span>
					</div>
					
					<!--  content -->
					<div class="middle-size m-2">
						<b>${postWithComments.post.userName }</b> ${postWithComments.post.content }
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
							<c:forEach items="${postWithComments.commentList}" var="comment">
							<div class="mt-1">
								<b>${comment.userName }</b> ${comment.content } 
							</div>
							</c:forEach>
						</div>
						
						<c:if test="${not empty userId }">
						<!-- 댓글 입력 -->
						<div class="d-flex mt-2 border-top">
							<input type="text" class="form-control border-0" id="commentInput${postWithComments.post.id }">
							<button class="btn btn-info btn-sm commentBtn" data-post-id="${postWithComments.post.id }">게시</button>
						</div>
						</c:if>
					
					</div>
			
				</div>
				
				</c:forEach>
			</div>
			
		</section>
		
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />

	</div>
	<script>
	$(document).ready(function() {
			$("#uploadBtn").on("click", function() {
				let content = $("#contentInput").val().trim();
					
				if(content == null || content == "") {
					alert("내용을 입력하세요");
					return ;
				}
				
				if($("#fileInput")[0].files.length == 0) {
					alert("파일을 추가하세요");
					return ;
				}
				
				var formData = new FormData();
				formData.append("file", $("#fileInput")[0].files[0]);
				formData.append("content", content);
				
				$.ajax({
					enctype: 'multipart/form-data', // 필수
					type:"POST",
					url:"/post/create",
					processData: false, // 필수 
		        	contentType: false, // 필수 
					data:formData,
					success:function(data) {
						if(data.result == "success") {
							location.href="/post/timeline";	
						} else {
							alert("글쓰기에 실패했습니다.");
						}
						
					}, error:function(e) {
						alert("error ");
					}
				});
				
			});		
			
			$(".commentBtn").on("click", function() {
				let postId = $(this).data("post-id");
				let comment = $("#commentInput" + postId).val().trim();

				
				if(comment == null || comment == "") {
					alert("내용을 입력하세요");
					return ;
				}
				
				let commentData = {"postId": postId, "content":comment}
				
				$.ajax({
					type:"POST",
					url:"/post/comment/create",
					data:commentData,
					success:function(data) {
						if(data.result == "success") {
							location.reload(); // 새로고침
						} else {
							alert("글쓰기에 실패했습니다.");
						}
						
					}, error:function(e) {
						alert("error ");
					}
				});	
			});
			
			$(".likeBtn").on("click", function(e) {
				
				e.preventDefault();
				
				let postId = $(this).data("post-id");
				
				$.ajax({
					type:"GET",
					url:"/post/like",
					data:{"postId": postId},
					success:function(data) {
						if(data.result == "like") {
							$("#heartIcon" + postId).removeClass("bi-heart");
							$("#heartIcon" + postId).removeClass("text-dark");
							
							$("#heartIcon" + postId).addClass("bi-heart-fill");
							$("#heartIcon" + postId).addClass("text-danger");
						} else {
							$("#heartIcon" + postId).removeClass("bi-heart-fill");
							$("#heartIcon" + postId).removeClass("text-danger");
							
							$("#heartIcon" + postId).addClass("bi-heart");
							$("#heartIcon" + postId).addClass("text-dark");
						}
						
						$("#likeCount" + postId).text(data.likeCount);
						
					}, error:function(e) {
						alert("error ");
					}
				});	
			});
			
		
			$("#imageFileInput").on("click", function(e) {
				e.preventDefault();
				
				$("#fileInput").click();
			});
					
			
		});			
	</script>
</body>
</html>