* `real_estate` 테이블을 이용해서 아래 문제를 풀어 보세요

### 1. id 로 select 하기 

* id를 parameter 로 입력 받고 해당하는 id의 매물 정보를 아래와 같이 json으로 출력하세요. 

> 요청 URL 예시 

```
http://localhost/lesson03/test01/1?id=22
```

> 출력 예시  

![test1](/material/images/dulumary/web/springMybatis/test01_1_result.png)

### 2. 월세 조건 select

* 월세(rentPrice) 를 parameter 로 받고 해당하는 월세보다 낮은 매물을 아래와 같이 json 으로 출력하세요. 


> 요청 URL 예시 

```
http://localhost/lesson03/test01/2?rent=90
```

> 출력 예시  

![test2](/material/images/dulumary/web/springMybatis/test01_2_result.png)

### 3. 복합조건 select

* 아래 두 parameter를 받고 매매 매물 중 조건에 모두 부합하는 매물 정보를 아래와 같이 json으로 출력하세요. 
    * 넓이(area) - 매물의 넓이가 전달 받은 넓이 이상인 것
    * 가격(price) - 매물의 매매금이 전달받은 매매금 보다 이하인 것
* 등록일을 기준으로 내림 차순으로 정렬하세요.

> 요청 URL 예시 

```
http://localhost/lesson03/test01/3?area=90&price=130000
```

> 출력 예시  

![test3](/material/images/dulumary/web/springMybatis/test01_3_result.png)