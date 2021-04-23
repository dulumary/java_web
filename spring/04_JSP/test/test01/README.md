* `seller` 테이블을 이용해서 아래 문제를 풀어 보세요.

### 1. seller 추가 

* 입력 form을 이용해서 새로운 seller를 DB에 추가하세요. 
* 추가 이후에 입력 성공 페이지를 출력하세요.
* 입력 form URL : http://localhost/lesson04/test01/1
* 입력 action URL : http://localhost/lesson04/test01/add_seller

> 입력 예시 

![test1](/material/images/dulumary/web/springJsp/test01_1_input.png)


### 2. seller 출력

* 가장 최근에 추가된 seller의 정보를 아래와 같은 형태로 출력 하세요.
* 요청 URL : http://localhost/lesson04/test01/seller_info

> 출력 예시 

![test2](/material/images/dulumary/web/springJsp/test01_2_result.png)

### 3. seller 검색 출력

* 2번 문제에서 만든 결과를 재사용해서 id 를 parameter로 받아서 해당하는 seller를 출력하세요. 
* id parameter가 없는 경우와 있는 경우 모두 처리 가능하도록 구현하세요. 

> 요청 URL 예시 

```
http://localhost/lesson04/test01/seller_info?id=1
```

> 출력 예시 

![test3](/material/images/dulumary/web/springJsp/test01_3_result.png)