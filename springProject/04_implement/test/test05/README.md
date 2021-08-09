# 타임라인 구현

### [Marondalgram 프로젝트 기획서](https://ovenapp.io/project/MEoDuSsYW8NUBUR7wH788CN5yck53bCz#IMbQe)

> 기획서를 보면서 아래 순서로 구현하세요.  

# 1. 타임라인에서 글쓰기

## 1) View 화면에서 Script 구현 - 데이터 넘기기

* `게시` 버튼을 누르면 서버에 데이터를 넘기도록 스크립트 구성

## 파일 업로드를 위한 jQuery 코드

### 파일 업로드 동작
- 이미지 태그를 감싸고 있는 a 태그를 클릭하면, input file 태그를 클릭한 것과 같은 처리를 한다. (jQuery 문법 검색해 볼 것)

### 파일 업로드 후 유효성 확인 및 업로드 된 파일 이름을 div에 노출

* input file 태그에 파일이 추가된 것을 감지하는 이벤트 
```
  $('#file').on('change', function(e){
      var name = e.target.files[0].name;  // 업로드 된 파일 이름

      // TODO 파일 확장자 유효성 체크
      // TODO div id="fileName" 영역에 업로드된 파일 이름을 넣는다.
  });
```

### Submit
* `게시` 버튼을 클릭하면 AJAX를 이용하여 내용과 업로드 된 파일을 서버에 넘긴다.

## 2) 글쓰기 서버 - 데이터 처리

* Post를 저장할 수 있도록 BO, DAO, Mapper 등을 구현한다.
* 파일 업로드를 위해 **FileManagerService 클래스**와  
 실제 파일과 서버의 이미지 주소를 매핑하기 위한 **WebMvcConfig 클래스**를 구성한다.
* textarea에 저장된 내용에 **줄바꿈**이 적용될 수 있도록 구현한다.