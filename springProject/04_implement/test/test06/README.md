# 댓글 구현

### [Marondalgram 프로젝트 기획서](https://ovenapp.io/project/MEoDuSsYW8NUBUR7wH788CN5yck53bCz#IMbQe)

> 기획서를 보면서 아래 순서로 구현하세요.  

# 1. 게시글에 대한 댓글 작성하기

글에 대한 댓글이 작성될 수 있도록 구현하세요.

* Javascript 코드로 데이터를 보내기
  * 어떤 글에 대한 댓글인지 알아야 하므로 댓글 게시 버튼에 postId를 저장해 놓는다.
* Controller, BO, DAO, Mapper 구현

# 2. 댓글 읽어오기

## 1) DB 연동

타임라인의 카드 마다 댓글 영역에 DB에 저장된 실제 데이터들이 들어가도록  
BO, DAO, Mapper 등을 구현하세요.   

참고: 댓글은 게시글 마다 존재하므로, **Post 객체 안에 들어가도록 설계**한다.  
단, Post 객체는 DB의 엔티티 객체이므로 `View에서 사용할 별도의 객체(Content)로 만들어 설계하고 교체`한다.  
(Timeline 컨트롤러, timeline.jsp에도 수정 필요)

* 댓글이 있는 경우에만 댓글 영역을 노출하세요.

## 2) 마크업 된 화면에 실제 데이터 구성하기

DB에서 가져온 데이터로 화면을 구성하세요.  

* 각 글에 대한 댓글들을 JSTL을 사용해서 반복문으로 구성하기
* 댓글쓴이가 로그인 된 사람과 일치하는 경우 x 아이콘 노출

# 3. 자신의 댓글 삭제

댓글을 삭제하는 API를 구현하세요.
- 어떤 댓글이 삭제되는 것인지 알아야 하므로 a 태그에 댓글의 id를 저장해 놓는다.