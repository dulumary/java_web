# JSP

## 어노테이션

### `@RequestMapping`

* URL Path와 일치하는 컨트롤러의 메소드를 수행한다.

> 사용 예시

```
@RequestMapping("/ex01")
```

> 사용 예시  
method가 GET인 경우에만 Mapping

```
@RequestMapping(method = RequestMethod.GET, path = "/ex01")
```

### `@GetMapping("경로")`

* @RequestMapping와 비슷하나 method 중 **GET**으로 호출한 경우만 매핑된다.
* 데이터를 조회할 때 사용

### `@PostMapping("경로")`

* @RequestMapping와 비슷하나 method 중 **POST**로 호출한 경우만 매핑된다.
* 데이터를 추가할 때 사용

### `@ModelAttribute`

* **@RequestParam** 어노테이션 대신 사용한다.
* 폼 태그의 name 속성과 DTO 객체의 필드명이 일치하는 데이터를 세팅해서 객체로 한번에 받아온다.

> 사용 예

```
@PostMapping("/ex01")
public String addTestDTO(@ModelAttribute TestDTO testDTO) {
  // ...
}
```

## EL(Expression Language)

* JSP에서 변수값을 사용하기 위한 문법
* `<%= value %>` 이 문법 대신 `${value}` 형태로 사용한다.

## MyBatis 문법

### 방금 insert된 pk 값 가져오기
id와 같은 PK값은 데이터를 추가한 후에 DB에서 얻어내야 한다.
  
* **useGeneratedKeys** 속성과 **keyProperty** 속성을 사용하여 pk를 얻어낼 수 있다.
  * `useGeneratedKeys`: true로 설정
  * `keyProperty`: Primary Key가 되는 필드명
* insert 시 parameterType이 **DTO 객체**여야 한다.
* key로 설정된 필드와 일치하는 **DTO 객체의 필드**에 pk값이 들어가게 된다.

> insert 문
```
<insert id="insertNewUser" parameterType="com.marobiana.model.TestDTO" useGeneratedKeys="true" keyProperty="id">
    <!-- Insert 쿼리 -->
</insert>
```
`com.marobiana.model.TestDTO` 클래스의 id 필드에 pk 값이 세팅된다.


