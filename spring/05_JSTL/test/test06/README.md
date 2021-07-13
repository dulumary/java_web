### 1. 우리동네 가게 리스트 페이지 
* `store` table 을 활용해서 아래와 같은 페이지를 만드세요. 
* 2강 `DB 연동(MyBatis)` 에서 사용한 `StoreBO` 를 활용하세요.

> 출력 예시 

![test1](/material/images/dulumary/web/jstl/test06_1_result.png)


### 2. 리뷰 페이지
* 1번 문제에서 만든 리스트에서 가게를 선택 했을때, 해당 가게의 리뷰를 보여주는 페이지를 만드세요. 
* `new_review` table을 활용하세요. 
* get method의 parameter를 활용해서 링크로 `store` 정보를 전달하세요. 
    *  hint ) `/test06/reviews?storeId=3&storeName=BHC`
* 최근 날짜 순서로 출력하세요 
* 아래 별 이미지를 활용해서 `point` 에 따른 별점을 표시하세요. 

채워진 별 : `http://marondal.com/material/images/dulumary/web/jstl/star_fill.jpg`
반만 채워진 별 : `http://marondal.com/material/images/dulumary/web/jstl/star_half.jpg`
비어있는 별 : `http://marondal.com/material/images/dulumary/web/jstl/star_empty.jpg`


> 출력 예시 

![test2](/material/images/dulumary/web/jstl/test06_2_result.png)


* 리뷰 내용이 없는 경우 아래와 같이 안내하도록 하세요.

![test2](/material/images/dulumary/web/jstl/test06_2_result2.png)


