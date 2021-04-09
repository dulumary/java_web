> 아래 쿼리를 통해서 즐겨찾기 테이블을 생성하고 값을 넣으세요. 

```
CREATE TABLE `favorite` (
    `id` int NOT NULL AUTO_INCREMENT primary key, 
    `name` varchar(16) NOT NULL,
    `url` varchar(512) NOT NULL,
    `createdAt` timestamp DEFAULT CURRENT_TIMESTAMP,
    `updatedAt` timestamp DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `favorite` (`name`, `url`, `createdAt`, `updatedAt`) 
VALUES 
('마론달', 'http://marondal.com', now(), now()),
('구글', 'https://google.com', now(), now()),
('네이버', 'https://naver.com', now(), now()),
('다음', 'https://daum.net', now(), now());
```

## 1. 목록 출력하기

* jsp를 이용해서 즐겨찾기 table 태그로 출력하세요. 
* id 를 기준으로 **내림차순**으로 출력하세요. 
* 출력 컬럼은 name, url 입니다.
* url 내용을 a 태그를 이용해서 연결이 되도록 하세요.

> 화면 예시
  
![test02](/material/images/dulumary/web/servletdb/test02_result.png)

## 2. 입력하기 

* 새로운 jsp에서 input 태그로 데이터를 입력 받고, form 태그와 servlet을 이용해서 insert 하세요. 
* insert 후 위에서 만든 목록 출력 페이지로 리다이렉트 하세요. 

> 화면 예시
  
![test02](/material/images/dulumary/web/servletdb/test02_input.png)

## 3. 삭제 하기 

* 출력하기 페이지에서 각 행에 삭제 링크를 추가하세요. 
* 삭제 링크 선택시 해당 행을 삭제하고, 출력 페이지로 리다이렉트 하세요.