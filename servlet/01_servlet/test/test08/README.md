### 검색하기
* 검색어를 입력받고 submit 할 수 있는 `html 문서`를 작성하세요.

> HTML 화면 예시
  
![test08](/material/images/dulumary/web/servlet/test08_html.png)

* 전달 받은 검색어를 아래 주어진 리스트에서 찾아서 일치하는 경우에 출력하세요.  
* 추가 기능) 검색된 단어를 `<b>` 태그를 통해서 강조하세요.

```
List<String> list = new ArrayList<>(Arrays.asList(
		"강남역 최고 맛집 소개 합니다.", 
		"오늘 기분 좋은 일이 있었네요.", 
		"역시 맛집 데이트가 제일 좋네요.", 
		"집에 가는 길에 동네 맛집 가서 안주 사갑니다.",
		"자축 저 오늘 생일 이에요."));
```

> 입력 예시
```
맛집
```

> 출력 예시
  
![test08](/material/images/dulumary/web/servlet/test08_result.png)