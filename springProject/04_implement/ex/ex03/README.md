# 메모 게시판 구현

### [MEMO 프로젝트 기획서](https://ovenapp.io/project/3L1ftoR8I88YuaglCuhxWKaCsJVPvkh5#teOop)

# 1. 게시판 목록
### package: `com.hagulu.memo.post`

## 게시판 목록 View 
* Path: `/post/post_list_view`
* 컨트롤러: `com.hagulu.memo.post.PostContrller`
* BO: `com.hagulu.memo.post.PostBO`
* DAO: `com.hagulu.memo.post.PostDAO`
* model: `com.hagulu.memo.model.Post`
* Mapper: `resources/mappers/postMapper.xml`
* jsp: `src/main/webapp/WEB-INF/jsp/post/post_list.jsp`

# 2. 글쓰기 화면

## 글쓰기 View
* Path: `/post/post_create_view`
* 컨트롤러: `com.hagulu.memo.post.PostContrller`
* jsp: `src/main/webapp/WEB-INF/jsp/post/post_create.jsp`

## 글쓰기 Submit API

* Path: `/post/create`
* 컨트롤러: `com.hagulu.memo.post.PostRestContrller` 
* BO: `com.hagulu.memo.post.PostBO`
* DAO: `com.hagulu.memo.post.PostDAO`
* Mapper: `resources/mappers/postMapper.xml`

### 파일 업로드 관련 코드
* 파일 업로드 Service: `com.hagulu.memo.common.FileManagerService`
* 서블릿 설정 클래스(파일 경로 매핑 설정): `com.hagulu.memo.config.WebMvcConfig`

# 3. 글 상세/수정 화면

## 글 상세/수정 View
* Path: `/post/post_detail_view`
* 컨트롤러: `com.hagulu.memo.post.PostContrller`
  * 파라미터: int postId
* BO: `com.hagulu.memo.post.PostBO`
* DAO: `com.hagulu.memo.post.PostDAO`
* Mapper: `resources/mappers/postMapper.xml`
* jsp: `src/main/webapp/WEB-INF/jsp/post/post_detail.jsp`

### 글 수정시 파일 삭제 메소드 추가
* 파일 업로드 Service: `com.hagulu.memo.common.FileManagerService`

## 삭제 API
* Path: `/post/delete`
* 컨트롤러: `com.hagulu.memo.post.PostRestContrller` 
* BO: `com.hagulu.memo.post.PostBO`
* DAO: `com.hagulu.memo.post.PostDAO`
* Mapper: `resources/mappers/postMapper.xml`