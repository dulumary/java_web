# 부트스트랩(bootstrap)

## 부트스트랩(bootstrap)
* 스타일시트를 쉽고 예쁘게 꾸밀 수 있는 프레임워크

## 부트스트랩 다운로드
* 구글에서 `부트스트랩 4 CDN` 검색
* [부트스트랩 CDN 주소](https://getbootstrap.com/docs/4.0/getting-started/introduction/)
  * CSS, Javascript 주소들을 복사해서 `<head>` 태그에 추가한다.

```
<head>
  <!-- bootstrap CDN link -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        
  <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</head>
```

## 부트스트랩 Document
[부트스트랩 문서 링크](https://getbootstrap.com/docs/4.1/getting-started/introduction/)

## 부트스트랩에서 제공하는 색상 종류
- 글씨 색상 예) `.text-primary`
- 배경 색상 예) `.bg-primary`

|색상 명칭 |설명| 결과 |
|----------|------|---------|
|primary|파란색 |![파랑](/material/images/marobiana/front-end/primary.png) |
|secondary|회색 | ![회색](/material/images/marobiana/front-end/secondary.png)|
|success|초록색 | ![초록색](/material/images/marobiana/front-end/success.png)|
|danger|빨간색 |![빨간색](/material/images/marobiana/front-end/danger.png) |
|warning|노란색 | ![노란색](/material/images/marobiana/front-end/warning.png)|
|info|하늘색 | ![하늘색](/material/images/marobiana/front-end/info.png)|
|light|연한 회색 |![연한 회색](/material/images/marobiana/front-end/light.png) |
|dark|어두운 회색 |![어두운 회색](/material/images/marobiana/front-end/dark.png) |
|white|흰색 |![흰색](/material/images/marobiana/front-end/white.png) |
|transparent|투명색 | |

## `container` 클래스
container 클래스로 레이아웃을 잡으면 `적당한 width`가 잡힌 영역이 `가운데 정렬`된다.
```
.container {
   width: 100%;
   padding-right: 15px;
   padding-left: 15px;
   margin-right: auto;
   margin-left: auto;
}
```

## `d-flex` 클래스
- d-flex 클래스의 1차 자식 요소가 옆칸으로 나란히 정렬된다.  
- 높이(height) 만큼 꽉 채운다.
- flex는 기본으로 열 12칸 기반이다.
- [부트스트랩 flex 문서](https://getbootstrap.com/docs/4.0/utilities/flex/)

> 예제
```
<div class="d-flex">
  <div id="box1">
  </div>
  <div id="box2">
  </div>
</div>
```
box1과 box2 div 상자가 옆에 붙게된다.

## d-flex 하위 요소에 칸 넣기: `col-{숫자}` 클래스
- `col-1 ~ col-12` 까지 가능하다.  
- flex에서 사용할 경우 총 12칸 기반이므로 12칸 안에서 사용한다.

## d-flex 하위 요소 정렬
|클래스명| 설명|
|--------|--------|
|justify-content-start|요소들이 왼쪽에 정렬된다.|
|justify-content-end|요소들이 오른쪽에 정렬된다.|
|justify-content-center|요소들이 가운에 정렬된다.|
|justify-content-between|요소들이 양 끝을 기준으로 넓게 배치된다.|
|justify-content-around|요소들이 양 끝을 기준으로 적당한 여백을 두고 넓게 배치된다.|

## 칸 바깥 여백 : margin
- `1 ~ 5 사이의 값`으로 줄 수 있다.  
- 숫자가 커질수록 margin이 커진다.

### 1) 전체
예) `class="m-1"`

### 2) 위치 별 margin 적용
왼쪽: `class="ml-1"`   -> margin left의 약자
오른쪽: `class="mr-1"`   -> margin right의 약자
위쪽: `class="mt-1"`   -> margin top의 약자
아래쪽: `class="mb-1"`   -> margin bottom의 약자

## 칸 안쪽 여백 : padding
- `1 ~ 5 사이의 값`으로 줄 수 있다.  
- 숫자가 커질수록 padding이 커진다.

### 1) 전체
예) `class="p-1"`

### 2) 위치 별 padding 적용
왼쪽: `class="pl-1"`   -> padding left의 약자
오른쪽: `class="pr-1"`   -> padding right의 약자
위쪽: `class="pt-1"`   -> padding top의 약자
아래쪽: `class="pb-1"`   -> padding bottom의 약자

## `w-{비율}` 클래스: 가로
속성: `25%`, `50%`, `75%`, `100%`, `auto`  
사용 예) `<div class="w-25">`

## `h-{비율}` 클래스: 세로
속성: `25%`, `50%`, `75%`, `100%`, `auto`  
사용 예) `<div class="h-25">`

