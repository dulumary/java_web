<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>POST method 폼태그</title>
</head>
<body>
	<form method="post" action="/jsp/ex03_2.jsp">
		1. 별명은 무엇입니까? <input type="text" name="nickname"><br><br>
		2. 취미는 무엇입니까? <input type="text" name="hobby"><br><br>
		3. 강아지 or 고양이? 
		<label for="dog">강아지<input type="radio" name="animal" id="dog" value="dog"></label> 
		<label for="cat">고양이<input type="radio" name="animal" id="cat" value="cat"></label><br><br>
		4. 다음 중 선호하는 것을 모두 고르세요.<br>
		<label for="mintcho">민트초코<input type="checkbox" name="food" id="mintcho" value="민트초코"></label> 
		<label for="pizza">하와이안 피자(파인애플)<input type="checkbox" name="food" id="pizza" value="하와이안 피자(파인애플)"></label> 
		<label for="pupa">번데기<input type="checkbox" name="food" id="pupa" value="번데기"></label><br><br>
		5. 좋아하는 과일을 선택하세요.<br>
		<select name="fruit">
			<option value="사과">사과</option>
			<option>바나나</option>
			<option>복숭아</option>
			<option>딸기</option>
			<option>포도</option>
		</select>
		<br><br>
		
		<button type="submit">제출</button>
	</form>
</body>
</html>