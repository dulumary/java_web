# 회원가입과 로그인 구현

### [Marondalgram 프로젝트 기획서](https://ovenapp.io/project/MEoDuSsYW8NUBUR7wH788CN5yck53bCz#IMbQe)

# 1. 회원가입
### package: `com.hagulu.user`

## 회원가입 View 
* Path: `/user/sign_up_view`
* 컨트롤러: `com.hagulu.user.UserContrller`
* View
    Header 영역이 반복되므로  
    레이아웃이라는 하나의 jsp를 Header, View로 분할한다.  

    ### 레이아웃을 위한 공통 jsp
    * header: `src/main/webapp/WEB-INF/jsp/include/header.jsp`

    ### 회원가입 jsp
    * 회원가입: `src/main/webapp/WEB-INF/jsp/user/sign_up.jsp`

* CSS
태그 요소의 스타일을 디테일하게 지정할 때 사용한다.  
`src/main/resources/static/css/style.css`

## 아이디 중복 체크 API
* Path: `/user/is_duplicated_id`
* 컨트롤러: `com.hagulu.user.UserRestContrller`
* BO: `com.hagulu.user.bo.UserBO`
* DAO: `com.hagulu.user.dao.UserDAO`
* Mapper: `resources/mappers/userMapper.xml`

## 회원가입 submit API
* Path: `/user/sign_up`
* 컨트롤러: `com.hagulu.user.UserRestContrller`  - ajax 서브밋
* BO: `com.hagulu.user.bo.UserBO`
* DAO: `com.hagulu.user.dao.UserDAO`
* Mapper: `resources/mappers/userMapper.xml`

### 비밀번호 암호화 유틸 클래스
* EncryptUtils: `com.hagulu.common.EncryptUtils`

# 2. 로그인

## 로그인 View 
* Path: `/user/sign_in_view`
* 컨트롤러: `com.hagulu.user.UserContrller`
* BO: `com.hagulu.user.bo.UserBO`
* DAO: `com.hagulu.user.dao.UserDAO`
* model: `com.hagulu.user.model.User`
* Mapper: `resources/mappers/userMapper.xml`

## Header에 로그인 정보 출력
* jsp: `src/main/webapp/WEB-INF/jsp/include/header.jsp`

## 로그아웃 API
* Path: `/user/sign_out`
* 컨트롤러: `com.hagulu.memo.user.UserContrller`