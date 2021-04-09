## 1. 매물 리스트 
* 부동산 매물 테이블(**real_estate**)을 통해서 아래 문제를 풀어보세요.   
* servlet에서 DB 연동을 통해 아래 항목을 insert 하고 전체 매물 리스트를 `text/plain` Type으로 출력하세요. 

| realtorId | address | area | type | price | rentPrice | 
|:---:|:---:|:---:|:---:|:---:|:---:|
| 3| 헤라펠리스 101동 5305호 | 350 | 매매 | 1500000 | NULL |

* 출력 컬럼은 매물 주소, 면적, 타입 입니다. 
* id 기준 내림차순으로 10개만 출력하세요.

> 출력 예시
  
![test01](/material/images/dulumary/web/servletdb/test01_result.png)