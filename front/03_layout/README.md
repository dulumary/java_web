# 레이아웃(Layout)

## HTML, CSS 미리보기 사이트
### [미리보기](https://liveweave.com/)

## div 태그
Division의 약자로 레이아웃을 나누는데 주로 쓰이는 태그 (분할, 나누기)

## HTML5 시맨틱(Sementic) 태그
- HTML5에서부터 표준화를 위해 새롭게 지원되는 태그이다.  
- `<div>...</div>` 와 비슷한 역할
- 의미를 가지는 태그
  - 웹페이지의 구조를 쉽게 이해할 수 있도록 정의된 태그

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

## block vs inline

태그들은 inline이거나 block 중 하나에 속한다.

### block
- 한 행에 block 태그 **혼자** 위치하며 width, height 값을 줄 수 **있다.**

> 블록 태그의 예  
```
<address>, <article>, <aside>, <audio>, <blockquote>, <canvas>, <dd>, <div>, <dl>,
<fieldset>, <figcaption>, <figure>, <footer>, <form>, <h1>, <h2>, <h3>, <h4>, <h5>,
<h6>, <header>, <hgroup>, <hr>, <noscript>, <ol>, <output>, <p>, <pre>, <section>,
<table>, <ul>, <video>
```

### inline
- 한 행에 다른 inline 태그들과 함께 위치할 수 있으며 width, height 값을 줄 수 **없다.**

> 인라인 태그의 예  
```
<a>, <abbr>, <acronym>, <b>, <bdo>, <big>, <br>, <button>, <cite>, <code>, 
<dfn>, <em>, <i>, <img>, <input>, <kbd>, <label>, <map>, <object>, <q>, <samp>,
<small>, <script>, <select>, <span>, <strong>, <sub>, <sup>, <textarea>, <tt>, <var>
```