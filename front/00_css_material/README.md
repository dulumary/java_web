# 자주 사용하는 CSS 속성 종류

## 1. `background` : 선택자 영역에 배경색 지정

### 1) 일반색 적용 - 16진수 표기
- 6자리: #ef2aff  
- 3자리: #000 (문자가 같은 경우 3자리로 표현 가능)  
예) `* { background : #ef2aff; }`  

### 2) 반투명색 적용 - RGBA 표기 : rgb(색상) + alpha(투명도)
- rgb는 0 ~ 255 사이의 숫자 값 입력 가능  
- 0은 검정색, 255는 흰색  
- 알파값은 0~1 사이의 소수값으로 지정  
예) `body { background : rgba(0, 0, 0, 0.5); }`  

## 2. `width` : 가로 사이즈 지정
- 0~100% 또는 픽셀(px)  
예) `div { width : 1200px; }`

## 3. `height` : 세로 사이즈 지정
- 0~100% 또는 픽셀(px)  
예) `.logo { height : 200px; }`

## 4. 글자 효과
### 스타일
- 굵게 : `span { font-weight : bold; }`  
- 글자 크기 : `span { font-size : 25px; }	`
- 글자 색깔 : `span { color : #000; }`  
### 위치 정렬
- 가운데로 정렬 : `a { text-align : center; }`

## 5. `text-decoration` : 하이퍼링크된 글자의 효과(글씨색, 밑줄) 없애기
- a 태그에 적용한다.  
예) `a { text-decoration : none; }`  

## 6. `list-style` : `<ul>` 밑에 `<li>` 태그 앞에 나타나는 점 없애기
- li 태그에 적용한다.  
예) `li { list-style : none; }`

## 7. `z-index` : 겹치는 요소가 있을 때, 태그를 위로 올려줄 것인지 지정한다.
- 1에서부터 큰 수 지정  
- 숫자가 클수록 위에 올려짐  
예) `#yellow_box { z-index : 100; }`  
![z-index](/material/images/marobiana/front-end/zindex.png)

## 8. `border` : 테두리 지정
### 1) 각각 지정하기
- 위쪽: `div { border-top : 1px solid #000; }`
- 오른쪽: `div { border-right : 1px solid #000; }`
- 아래쪽: `div { border-bottom : 1px solid #000; }`
- 왼쪽: `div { border-left : 1px solid #000; }`  
- 첫번째 li의 오른쪽: `li:first-child { border-right : 1px solid #000 }`  

### 2) 전체 지정하기
- 두께 | 선의 모양 | 색상 순서로 요소 정의
- `div { border : 1px solid #000; }`  

## 9. `box-sizing` : 테두리 영역을 어디에 줄 지 지정
테두리 효과를 지정하면, 컨텐츠 밖에 테두리가 생기면서 레이아웃이 깨진다.  
예를들어 가로 200px, 세로 100px `<div>` 상자가 있을 때,   
1px 테두리를 적용하면 테두리까지 `가로 202px, 세로 102px` 가 된다.  

> 테두리를 컨텐츠 안쪽에 주면 200px, 100px 그대로 유지할 수 있다.  
`div { box-sizing : border-box; }`  

## 10. `border-radius` : 테두리의 둥글기 (값이 클수록 둥글어짐)
### 1) 전체 지정하기
div { border-radius : 20px; }

### 2) 모서리에 각각 지정하기
위쪽 우측 모서리에 둥글기 적용: `div { border-top-right-radius : 20px; }`  

## 11. `margin` : 컨텐츠 테두리의 바깥쪽 여백을 지정(레이아웃 잡을 때 사용)
![margin-padding](/material/images/marobiana/front-end/margin_padding.png)

### 1) 각각 지정하기
- 위쪽 여백: `div { margin-top : 5px; }`   
- 우측 여백: `div { margin-right : 5px; } `
- 아래쪽 여백: `div { margin-bottom : 5px; } `
- 좌측 여백: `div { margin-left : 5px; }` 

### 2) 전체 지정하기
- `div { margin : 5px; }`

