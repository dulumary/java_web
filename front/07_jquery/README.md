# jQuery 프레임워크

## jQuery
- 자바스크립트 언어를 간편하게 사용할 수 있도록 단순화 시킨 **라이브러리**

## 사용 방법
### 1) 다운로드 후 include
- [jQuery 사이트](https://jquery.com/download/) 에서 `.js` 파일을 받은 후 저장하고 `<head>` 태그에서 include해서 사용

### 2) CDN 주소 사용
- 구글에서 `jQuery CDN`으로 검색 - [CDN 링크 바로가기](https://code.jquery.com/)
- 링크를 복사해서 `<head>`태그에 붙여 넣는다.
- 이 방법은 사용자 트래픽이 없는 간단한 테스트 용으로만 사용한다.

## jQuery로 DOM tree의 Node 가져오기
- `선택자(Selector)`로 Node를 가져온다.
- CSS에서의 선택자 문법과 거의 동일하다.  
예) $(`selector`).동작함수명()

### 1) id로 Node 가져오기
```
$('#아이디명')
```

### 2) class로 Node들 가져오기
```
$('.클래스명')
```

### 3) 태그 이름과 name 속성으로 Node 가져오기
```
$('태그명[name="이름"]')
```

## 이벤트(Event)
- 웹 문서 상에서 `동적으로 어떤 동작이 일어났을 때를 감지`하고 원하는 **동작을 실행**시킬 수 있다.
- 특정 동작이 일어났을 때 이벤트 함수가 자동 호출된다.

## 1) 문서 로딩 이벤트
- 웹 문서가 잘 로드 되었는지 확인하는 이벤트  

| 이벤트 종류 | 설명 |
|--------|----------------------------------|
| ready | DOM tree가 완성된 상태 |
| load | image나 css가 모두 load 된 상태(ready보다 이후 시점) |
| error | 요소에 오류가 발생된 경우 |

> ready 이벤트 예제
```
$(document).ready(function() {
    alert("DOM tree 구성 완료");
});
```

## 2) 마우스 동작 이벤트
| 이벤트 종류 | 설명 |
|--------|----------------------------------|
| click | 요소를 클릭했을 때 |
| dbclick | 요소를 더블클릭 했을 때 |
| mouseover | 요소에 마우스 포인터를 올렸을 때 |
| mouseleave | 요소에서 마우스 포인터를 벗어났을 때  |
| hover | 요소에 마우스 포인터를 올렸을 때, 벗어났을 때 |
| scroll | 가로, 세로 스크롤바를 움직일 때 |

> click 이벤트 예제
```
$(selector).on('click', function(e) {
    alert("클릭 되었다");
});
```

## 3) 상태 변경 이벤트
| 이벤트 종류 | 설명 |
|--------|----------------------------------|
| change | 셀렉터의 값이 변했을 경우를 캐치 |

> change 이벤트 예제
```
$(selector).change(function() {
    alert("값이 변경되었다.");
});
```

## 셀렉터 jquery 함수들

| 함수명 | 설명 |
|--------|----------------------------------|
| val() | 요소의 값 가져오기 |
| val('text') | 요소 속에 'text' 값 넣기 |
| text('text') | 태그 사이에 'text' 값 넣기 |
| show() | 요소를 나타낸다. |
| hide() | 요소를 숨긴다. |
| hasClass(클래스명) | 요소에 클래스가 있는지 확인한다 |
| addClass('클래스명') | 요소에 클래스를 추가한다 |
| removeClass('클래스명') | 요소에 클래스를 제거한다 |
| css('속성명') | 요소에 css 속성명으로 속성값을 가져온다. |
| css('속성명', '속성값') | 요소에 css 속성과 값을 세팅한다. |
| attr('속성명') | 속성명에 해당하는 속성값을 가져온다. |
| attr('속성명', '속성값') | 해당 속성명에 속성값을 부여한다.<br>예) `$("a").attr("href", "http://google.com")`<br>  a 태그의 링크를 google 사이트로 설정 |
|prop('프로퍼티명', boolean) | 프로퍼티에 대한 설정(checked, selected, disabled)<br> 예) `$("input").prop("checked", true);`<br>input 태그에 체크를 설정한다.
 |