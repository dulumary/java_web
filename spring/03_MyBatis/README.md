# MyBatis
<<@= 

### 데이터를 가져오는 구조 설명
* 예전에는 여러테이블의 데이터가 필요하면 xml에서 join쿼리를 복잡하게 짜서 가져오곤 했었다.
* 통계에서는 아직도 그러긴 하지만, 비즈니스 로직을 짤 때는 데이터베이스에서 가져오는 쿼리는 단순하게 한테이블만 가져오고, 자바 서비스에서 데이터가 들어있는 객체끼리 코드로 조인되도록 한다.
* CRUD 쿼리를 간편하게 하고, 로직에서 필요한걸 합치는 구조로 바뀌었다.

### 장점
* 쿼리가 간단하며 요구사항이 바뀔 때마다 복잡한 쿼리를 추가하지 않아도 된다.(레거시가 많이 생김)
* 간단한 기본 쿼리의 재사용성이 높아진다.

=@>>

## MyBatis란?

XML에 SQL 쿼리를 작성하여 데이터베이스에 접근하고, 자바 객체와 매핑해주는 `Persistence Framework`

## 쿼리 수행 로그 세팅

수행된 쿼리문을 Console에서 볼 수 있도록 로그를 찍는 세팅을 한다.  
**SpringBoot web starter**에 기본으로 `logback`이라는 로깅 라이브러리가 세팅되어 있으며 설정을 추가하면 된다.  
  
`src/main/resources`에 설정 파일명을 `logback-spring.xml`로 설정하면 logback 설정 파일을 읽는다.

> `logback-spring.xml`
```
<?xml version="1.0" encoding="UTF-8"?>
<configuration debug="true">

	<!-- Appenders -->
	<appender name="console" class="ch.qos.logback.core.ConsoleAppender">
		<encoder>
			<Pattern>%d %5p [%c] %m%n</Pattern>
		</encoder>
	</appender>

	<!-- Logger -->
	<logger name="com.marobiana" level="DEBUG" appender-ref="console" />

	<!-- Root Logger -->
	<root level="info">
		<appender-ref ref="console" />
	</root>
</configuration>
```
위의 내용의 코드를 추가하면 수행된 쿼리문이 로그에 찍힌다.

## CRUD 예제

### SELECT 문

> mapper.xml

```
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN"
 "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
 
<mapper namespace="com.marobiana.lesson03.dao.ReviewDAO">
	<select id="selectReview" parameterType="int" resultType="com.marobiana.lesson03.model.Review">
		SELECT
			`id`
			, `storeId`
			, `menu`
			, `userName`
			, `point`
			, `review`
			, `createdAt`
			, `updatedAt`
		FROM
			`new_review`
		WHERE
			`id` = #{id}
	</select>
</mapper>
```

* `mapper namespace`: 명시된 **인터페이스**와 xml을 매핑한다.
* `select`의 속성
  * `id`: mapper namespace에 명시된 인터페이스의 **메소드명과 일치**하는 쿼리가 수행된다.
  * `parameterType`: 쿼리를 동적으로 구성하기 위한 데이터의 타입(자료형 또는 객체)
  * `resultType`: 쿼리 수행 후 결과의 타입(자료형 또는 객체)

> Mapper Interface.java
```
@Repository
public interface ReviewDAO {
    public Review selectReview(@Param("id") int id);
}
```
* Mapping이 되는 인터페이스는 @Repository 어노테이션으로 Spring Bean을 만든다.
* @Param 어노테이션에 정의된 이름으로 xml에서 동적으로 값을 세팅한다.

## Insert 문

> mapper.xml

```
<insert id="insertReview" parameterType="com.marobiana.lesson03.model.Review">
	INSERT INTO `new_review`
	(
		`storeId`
		, `menu`
		, `userName`
		, `point`
		, `review`
		, `createdAt`
		, `updatedAt`
	)
	VALUES
	(
		#{storeId}
		, #{menu}
		, #{userName}
		, #{point}
		, #{review}
		, NOW()
		, NOW()
	)
</insert>

<!-- 또는 -->

<insert id="insertReviewAsField" parameterType="map">
	INSERT INTO `new_review`
	(
		`storeId`
		, `menu`
		, `userName`
	    , `point`
		, `review`
		, `createdAt`
		, `updatedAt`
	)
	VALUES
	(
		#{storeId}
		, #{menu}
	    , #{userName}
		, #{point}
		, #{review}
		, NOW()
		, NOW()
	)
</insert>
```

* `insert`의 속성
  * `id`: mapper namespace에 명시된 인터페이스의 **메소드명과 일치**하는 쿼리가 수행된다.
  * `parameterType`: 쿼리를 동적으로 구성하기 위한 데이터의 타입(자료형 또는 객체)
  * 결과가 없으므로 `resultType`은 쓰지 않는다.
* insert가 되고 난 후 몇 행이 insert 되었는지 리턴 받을 수 있다.

> Mapper Interface.java
```
@Repository
public interface ReviewDAO {
    public int insertReview(Review review); // review 객체의 내용을 row로 추가

    // 또는 

    public int insertReviewAsField(
			@Param("storeId") int storeId, 
			@Param("menu") String menu, 
			@Param("userName") String userName, 
			@Param("point") double point, 
			@Param("review") String review);  // 여러 파라미터들을 row로 추가
}
```
* `insertReview`: 객체를 넘기면 객체의 필드명으로 xml에서 동적으로 값을 세팅한다.
* `insertReviewAsField`: 
  * @Param 어노테이션에 정의된 이름들로 xml에서 동적으로 값을 세팅한다.
  * xml에서는 파라미터들을 **map**으로 받으면 된다.

## Update 문

> mapper.xml

```
<update id="updateReviewById" parameterType="map">
	UPDATE `new_review`
	SET
		`review` = #{review}
	WHERE
		`id` = #{id}
</update>
```

> Mapper Interface.java
```
public void updateReviewById(
		@Param("id") int id,
		@Param("review") String review);
```

## Delete 문

> mapper.xml

```
<delete id="deleteReviewById" parameterType="int">
	DELETE
	FROM `new_review`
	WHERE
		`id` = #{id}
</delete>
```

> Mapper Interface.java
```
public void deleteReviewById(@Param("id") int id);
```