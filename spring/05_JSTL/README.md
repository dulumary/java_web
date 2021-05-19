# JSTL

# EL(Expression Language)

* JSP에서 변수값을 사용하기 위한 문법
* `<%= value %>` 이 문법 대신 `${value}` 형태로 사용한다.

# JSTL(Jsp Standard Tag Library)

* if문, foreach문 등의 제어문과 그 밖에 유용한 기능을 태그로 사용할 수 있도록 만든 라이브러리
* JSTL을 사용하기 위해서는 jsp 상단에 태그를 포함시켜야 한다.

> 자주 사용하는 JSTL 종류

|라이브러리명|접두어|주요 기능|URI|
|---|---|---|---|
|코어|c|변수 지원, 제어문, 페이지 관련 처리|http://java.sun.com/jsp/jstl/core|
|포매팅|fmt|포맷 처리, 국제화 지원|http://java.sun.com/jsp/jstl/fmt|
|함수|fn|collection 처리, String 처리|http://java.sun.com/jsp/jstl/fuctions| 


### [JSTL 레퍼런스 문서 바로가기](https://docs.oracle.com/javaee/5/jstl/1.1/docs/tlddocs/)


## 1. Core

조건문, 반복문, 변수, 출력 등의 기능  


> 라이브러리 포함 예시
```
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
```

### 1) `<c:set>`: 변수에 값을 넣는다.
> 속성 

|속성명|설명|
|--|--|
|var|변수명|
|value|값|

### 2) `<c:out>`: 값 출력
> 속성 

|속성명|설명|
|--|--|
|**value**|출력할 값 또는 변수명| 
|escapeXml|값에 포함된 자바스크립트 코드 무시(escape):true(기본값), 포함:false|
|default|변수 값이 null인 경우 기본값 출력|

### 3) `<c:if>`: if 조건문 
> 속성 

|속성명|설명|
|--|--|
|**test**|if 조건| 

### 4) `<c:choose> / <c:when> / <c:otherwise>`: if - else 형식의 조건문
`<c:choose>, <c:otherwise>`에는 속성이 없다.

> `<c:when>` 속성 

|속성명|설명|
|--|--|
|**test**|if 조건| 

### 비교 수식
- `eq`: `==` 값이 서로 같은지 확인
- `ne`: `!=` 값이 서로 다른지 확인
- `empty`: 값이 null인지 확인
- `!empty`: 값이 들어있는지 확인

### 5) `<c:forEach>`: 배열, List, map 등의 값을 순서대로 처리
> 속성 

|속성명|설명|
|--|--|
|**var**|꺼내진 데이터의 변수명| 
|items|반복문으로 하나씩 꺼낼 대상 객체명(배열, List, Map 등의 Collection 객체)|
|begin|시작값|
|end|종료값|
|step|얼마만큼 증가 시킬지|
|varStatus|**index**: 0부터 출력<br>**count**: 1부터 출력<br>**first**: 반복문이 첫번째로 돌았으면 true<br>**last**: 반복문이 마지막 번째이면 true<br>**current**: 현재의 var 값 출력(var에 선언된 변수값 출력과 동일) |

## 2. Formatting

숫자, 날짜 등의 형식을 지정하여 출력한다.  


> 라이브러리 포함 예시
```
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
```

### 1) `<fmt:formatNumber>`: 숫자 포맷

> 속성

|속성명|설명|
|--|--|
|**value**|포맷을 지정할 값|
|type|3가지 타입 중 하나 선택. number:숫자, currency:통화, percent:퍼센트|
|groupingUsed|숫자 단위  예) 1,000,000 |
|currencySymbol|type이 currency일 때 사용 가능. 통화 단위 설정<br>예) currencySymbol="$"|
|var| 포맷이 적용된 결과를 var에 정의된 변수에 담는다.|
|pattern|0이나 #으로 숫자 자리를 지정<br>**0**: 값이 없어도 자리수를 0으로 채운다.<br>**#**: 값이 있으면 채우고 없으면 채우지 않는다.|

### 2) `<fmt:formatDate>`: Date -> String

> 속성

|속성명|설명|
|--|--|
|**value**|Date 객체 값|
|pattern|날짜를 표현할 패턴 정의<br>예) yyyy-MM-dd HH:mm:ss|
|var|패턴이 적용된 날짜 String 변수명 지정|
|type|date:년도.월.날짜 형식으로 출력 예) 2021.7.15<br>time:오전/오후 시간:분:초 형식으로 출력 예) 오후 4:32:20<br>both:년월일 시간 모두 출력|

> 사용 방법
```
<fmt:formatDate var="resultRegDt" value="${rs.regDt}" pattern="yyyy-MM-dd HH:mm:ss"/>
${resultRegDt}
```
> 결과
```
2021-07-14 21:55:43
```

### 3) `<fmt:parseDate>`: String -> Date 

> 속성

|속성명|설명|
|--|--|
|**value**|String으로 표현된 날짜 값|
|pattern|value에 표현된 날짜 형식 지정<br>예) yyyy-MM-dd|
|var|Date 객체로 변환된 결과 변수명 지정|

## 3. 함수

**문자열(String) 처리 함수**들을 제공하며, **EL 표현식과 함께 사용**한다.

> 라이브러리 포함 예시
```
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
```

> 사용 예시
```
${fn:replace(text, oldStr, NewStr)}
```

### 1) `${fn:contains(전체 문자열, 검색할 문자열)}`

* 전체 문자열에 검색할 문자열이 있는지 확인  
* 결과 타입: boolean

### 2) `${fn:containsIgnoreCase(전체 문자열, 검색할 문자열)}`

* 전체 문자열에 검색할 문자열이 있는지 확인(대소문자 구분 안함)
* 결과 타입: boolean

### 3) `${fn:startsWith(전체 문자열, 확인할 문자열)}`

* 전체 문자열이 확인할 문자열로 시작하는지 확인
* 결과 타입: boolean

### 4) `${fn:endsWith(전체 문자열, 확인할 문자열)}`

* 전체 문자열이 확인할 문자열로 끝나는지 확인
* 결과 타입: boolean

### 5) `${fn:length(문자열)}`

* 문자열의 길이 구하기
* 결과 타입: integer

### 6) `${fn:replace(전체 문자열, 기존값, 변경값)}`

* 전체 문자열의 기존값 부분을 변경값으로 치환
* 결과 타입: String

### 7) `${fn:split(전체 문자열, 구분자)}`

* 전체 문자열에서 구분자를 기준으로 잘라 배열로 저장한다.
* 결과 타입: String[]

### 8) `${fn:substring(전체 문자열, 시작 인덱스, 종료 인덱스)}`

* 전제 문자열 중 시작 인덱스부터 종료 인덱스까지의 문자열 리턴
* 결과 타입: String

### 9) `${fn:toLowerCase(문자열)}`

* 문자열을 모두 소문자로 변경
* 결과 타입: String

### 10) `${fn:toUpperCase(문자열)}`

* 문자열을 모두 대문자로 변경
* 결과 타입: String

### 11) `${fn:trim(문자열)}`

* 문자열의 앞 뒤 공백을 모두 제거한 문자열 리턴
* 결과 타입: String