<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 추가</title>

  <!-- bootstrap CDN link -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

  <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  
</head>
<body>
	<div class="container">
	
		<h1>회원정보 추가</h1>
		
		<form method="post" action="/lesson04/ex01/add_user">
			<label for="name">이름 <input type="text" id="name" name="name" class="form-control" placeholder="이름을 입력하세요."></label><br>
			<label for="yyyymmdd">생년월일 <input type="text" id="yyyymmdd" name="yyyymmdd" class="form-control" placeholder="예)19990412"></label><br>
			자기소개 <br>
			<textarea name="introduce" rows="10" cols="5" class="form-control"></textarea>
			<label for="email">이메일 주소 <input type="text" class="form-control" id="email" name="email"></label><br>
			
			<input type="submit" class="btn btn-success" value="추가">
		</form>
	
	</div>

</body>
</html>