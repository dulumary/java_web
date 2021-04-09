### 배탈의 민족 검색 

* 가맹점 리스트를 기반으로, 메뉴 명을 입력 받고 해당하는 가게 리스트를 보여주는 기능을 만드세요. 
* input 을 통해서 검색할 메뉴를 입력 받고, 별점 4점이하인 곳을 제외할지 여부를 선택할 수 있는 checkbox 를 만드세요. 

> 입력 화면 

![test07](/material/images/dulumary/web/jsp/test07_input.png)

> 데이터 형태
```
[
    {name="버거킹", "menu"="햄버거", "point":4.3},
    {name="도미노피자", "menu"="피자", "point":4.5},
    ...
]
```

> 코드 복사하기
```
List<Map<String, Object>> list = new ArrayList<>();
	Map<String, Object> map = new HashMap<String, Object>() {{ put("name", "버거킹"); put("menu", "햄버거"); put("point", 4.3); } };
	list.add(map);
	map = new HashMap<String, Object>() {{ put("name", "BBQ"); put("menu", "치킨"); put("point", 3.8); } };
	list.add(map);
	map = new HashMap<String, Object>() {{ put("name", "교촌치킨"); put("menu", "치킨"); put("point", 4.1); } };
	list.add(map);
	map = new HashMap<String, Object>() {{ put("name", "도미노피자"); put("menu", "피자"); put("point", 4.5); } };
	list.add(map);
	map = new HashMap<String, Object>() {{ put("name", "맥도날드"); put("menu", "햄버거"); put("point", 3.8); } };
	list.add(map);
	map = new HashMap<String, Object>() {{ put("name", "BHC"); put("menu", "치킨"); put("point", 4.2); } };
	list.add(map);
	map = new HashMap<String, Object>() {{ put("name", "반올림피자"); put("menu", "피자"); put("point", 4.3); } };
	list.add(map);
```

* 전달 받은 메뉴명에 맞는 가맹점의 리스트를 아래와 같이 보여주세요
* 4점이하 제외 checkbox가 설정된경우 별점 4점이하의 가맹점은 제외하고 보여주세요. 

> 결과 화면

![test07](/material/images/dulumary/web/jsp/test07_result.png)
