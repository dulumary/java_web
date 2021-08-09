# 페이지 권한 구현

### [MEMO 프로젝트 기획서](https://ovenapp.io/project/3L1ftoR8I88YuaglCuhxWKaCsJVPvkh5#teOop)

로그인, 비로그인 상태에 따라 페이지 접근의 권한을 설정한다.  

|화면|URL path|페이지 접근 가능 상태|
|---|---|---|
|게시판 목록|`/post/post_list_view`|로그인|
|글쓰기|`/post/post_create_view`|로그인|
|글 내용 상세|`/post/post_detail_view`|로그인|
|로그인|`/user/sign_in_view`|비로그인|
|회원가입|`/user/sign_up_view`|비로그인|
|로그아웃|`/user/sign_out`||

```
Path가 '/post' 이면 로그인된 상태일 때만 접근 가능하다.
```

# 1. 인터셉터

### package: `com.hagulu.memo.interceptor`

## 인터셉터 추가
- `com.hagulu.memo.interceptor.PermissionInterceptor`
- `com.hagulu.memo.config.WebMvcConfig`