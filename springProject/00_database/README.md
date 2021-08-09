# DB 연동하기

## 1) 설정 파일에서 임시 코드 제거

> DB 설정을 제외하는 문법을 `제거`한다.
```
@EnableAutoConfiguration(exclude={DataSourceAutoConfiguration.class})
```

## 2) Mapper 설정

### 설정 클래스 추가

> DB용 설정 클래스를 따로 만든다.(설정용 패키지를 하나 만듦)
```
package com.marobiana.ex.config;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.Resource;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;

@Configuration
@MapperScan(basePackages="com.marobiana.*")  // interface(mapper)가 있는 패키지 경로
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

## DB 정보 프로퍼티 추가

SpringBoot에서 `.properties` 파일 또는 `.yml` 파일을 읽어서 설정 정보들을 읽는다.  
yml로 변화되는 추세이므로 `application.properties`를 **삭제**하고 `application.yml`로 추가한다.

### application.properties
```
spring.datasource.driver-class-name=com.mysql.cj.jdbc.Driver
spring.datasource.url=jdbc:mysql://localhost:3306/test?serverTimezone=UTC&characterEncoding=UTF-8
spring.datasource.username=root
spring.datasource.password=비밀번호
```

### application.yml
```
spring:
  datasource:
    driver-class-name: com.mysql.cj.jdbc.Driver
    url: jdbc:mysql://localhost:3306/test?serverTimezone=UTC&characterEncoding=UTF-8
    username: root
    password: 비밀번호
```

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


## 쿼리 Mapper

### 쿼리가 들어갈 mapper 위치
- `src/main/resources` 밑에 `mappers` package를 만들고 `*Mapper.xml`로 지어 사용한다.  
  
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
