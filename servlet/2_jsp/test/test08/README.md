### 책 목록

* List에 Map 형태로 책 정보들이 들어있습니다.
```
	List<Map<String, Object>> list = new ArrayList<>();
	Map<String, Object> map = new HashMap<String, Object>() {
		{ 
			put("id", 1000);
			put("title", "아몬드"); 
			put("author", "손원평"); 
			put("publisher", "창비");
			put("image", "http://image.kyobobook.co.kr/images/book/xlarge/267/x9788936434267.jpg");
		} 
	};
	list.add(map);
	
	map = new HashMap<String, Object>() {
		{ 
			put("id", 1001);
			put("title", "사피엔스"); 
			put("author", "유발 하라리"); 
			put("publisher", "김영사");
			put("image", "http://image.kyobobook.co.kr/images/book/xlarge/464/x9788934972464.jpg");
		} 
	};
	list.add(map);
	
	map = new HashMap<String, Object>() {
		{ 
			put("id", 1002);
			put("title", "코스모스"); 
			put("author", "칼 세이건"); 
			put("publisher", "사이언스북");
			put("image", "http://image.kyobobook.co.kr/images/book/xlarge/892/x9788983711892.jpg");
		} 
	};
	list.add(map);
	
	map = new HashMap<String, Object>() {
		{ 
			put("id", 1003);
			put("title", "나미야 잡화점의 기적"); 
			put("author", "히가시노 게이고"); 
			put("publisher", "현대문학");
			put("image", "http://image.kyobobook.co.kr/images/book/xlarge/194/x9788972756194.jpg");
		} 
	};
	list.add(map);
```

* 위와 같은 형태로 책목록 데이터가 있을떄 이를 이용해서 아래와 같은 책목록 페이지를 만드세요. 

> 결과 화면
![test08](/material/images/dulumary/web/jsp/test08_input.png)

* 위 책목록에서 책제목을 선택했을때, 아래와 같이 책의 자세한 정보를 표시하는 페이지로 이동하도록 만드세요. 
* 책 세부 페이지에도 위에 있는 데이터를 포함해서 사용하세요. 

> 결과 화면

![test08](/material/images/dulumary/web/jsp/test08_result.png)
