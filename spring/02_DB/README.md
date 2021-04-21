# DB 연동(MyBatis) Cycle

# Spring MVC 패턴
좌측에서부터 클라이언트의 요청이 들어온다.

![spring_mvc](/material/images/dulumary/web/springdb/spring_layer.png)
  
## 1. Presentation Layer(표현 계층)

View 화면을 나타내기 위한 계층

### 명칭

* Controller

## 2. Business Layer(비즈니스 계층)

비즈니스 로직(데이터 가공 및 처리)이 있는 계층

### 명칭

* Service
* BO (Business Object)

## 3. Persistence Layer(영속 계층)

데이터를 DB에 저장해두고 지속적으로 사용할 수 있게 하는 계층
  
### 명칭

* Repository
* DAO (Data Access Object)
  * 클래스 
  * SqlSession 객체를 직접 사용
  * DAO를 Spring Bean으로 만들기 위해 @Respository 어노테이션 사용
* Mapper
  * 인터페이스
  * Mapper.xml에 있는 쿼리와 같은 이름의 메소드와 매핑된다.

## 4. Entity

* Database의 테이블 데이터를 담기 위한 객체  
* field와 Getter, Setter만 갖는 순수한 Java Bean 객체(new로 생성)  
* **테이블 컬럼과 일치하는 필드로만 구성**
  
### 명칭
* entity: 테이블 내용만 담는 Java Bean 객체
* domain: entity와 같은 개념이나, DTO로 사용하는 경우도 있음
* model: entity와 같은 개념이나, DTO로 사용하는 경우도 있음

## 5. DTO(Data Transfer Object)

* Entity 개념을 포함한다.
* **Entity** 개념에 표현 계층(Presentation Layer)에서 사용하기 위한 **필드를 추가**할 수도 있다.
* 여러 계층간 데이터를 옮기기 위한 목적의 객체

### 명칭

* DTO(Data Transfer Object)
* VO(Value Object): DTO와 같은 개념인데 한가지 다른점은 **Read-Only** 이다.

# 어노테이션
### @Autowired

* 해당하는 **Spring Bean**을 찾아 사용할 수 있도록 한다.
* DI(Depency Injection) 의존성 주입이라고 한다.

> 사용 예제

```
public class TestController {
    @Autowired
    private TestBO testBO;
}
```

## Spring Bean으로 만들어주는 어노테이션
용도에 맞는 어노테이션을 사용하자.

![mvc_annotation](/material/images/dulumary/web/springdb/spring_component.png)
  
### @Component

* 클래스를 Spring Bean으로 만드는 기본 어노테이션

### @Controller

* Spring MVC에서 컨트롤러 역할을 담당하는 Spring Bean으로 만드는 어노테이션
* @RequestMapping은 컨트롤러에서만 사용 가능하다.

### @Service

* 비즈니스 로직을 구현하는 클래스를 Spring Bean으로 만드는 어노테이션

### @Respository

* DAO같은 Persistence Layer에서 DB와 연동되는 클래스를 Spring Bean으로 만드는 어노테이션


# DB 연동하기

## 1) 설정 파일에서 임시 코드 제거

> DB 설정을 제외하는 문법을 `제거`한다.

```
@EnableAutoConfiguration(exclude={DataSourceAutoConfiguration.class})
```

## 2) Mapper 설정
### (1) 첫 번째 방법 - 기존 설정 클래스에 추가

> SpringExampleApplication.java에 아래 코드를 추가한다.

```
package com.hagulu.ex;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.core.io.Resource;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;

@MapperScan(basePackages = "com.hagulu.*")  // mapper scan 추가!!!
@SpringBootApplication
@ComponentScan(basePackages = "com.hagulu")
public class SpringExampleApplication {

	public static void main(String[] args) {
		SpringApplication.run(SpringExampleApplication.class, args);
	}
	
	@Bean
	public SqlSessionFactory sqlSessionFactory(DataSource dataSource) throws Exception {
		SqlSessionFactoryBean sessionFactory = new SqlSessionFactoryBean();
		sessionFactory.setDataSource(dataSource);
			
		Resource[] res = new PathMatchingResourcePatternResolver().getResources("classpath:mappers/*Mapper.xml");
		sessionFactory.setMapperLocations(res);
			
		return sessionFactory.getObject();
	}
}
```

### (2) 두 번째 방법 - 새로운 설정 클래스에 추가 (**권장**)

> DB용 설정 클래스를 따로 만든다.(설정용 패키지를 하나 만듦)

```
package com.hagulu.ex.config;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.Resource;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;

@Configuration
@MapperScan(basePackages="com.hagulu.*")  // interface(mapper)가 있는 패키지 경로
public class DatabaseConfig {
	
	@Bean
	public SqlSessionFactory sqlSessionFactory(DataSource dataSource) throws Exception {
		SqlSessionFactoryBean sessionFactory = new SqlSessionFactoryBean();
		sessionFactory.setDataSource(dataSource);
			
		Resource[] res = new PathMatchingResourcePatternResolver().getResources("classpath:mappers/*Mapper.xml");
		sessionFactory.setMapperLocations(res);
			
		return sessionFactory.getObject();
	}
}

```

### application.properties

```
spring.datasource.driver-class-name=com.mysql.cj.jdbc.Driver
spring.datasource.url=jdbc:mysql://localhost:3306/test?serverTimezone=UTC&characterEncoding=UTF-8
spring.datasource.username=root
spring.datasource.password=비밀번호
```

### 쿼리가 들어갈 mapper 위치

* `src/main/resources` 밑에 `mappers` package를 만들고 `*Mapper.xml`로 지어 사용한다.  
  
![mapper_path](/material/images/marobiana/spring/mapper_path.png)
  

> 쿼리 예제

```
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN"
 "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
 
 <mapper namespace="com.marondal.lecture.dao.ExampleListDAO">
 	<select id="selectExampleList" parameterType="int" resultType="com.marondal.lecture.model.ExampleList">
 		SELECT
 			`id`
 			, `lectureId`
 			, `lectureListId`
 			, `order`
 			, `subject`
 			, `userId`
 			, `author`
 			, `filePath`
 			, `createdAt`
 			, `updatedAt`
 		FROM
 			`exampleList`
 		WHERE
 			`id` = #{id}
 	</select>
 
 </mapper>
```
