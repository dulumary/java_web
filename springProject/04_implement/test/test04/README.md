# 타임라인 구현

### [Marondalgram 프로젝트 기획서](https://ovenapp.io/project/MEoDuSsYW8NUBUR7wH788CN5yck53bCz#IMbQe)

> 기획서를 보면서 아래 순서로 구현하세요.

# 1. 타임라인에 글 구성하기

## 1) DB 연동

타임라인의 카드 영역에 DB에 저장된 실제 데이터들을 노출할 수 있도록  
BO, DAO, Mapper 등을 구현하세요.   

## 2) 마크업 된 화면에 실제 데이터 구성하기

타임라인 화면에 DB에서 가져온 Post의 List로 화면을 구성하세요.  

* 카드 목록을 JSTL을 사용해서 반복문으로 구성하기
* 카드 이미지 데이터가 있는 경우에만 image 태그 노출하기
* 글 영역에 유저명과 글 내용 구성
