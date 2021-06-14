## 홍당무 마켓 

* 홍당무 마켓 두 테이블(**seller**, **used_goods**)을 통해서 아래 문제를 풀어보세요.   
* 화면은 template를 활용해서 만드세요. 

## 1. 목록 출력하기

* jsp를 이용해서 아래와 같이 화면을 구성하세요. 
* id 를 기준으로 **내림차순**으로 출력하세요. 
* 상품에 마우스를 올렸을때, 해당 박스의 배경색을 변경하세요. 

> 화면 예시
  
![test03](/material/images/dulumary/web/servletdb/test03_result1.png)

## 2. 입력하기 

* 새로운 jsp에서 input 태그로 데이터를 입력 받고, form 태그와 servlet을 이용해서 insert 하세요. 
* 셀렉트 태그를 통해서 셀러를 선택할 수 있도록 만드세요 (`seller` 테이블을 조회 해서 seller 목록을 가져옴)
* jqeury 를 통해서 판매자, 제목, 가격에 유효성 검사를 해서 비어있는 값이 넘어가지 않도록 하세요. 
* insert 후 위에서 만든 목록 출력 페이지로 리다이렉트 하세요. 

> 화면 예시
  
![test03](/material/images/dulumary/web/servletdb/test03_result2.png)