### 사용자 정보 확인
* id 와 password 를 입력 받고, submit 할 수 있는 `html 문서`를 작성하세요.  

> HTML 화면 예시
  
![test10](/material/images/dulumary/web/servlet/test10_html.png)

* 전달 받은 id와 password가 아래에 주어진 사용자 정보와 일치 하는지 확인하세요.

```
// doPost 메소드 바깥쪽에 위치
private final Map<String, String> userMap =  new HashMap<String, String>() {
	{
		put("id", "hagulu");
		put("password", "asdf");
		put("name", "김인규");
	}
};
```

* id가 일치하지 않는 경우 `id가 일치하지 않습니다.` 를 출력하세요.
* password가 일치하지 않는 경우 `password가 일치하지 않습니다.` 를 출력하세요.
* 일치하는 경우 아래와 같이 출력하세요. (HTML 화면)

> 결과 예시
![test10](/material/images/dulumary/web/servlet/test10_result.png)