* 아래와 같이 회원정보가 저장되어 있다. 

```
List<Member> memebers = new ArrayList<>();
		
Member member = new Member();
member.setName("유비");
member.setPhoneNumber("010-1234-5678");
member.setEmail("youbee@gmail.com");
member.setNationality("삼국시대 촉한");
member.setIntroduce("저는 촉의 군주 유비입니다. 삼국통일을 위해 열심히 일하겠습니다.");
memebers.add(member);

member = new Member();
member.setName("관우");
member.setPhoneNumber("010-1234-5678");
member.setEmail("woo@naver.com");
member.setNationality("삼국시대 촉한");
member.setIntroduce("관우에요. 저는 유비형님 보다 나이는 많지만 일단 아우입니다.");
memebers.add(member);

member = new Member();
member.setName("장비");
member.setPhoneNumber("02-111-3333");
member.setNationality("삼국시대 촉한");
member.setEmail("tools@gmail.com");
member.setIntroduce("장비라우");
memebers.add(member);

member = new Member();
member.setName("조조");
member.setPhoneNumber("010-0987-4321");
member.setNationality("삼국시대 위");
member.setEmail("jojo@gmail.com");
member.setIntroduce("이름은 조조 자는 맹덕이라 하오");
memebers.add(member);

member = new Member();
member.setName("주유");
member.setPhoneNumber("010-0000-1111");
member.setNationality("삼국시대 오");
member.setEmail("jooyou@kakao.com");
member.setIntroduce("주유는 주유소에서 ㅋㅋ");
memebers.add(member);

member = new Member();
member.setName("황충");
member.setPhoneNumber("031-432-0000");
member.setNationality("삼국시대 촉한");
member.setEmail("yellowbug@naver.com");
member.setIntroduce("내 수염 좀 멋있는 듯");
memebers.add(member);
```

* 회원 정보를 확인해서 Member Class를 설계하세요. 
> 이름, 전화번호, 국적, 이메일, 자기소개

* 해당 리스트를 컨트롤러에서 Model을 통해서 jsp 에 전달하고, 아래와 같은 화면을 구성하세요. 

* 국적의 `삼국시대` 를 `삼국 - ` 형태로 변경하세요. 
* 이메일 주소의 id 부분을 굵게 표시하세요. 
* 전화번호가 010 으로 시작하지 않으면 `유효하지 않은 전화번호` 라고 표시하세요.
* 자기소개의 내용을 15자까지 표시하세요. 
* 자기소개가 15자가 넘어 갈경우 뒤에 `...` 을 표시하세요. 

> 출력 예시 

![test1](/material/images/dulumary/web/jstl/test04_result.png)

