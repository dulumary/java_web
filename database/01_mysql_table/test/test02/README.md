### 배달 어플 리뷰 테이블 

* 리뷰를 관리하는 테이블을 `review` 만들고 수정한다. 
* 해당 테이블은 앞으로 문제에 계속 사용됩니다. 
* 필드 명은 괄호안에 영어단어로 추천!

### 1. 테이블 생성 

* 아래 조건을 만족하는 테이블을 설계하고 생성하세요. 

> 필드 내용

* id
* 상호명 (store)
    * 최대 8자 문자열 
    * not null
* 주문 메뉴 (menu)
    * 최대 8자 문자열
    * not null
* 별점 (point)
    * 0.5 ~ 5.0 
    * default 3.5
* 리뷰내용 (review)
    * 최대 256자 문자열 
    * nullable
* 입력 날짜 (createdAt)
* 수정 날짜 (updatedAt)

### 2. 컬럼 변경 

* 리뷰 작성자를 표시할 수 있도록 작성자(userName) 필드를 추가 하세요. 
    * 최대 32자 문자열 
    * not null
* `menu` 컬럼 뒤에 위치하도록 추가하세요.  

### 3. 컬럼 타입 수정 

* 최근 긴이름의 상호명과 메뉴 명이 늘어 나면서 현재 테이블로 저장이 어려워 졌다. 
* 두 컬럼을 32자 까지 저장 가능하도록 수정하세요. 
* 상호명 컬럼명을 store -> storeName 으로 변경하세요.

