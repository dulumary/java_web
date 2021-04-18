# 형상 관리
  
# 1. 소스코드를 Git 서버에 올리기

## Github 사이트에서 Repository 만들기
  
### 1) Repositories 메뉴 선택 > New

### 2) Repository name을 정한 후 Create repository

* Repository 이름은 URL로 구성되므로 소문자와 언더바(_)로 구성한다.

### 3) 상단에 있는 http://github.com/계정명/servlet_example.git 복사
  
## Sourcetree 계정 정보 초기화

다른 사람이 사용하던 git 계정을 초기화하고 시작한다.
* Windows: C:/Users/사용자/AppData/Local/Atlassian/SourceTree 에서
password, userhosts 파일 삭제
* Mac: 설정 > 고급 > 호스트명 - 사용자명 제거
  
## Sourcetree에서 git에 올리기

### 1) + 기호 또는 File > Clone / New
### 2) Create 선택
### 3) Browse 버튼 > 프로젝트명 선택 후 완료 버튼

![project](/material/images/marobiana/spring/projectname.png)
  
### 4) git ignore 파일 설정

* 각 컴퓨터마다 개인 설정이 다르므로 git 서버에 올리지 않는 설정(개인화 파일 제거)
* `springboot ignore` 검색 (참고: 서블릿 프로젝트의 ignore 설정과 다르다)
* [ignore 설정 참고](https://github.com/spring-projects/spring-boot/blob/master/.gitignore) -> 코드를 복사해서 .gitignore 파일에 붙이고 저장
  
### 5) commit

* stage에 모두 올리기
* 커밋 메시지를 쓴 후 Commit
* 내 컴퓨터(Local)에서 커밋한 코드의 버전관리가 되는 상태이다.
  
### 6) Remote 서버(원격 서버)와 연결

* Remote 클릭 > 창이 뜨면 Settings 클릭
* Add > remote name과 URL Path 설정
* remote name: 아무 이름으로 정해도 상관없는데 일반적으로 origin을 사용하는 편
* URL Path: github 사이트에서 레파지토리 만든 후 얻어진 .git 주소

### 7) 로컬에 있는 코드를 원격 서버에 push
* Push 버튼을 누르고 > push 체크  
로컬에 있는 코드가 원격 git 서버에 올라간다.

# 2. Git 서버에 있는 코드를 내 컴퓨터에 Clone(복사) 하기

## Sourcetree 프로그램
### 1) `+` 기호 또는 `File > Clone / New`
### 2) Clone 선택
### 3) Source Path/URL 에 github 사이트에서 레파지토리 만든 후 얻어진 .git 주소를 넣는다.  

![git]](/material/images/marobiana/spring/gitaddress.png)

### 주의할 점

위 그림에서 두번째 폴더 경로는(클론 되는 위치) **이클립스의 workspace의 경로와 겹치지 않도록 한다.**
  
![clone](/material/images/marobiana/servlet/0_git/clone.png)


## STS IDE 프로그램에서 프로젝트 열기
* 만약 소스코드가 있는 컴퓨터에서 클론을 테스트할 때는 새로운 STS에 하는 것을 추천
* STS를 열고 워크스페이스 폴더 위치를 잡아준다.
* import project 선택 또는 File > import  후 `Existing Gradle Project` 선택  
![importproject](/material/images/marobiana/spring/import_project.png)
* 클론 받은 위치 폴더명 선택 후 Finish