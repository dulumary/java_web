# 형상 관리
> 소프트웨어의 변경사항을 체계적으로 관리한다.  
> 프로그램을 버전 별로 관리할 수 있어서 롤백하기에 용이하다.  
> 팀 프로젝트에서 공용으로 개발하고, 누가 수정했는지 추적 가능

### 회사에서 자주 쓰는 형상관리 도구
- SVN(Subversion)
- Git

# 1. Github 계정 가입
## GitHub란?
- git 저장소에 올린 소스 코드들을 관리
- 코드에 대한 문서 정리 기능
- 업무(이슈, issue) 관리
- SNS 기능 등 제공

## GitHub 계정 등록하기
[https://github.com/](https://github.com/) 가입하기

# 2. SourceTree 프로그램 다운로드
## SourceTree란?
git 계정과 연결을 통해 소스코드 변경 내용을 내 컴퓨터에 내려받거나 git에 올린다.

# 3. git 용어
|용어|설명|
|----|-----|
|Repository| git 저장소에 저장된 프로젝트 |
|commit| 코드의 변화된 기록 저장(변화된 내용이 내 컴퓨터(Local)에 저장됨) |
|stage| 커밋할 대상의 코드들을 지정하는 곳 |
|push| git 저장소(원격서버)에 코드를 올림|
|pull| git 저장소(원격서버)에 저장된 코드를 내려받음|
|branch| 코드를 독립적으로 개발할 수 있도록 하는 것 <br>예) master, develop, feature 브랜치 |
|merge| 특정 브랜치(변경사항 있는)의 내용을 브랜치에 합치는 것(즉 변경사항 추가) |

# 4. git과 Sourcetree
## 1) 작성한 소스코드를 git 서버에 올리기
### github 사이트
1) Repositories 메뉴 선택 > New
2) Repository name을 정한 후 Create repository
3) 상단에 있는 http://github.com/계정명/servlet_example.git 복사

### Sourcetree 계정 정보 초기화
다른 사람이 사용하던 git 계정을 초기화하고 시작한다.    
- Windows: `C:/Users/사용자/AppData/Local/Atlassian/SourceTree` 에서  
 `password`, `userhosts` 파일 삭제
- Mac: 설정 > 고급 > 호스트명 - 사용자명 제거

### Sourcetree에서 git에 올리기
1) `+` 기호 또는 `File > Clone / New`
2) Create 선택
3) Browse 버튼 > `프로젝트명` 선택 후 완료 버튼  
![path](/material/images/marobiana/servlet/0_git/path.png)
4) git ignore 파일 설정  
- 개인화 파일들을 제거  
- 각 컴퓨터마다 개인 설정이 다르므로 git 서버에 올리지 않는 설정
- `servlet git ignore 설정` 검색
  - [참고 사이트](https://github.com/github/gitignore/blob/master/Java.gitignore)
  - 위 코드를 복사해서 `.gitignore` 파일에 붙이고 저장한다.
    - 소스트리에 보이는 .gitignore 파일을 더블클릭
    - 또는 컴퓨터의 폴더 경로로 직접 들어가서 열기
    - 또는 아래 그림 참조  
      ![gitignore](/material/images/marobiana/servlet/0_git/gitignore.png)
5) commit
  - stage에 모두 올리기
  - 커밋 메시지를 쓴 후 Commit
  - **내 컴퓨터(Local)**에서 커밋한 코드의 버전관리가 되는 상태이다.
6) Remote 서버(원격 서버)와 연결
  - `Remote` 클릭 > 창이 뜨면 Settings 클릭
  - Add > remote name과 URL Path 설정
    - remote name: 아무 이름으로 정해도 상관없는데 일반적으로 origin을 사용하는 편
    - URL Path: github 사이트에서 레파지토리 만든 후 얻어진 .git 주소  
    ![remote](/material/images/marobiana/servlet/0_git/remote.png)
7) 로컬에 있는 코드를 원격 서버에 push
  - `Push` 버튼을 누르고 > push 체크  
    로컬에 있는 코드가 **원격 git 서버**에 올라간다.
  
## 2) git 서버에 있는 소스코드를 내려받기(clone - 복사 해오기)
1) `+` 기호 또는 `File > Clone / New`
2) Clone 선택
3) Source Path/URL 에 github 사이트에서 레파지토리 만든 후 얻어진 .git 주소를 넣는다.  
![clone](/material/images/marobiana/servlet/0_git/clone.png)