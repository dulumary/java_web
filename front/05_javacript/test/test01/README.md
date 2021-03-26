### 1. 변수 alert 출력 
* 변수를 사용해서 연산하고 alert 창에 아래와 같이 출력하세요. 

> 출력 예시 

```
5 X 8 = 40
```

### 2. 변수 console 출력 

* 주어진 두 개의 변수를 아래와 같은 형태로 console 에 출력하세요. 
* 변수는 값을 변경하지 말고 그대로 사용하세요.

```
var number1 = 12;
var number2 = 34;
```

> 출력 예시 

```
1234
```

### 3. 변수 비교 

* 아래 주어진 두 변수를 등호(=) 비교연사자를 통해서 조건문을 만들고 아래와 같이 출력 하도록 구현하세요.

```
var number1 = 10;
var number2 = "10";
```

```
두 변수는 같지 않다.
```

### 4. 변수 비교 

* 주어진 두 변수를 비교해서 true가 되도록 조건을 만들고 console 로 아래와 같이 출력하세요. 

```
let score;
let number = null;
```

> 출력 예시 

```
true
```

### 5. 경고 창

* 주어진 변수에 값이 입력된 ID 라고 가정하고 alert창을 띄우세요. 

> 변수 예시 (정상적인 경우)

```
var userId = "hagulu";
```

> 변수 예시 (비정상적인 경우)

```
var userId;
var userId = "";
var userId = null;
```



> 출력 예시 (정상적으로 값이 있을 경우)

```
안녕하세요 hagulu 님
```

> 출력 예시 (비정상적인 경우)

```
비정상적인 접근입니다. 
```


### 6. 지역 변수

* 주어진 코드가 아래 처럼 출력 되도록 수정하세요. 

```
var word1 = "hello";

if(word1 == "hello") {
    let word2  = "world";
}

console.log(word1 + word2);
```

> 출력 결과 

```
hello world
```