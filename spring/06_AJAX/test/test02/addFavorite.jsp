	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>즐겨찾기 추가 </title>

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</head>
<body>
	
	
	    <div class="container">
		<h1>즐겨 찾기 추가하기</h1>
		<label>제목</label>
		<input type="text" id="title" class="form-control">
		
		<label class="mt-3">주소</label>
		<div class="d-flex">
			<input type="text" id="url" class="form-control mr-3">
			<button type="button" id="checkDuplicate" class="btn btn-info">중복확인 </button>
		</div>
		<div id="duplicateText" class="d-none"><small class="text-danger">중복된 url 입니다</small></div>
		<div id="availableText" class="d-none"><small class="text-info">저장 가능한 url 입니다.</small></div>
		
		<button type="button" id="addFavorite" class="btn btn-success btn-block mt-3">추가</button>
	</div>
	
	<script>
	$(document).ready(function() {
		
		var urlDuplicate = false;
		var checkUrl = false;
		
		$("#addFavorite").on("click", function() {
			var title = $('#title').val();
			var url = $("#url").val();
			
			if(title == null || title == "") {
				alert("제목을 입력하세요.");
				return;
			}
			
			if(url == null || url == "") {
				alert("주소를 입력하세요. ");
				return;
			}
			
			if(!(url.startsWith("http://") || url.startsWith("https://"))) {
				alert("주소형식이 잘못되었습니다.");
				return;
			}
			
			if(!checkUrl) {
				alert("url 중복검사를 해주세요.");
				return;
			}
			
			if(urlDuplicate) {
				alert("중복된 url은 추가 할 수 없습니다. ");
				return ;
			}
			
			$.ajax({
				type:"POST",
				url:"/lesson06/test01/add_favorite",
				data:{"name":title, "url":url},
				success:function(data) {
					alert(data.result);
					location.href="/lesson06/test01/favorite_list";
				}, error:function(e) {
					alert("error " + e);
				}
			});
		});
		
		$("#checkDuplicate").on("click", function() {
			var url = $("#url").val();
			
			if(url == null || url == "") {
				alert("주소를 입력하세요. ");
				return;
			}
			
			if(!(url.startsWith("http://") || url.startsWith("https://"))) {
				alert("주소형식이 잘못되었습니다.");
				return;
			}
			
			$.ajax({
				type:"POST",
				url:"/lesson06/test02/is_duplication",
				data:{"url":url},
				success:function(data) {
					
					if(data.result) {
						$("#duplicateText").removeClass("d-none");
						$("#availableText").addClass("d-none");
						urlDuplicate = true;
					} else {
						$("#duplicateText").addClass("d-none");
						$("#availableText").removeClass("d-none");
						urlDuplicate = false;
					}
					
					checkUrl = true;
					
				}, error:function(e) {
					alert("error " + e);
				}
			});
		})
		
	});	
	</script>
	          
</body>
</html>