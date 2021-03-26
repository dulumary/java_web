# 레이아웃 (Layout)
* 화면을 목적성에 맞게 분할하여, 작업을 용이하게 만드는 것

## div 태그
Division의 약자로 레이아웃을 나누는데 주로 쓰이는 태그 (분할, 나누기)

## HTML5 시맨틱(Sementic) 태그
* HTML5에서부터 표준화를 위해 새롭게 지원되는 태그이다.  
* `<div>...</div>` 와 비슷한 역할
* 의미를 가지는 태그
  * 웹페이지의 구조를 쉽게 이해할 수 있도록 정의된 태그

| 태그 | 설명  |
|------------------------------------------------------------|---------------------------------------------------------------------------------|
| `<header>...</header>`                                       | 머리글 영역 지정                                                                |
| `<nav>...</nav>`                                             | 네비게이션(메뉴) 영역 지정                                                      |
| `<section>...</section>`                                     | 관련된 내용 단위로 묶는 태그 (section 태그 안에 section 태그가 들어갈 수 있다.) |
| `<article>...</article>`                                     | section 태그보다 더 적은 단위로 기사, 게시글 등을 묶는 태그                     |
| `<figure>   <img…>   <figcaption>설명</figcaption></figure>` | 표, 그림, 다이어그램 등과 설명을 묶는 태그figcaption 태그에 설명을 정의         |
| `<aside>...</aside>`                                         | 본문 컨텐츠 외에 별도 영역을 지정                                               |
| `<footer>...</footer>`                                       | 웹 문서 아래쪽에 제작 정보를 표시하는 영역 지정                                 |
| `<address>...</address>`                                     | copyright 영역에 주소 내용을 담는 태그                                          |

### Sementic 레이아웃 구조
![시맨틱](/material/images/marobiana/front-end/sementic_layout.png)

## flex class 속성 (div 배치를 도와주는)
[참고 블로그](https://studiomeal.com/archives/197)