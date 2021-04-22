* `real_estate` 테이블을 이용해서 아래 문제를 풀어 보세요

### 1. 객체로 insert 하기 

* 아래 내용을 객체를 활용해서 insert 하세요. 
* 입력 성공한 행의 수를 출력하세요. 
* 요청 URL : http://localhost/lesson03/test02/1

> 입력 데이터 

```
realtorId : 3
address : 푸르지용 리버 303동 1104호
area : 89
type : 매매
price : 100000
```

> 출력 예시 

```
입력 성공 : 1
```



### 2. field 로 insert 하기 

* 아래 내용을 객체 없이 insert 하세요. 
* 단, realtorId 는 parameter를 통해서 전달받아서 저장하세요. 
* 입력 성공한 행의 수를 출력하세요. 

> 요청 URL 예시 

```
http://localhost/lesson03/test02/2?realtorid=5
```

> 입력 데이터 

```
address : 썅떼빌리버 오피스텔 814호
area : 45
type : 월세
price : 100000
rentPrice : 120
```

> 출력 예시 

```
입력 성공 : 1
```