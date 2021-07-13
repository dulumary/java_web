<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 추가</title>
  <!-- bootstrap CDN link -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

  <%-- AJAX를 사용하려면 더 많은 함수가 있는 js를 포함해야 한다. --%>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
  <!-- <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script> -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</head>
<body>
	<div class="container">
		<h1>회원 정보 추가</h1>
		
		
			<label for="name"><b>이름:</b><input type="text" id="name" name="name" class="form-control" placeholder="이름을 입력하세요"></label> <button id="nameCheck" class="btn btn-info"> 중복확인</button> <br>
			<div id="nameCheckInfo" class="text-info d-none"></div>
			<label for="yyyymmdd"><b>생년월일:</b><input type="text" id="yyyymmdd" name="yyyymmdd" class="form-control" placeholder="예) 19990101"></label><br>
			<b>자기 소개:</b><br>
			<textarea name="introduce" rows="10" cols="5" class="form-control"></textarea><br>
			<label for="email" class="w-25"><b>이메일 주소:</b><input type="text" id="email" name="email" class="form-control" placeholder="이메일 주소를 입력하세요"></label><br>
			
			<%-- submit 버튼: 클릭시 폼태그 액션이 수행됨 --%>
			<!-- <div><input type="submit" class="btn btn-success" value="추가"></div> -->
			<div><button type="button" class="btn btn-success" id="addBtn" >추가</button> </div>
	</div>
	
<script>
$(document).ready(function() {

/* 	$("form").on("submit", function(e) {
		
		var name = $("#name").val().trim(); // 공백제거 
		if(name == null || name == "") {
			alert("이름을 입력해주세요.");
			return false;
		}
		
		var yyyymmdd = $('#yyyymmdd').val().trim();
		if (yyyymmdd == null || yyyymmdd == '') {
			alert("생년월일을 입력해주세요.");
			return false;
		}
		
		
		return true;
	
	}); */
	
	var isDuplication = false;
	var isCheckDuplication = false;
	
	$("#addBtn").on("click", function() {
		// validation 
		var name = $("#name").val().trim();
		if(name == null || name == "") {
			alert("이름을 입력해주세요.");
			return ;
		}
		
		if(!isCheckDuplication) {
			alert("이름 중복 검사를 해주세요.");
			return ;
		}
		
		
		if(isDuplication) {
			alert("이름이 중복되었습니다.");
			return;
		}
		
		var yyyymmdd = $('#yyyymmdd').val().trim();
		if (yyyymmdd == null || yyyymmdd == '') {
			alert("생년월일을 입력해주세요.");
			return ;
		}
		
		// 모두 숫자인지 확인
		if(isNaN(yyyymmdd)) {
			alert("생년월일은 숫자만 입력해 주세요.");
			return ;
		}
		
		var introduce = $("textarea[name=introduce]").val(); // 이름 속성으로 가져오기 
		var email = $("#email").val().trim();
		
		
		
		// AJAX 
		$.ajax({
			type:"POST",
			url:"/lesson06/add_user",
			data:{"name":name, "yyyymmdd":yyyymmdd, "introduce":introduce, "email":email},
			success:function(data) {
				alert(data);
				location.href="/lesson06/get_user";
			}, 
			complete:function(data) {
				alert("완료");
				
			}, error:function(e) {
				alert("error " + e);
			}
		});
		
	});
	
	$("#nameCheck").on("click", function() {
		// validation 
		var name = $("#name").val().trim();
		if(name == null || name == "") {
			alert("이름을 입력해주세요.");
			return ;
		}
		
		$.ajax({
			type:"GET",
			url:"/lesson06/is_duplication",
			data:{"name":name},
			success:function(data){
				$("#nameCheckInfo").removeClass("d-none");
				if(data.is_duplication) {
					$("#nameCheckInfo").text("중복되었습니다.");
					isDuplication = true;
				} else {
					$("#nameCheckInfo").text("사용가능합니다.");
					isDuplication = false;
				}
				isCheckDuplication = true;
				
			},
			error:function(e) {
				alert("error " + e);	
				
			}
		});
	});
	
	
});
</script>	
</body>
</html>