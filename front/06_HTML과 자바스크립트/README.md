# HTML과 자바스크립트(Javascript)

## DOM(Document Object Model)이란?
- W3C의 표준 객체 모델
- 브라우저가 HTML 웹 문서를 읽어들인 후 Tree 구조로 구성하여 메모리에 적재한다.
- [DOM Tree를 볼 수 있는 사이트](https://software.hixie.ch/utilities/js/live-dom-viewer/)
> 아래 HTML 문서를 복사해서 붙여넣기
```
<!DOCTYPE html>
<html> 
    <head> 
        <meta charset="UTF-8"> 
        <title>제목</title> 
    </head> 
    <body> 
        <h1 class="class-h1">Hello World!</h1> 
        <div class="class-div" id="contents"> 
            <p class="class-p" id="p1" name="p_name">내 이름은 OO이다.</p> 
            <p class="class-p" id="p2" name="p_name">내 이름은 ㅁㅁ이다.</p> 
            <a class="class-a" href="https://marondal.com" target="_blank">마론달로 이동</a> 
        </div> 
    </body> 
</html>
```

## 자바스크립트로 각 Node 접근해보기
- `선택자(Selector)`로 Node를 가져온다.
- 선택자의 종류
  - 태그
  - id
  - class
  - 태그의 `name` 속성    
    예) `<input name="user-name">`

### 1) id로 노드 가져오기
- id는 문서 안에서 하나만 사용한다.
```
let p1 = document.getElementById('p1');
console.log(p1);
```
> 결과
```
<p class="class-p" id="p1" name="p_name">내 이름은 OO이다.</p> 
```

### 2) class로 여러 노드 가져오기
- class는 문서 내에서 여러 노드가 존재할 수 있다.
```
let pClasses = document.getElementsByClassName('class-p');
console.log(pClasses)
```
> 결과
```
ex01.html:20 HTMLCollection(2) [p#p1.class-p, p#p2.class-p, p1: p#p1.class-p, p_name: p#p1.class-p, p2: p#p2.class-p]
```

### 3) 특정 태그명의 모든 노드 가져오기
```
let divTags = document.getElementsByTagName('div');
console.log(divTags);
```
> 결과
```
ex01.html:23 HTMLCollection [div#contents.class-div, contents: div#contents.class-div]
```

### 4) name 속성을 가진 태그의 모든 노드 가져오기
```
let pNames = document.getElementsByName('p-name');
console.log(pNames);
```
> 결과
```
ex01.html:23 NodeList(2) [p#p1.class-p, p#p2.class-p]
```

### 5) 태그안의 텍스트 내용 바꾸기 

```
let p1 = document.getElementById('p1');
p1.innerText = "바꿀 텍스트";
```

### 6) 태그 안에 태그 내용 바꾸기 

```
let p1 = document.getElementById('p1');
p1.innerHTML= "<p>바꿀 태그</p>";
```