### 3) 한번에 지정하기 (중간에 세미콜론 없음에 유의)
- 위, 우측, 아래, 좌측(위부터 시계 방향으로 여백 적용): `div { margin : 1px 2px 3px 4px; }` 
- 위/아래에 2px, 좌/우에 4px: `div { margin : 2px 4px; }`

### 레이아웃 가운데 정렬
- `div { margin : 0 auto; }`

## 12. `padding` : 컨텐츠 테두리의 안쪽 여백을 지정(레이아웃 잡을 때 사용)
![margin-padding](/material/images/marobiana/front-end/margin_padding.png)

### 1) 각각 지정하기
- 위쪽 여백: `div { padding-top : 5px; }`
- 우측 여백: `div { padding-right : 5px; }`
- 아래쪽 여백: `div { padding-bottom: 5px; }`
- 좌측 여백: `div { padding-left : 5px; }`

### 2) 전체 지정하기
- `div { padding : 5px; }`

### 3) 한번에 지정하기 (중간에 세미콜론 없음에 유의)
- 위, 우측, 아래, 좌측(위부터 시계 방향으로 여백 적용): `div { padding : 1px 2px 3px 4px; }`
- 위/아래에 2px, 좌/우에 4px: `div { padding : 2px 4px; }`  

## 13. `display` : 어떻게 보여줄 지 지정
예) `선택자 { display: none; }`

### display의 값
- `none` : 요소를 감춘다. 영역도 차지하지 않는다.  
- `inline`
  - 줄바꿈이 되지 않고 한 행에 위치한다.  
  - width, height, margin, padding이 적용되지 않는다.
  - 예) `<span>, <a>, <img>, <input>` 등  
     ![인라인](/material/images/marobiana/front-end/inline.png)
- `block`
  - 하나의 요소가 한 행에 혼자만 위치한다.  
  - 옆에 다른 태그를 두는 것을 허용하지 않는다.  
  - 다음 요소는 아래행에 위치하게 된다.  
  - width, height, margin, padding 적용 가능하다.  
  - 레이아웃을 잡을 때 주로 사용한다.  
  - 예) `<div>, <ul>, <li>, <ol>, <form>` 등  
     ![block](/material/images/marobiana/front-end/block.png)
- `inline-block`
  - inline과 block 속성을 함께 가진다. 
  - 한 행에 이어지지만 width, height, margin, padding 값을 사용할 수 있다.
    ![inline-block](/material/images/marobiana/front-end/inline-block.png)


## 14. `flex` : 유동적인 레이아웃
[flex 개념 설명 블로그](https://studiomeal.com/archives/197)

## 15. `position` : 특정 요소의 위치를 잡아준다.
참고 링크: https://ofcourse.kr/css-course/position-%EC%86%8D%EC%84%B1
- `static` : 기본값. 다른 태그들에 의해 자동으로 배치됨. 위치 설정 불가.
- `fixed` : 스크롤을 내려도 화면 특정 위치에 계속 고정되어 따라다닌다.
- `relative` : *원래 있던 위치* 를 기준으로 좌표 지정
  - `position:absolute`를 사용한 1차 상위(직속) 부모에 지정한다.
- `absolute` : 원래 있던 위치에서 절대 위치 지정  
  - top, right, bottom, left 속성과 함께 사용하여 위치를 잡아준다.
  - 화면의 정 가운데로 위치 지정하기(예: 팝업 레이어 위치)
   ```
   div {position: absolute; left: 50%; top: 50%; transform: translate(-50%, -50%); }
   ```

## 16. `overflow` : 태그 영역을 벗어났을 때의 처리
- hidden : 영역을 벗어났을 경우 벗어나지 않은 영역 안에만 표시하고, 벗어난 영역은 감춘다.  
예) `.box { overflow : hidden; }`  

## 17. `태그명:hover` : 특정 태그에 마우스를 올렸을 때 효과
예) 마우스를 올렸을 때 a 태그의 배경색을 #333으로 변경  
  `a:hover { background : #333; }` 

## 18. `li:first-child` : li 태그들 중에 첫번째에만 주는 효과
예) li 태그 중 첫번째 태그에만 오른쪽에 #000 색의 선을 그린다.  
`li:first-child { border-right: 1px solid #000; }`
