# Windows 환경 세팅

## MySQL 다운로드
* 구글에서 `MySQL 다운로드 검색` > MYSQL Community Downloads
  * [다운로드 링크](https://dev.mysql.com/downloads/)
* `MySQL Installer for Windows` > 용량이 큰 download 선택 > No thanks를 눌러 다운로드 진행

## MySQL 설치
- Developer Default > 쭉쭉쭉 Next 및 Execute   
![비번설정](/material/images/marobiana/db/rootpw.png)  
비밀번호 까먹지 않도록 주의!!!  
- 쭉쭉쭉 Next  
![비번설정](/material/images/marobiana/db/pwcheck.png)  
비밀번호 일치하는지 확인해본다.
- 쭉쭉쭉 Next
- MySQL Workbench 라는 프로그램이 실행된다.  
![workbench](/material/images/marobiana/db/workbench.png)  

## 설치가 완료되면

**내 컴퓨터가 DB 서버가 된다.(로컬 서버)**  
`localhost:3306` 서버에 MySQL이 떠있는 것이다.

## MySQL Workbench 프로그램
- MySQL DB 저장소를 접근할 수 있는 **클라이언트 프로그램**
- 쿼리(query)를 작성하여 데이터를 조회할 수 있고, 데이터를 보기 좋다.  
![query](/material/images/marobiana/db/query.png) 

# MAC 환경에서 세팅
## MySQL 설치 방법
### [MySQL 설치 블로그](https://daimhada.tistory.com/121)

## DB 클라이언트 프로그램
둘 중에 편해보이는 프로그램을 선택해서 사용한다.

### 1. [DB 클라이언트 프로그램 - 크롬 확장 프로그램](https://chrome.google.com/webstore/detail/chrome-mysql-admin/ndgnpnpakfcdjmpgmcaknimfgcldechn)
### 2. [DB 클라이언트 프로그램 - Sequel Pro](http://www.sequelpro.com/)