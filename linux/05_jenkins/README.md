# Jenkins를 통한 배포

## Jenkins 최초 실행

* 최초로 접속하면 기본 설정 화면이 나온다 

### 인증 

* 서버에서 아래 경로의 내용을 출력해서 복사하고 셋팅 페이지에 입력한다. 
```
cat /var/lib/jenkins/secrets/initialAdminPassword
```

* 기본 설정으로 기본 플러그인을 설치 한다.

### 추가 plugin 설치 

* jenkins 관리 -> 플러그인 관리 -> 설치 가능 에서 Deploy to container 설치 


### item 설정

* new item -> free style project 선택
* github project 체크 및 주소 추가 
* 소스코드 관리 git 선택후 주소 추가 
* Credentials -> ADD 를 통해서 userid password 추가 및 선택
* Build -> add build step -> invoke gradle script
    * user gradle wrapper -> task 에 `clean bulild` 추가 
* 빌드후 조치 추가 
    * deploy war/ear to a container
    * WAR/EAR files - `**/*.war`
    * ContextPath - `example`
    * Containers -> tomcat9.X 선택

### tomcat manager 설정

* tomcat 배포를 간단하게 해주는 툴
* 아래 명령어로 tomcat manager 설정 파일 열기

```
vi /usr/local/tomcat/conf/tomcat-users.xml
```

* 해당 설정 파일에 아래 내용 추가 
    * 가장 아랫줄 username 과 password 에 각각 사용자 계정 설정

```
<role rolename="manager-gui"/>  
<role rolename="manager-script"/>   
<role rolename="manager-status"/>     
<user username="admin" password="admin" roles="manager-gui,manager-script,manager-status"/> 
```   

* 아래 명령어로 톰캣 재시작 

```
/usr/local/tomcat/bin/catalina.sh stop
/usr/local/tomcat/bin/catalina.sh start
```

* 아래 주소로 접속해서 만든 계정으로 로그인 되는지 확인

```
http://127.0.0.1:8000/manager
```

* 403 Access Denied 에러가 날경우 아래 설정 파일을 열어 아래와 같이 value 내용을 주석 처리 한다. 

```
vi /usr/local/tomcat/webapps/manager/META-INF/context.xml
```

```
<Context antiResourceLocking="false" privileged="true" >
  <CookieProcessor className="org.apache.tomcat.util.http.Rfc6265CookieProcessor"
                   sameSiteCookies="strict" />
<!--  <Valve className="org.apache.catalina.valves.RemoteAddrValve"
         allow="127\.\d+\.\d+\.\d+|::1|0:0:0:0:0:0:0:1" /> -->
  <Manager sessionAttributeValueClassNameFilter="java\.lang\.(?:Boolean|Integer|Long|Number|String)|org\.apache\.catalina\.filters\.CsrfPreventionFilter\$LruCache(?:\$1)?|java\.util\.(?:Linked)?HashMap"/>
</Context>
```

* 다시 jenkins 로 돌아 와서 방금 만든 tomcat manager 정보를 Credentials로  추가하고 설정한다. 
* 톰켓의 주소를 지정해 준다. 

 
### 프로젝트 war 빌드 설정

* 빌드후 해당 프로젝트를 배포하기 위한 파일인 war가 만들어 지도록 설정해준다. 
* build.gradle 파일에 아래 내용들을 추가한다. 

* plugins 에 `war` 추가 
```
plugins {
	id 'org.springframework.boot' version '2.4.4'
	id 'io.spring.dependency-management' version '1.0.11.RELEASE'
	id 'java'
	id 'war'
}
```

* war 관련 설정 
    * archiveBaseName - war 이름 지정
    * archiveVersion - 배포 버젼 설정 

```
bootWar{                        
	archiveBaseName="springExample"
	archiveVersion="0.1.0"
}
```

* Application Class 에 SpringBootServletInitializer 상속 추가 
* 기본 tomcat 과 spring boot 연동을 도와주는 클래스이다 

public class SpringExampleApplication extends SpringBootServletInitializer {

	public static void main(String[] args) {
		SpringApplication.run(SpringExampleApplication.class, args);
	}
}

* 수정 사항을 저장하고 github에 push 한다. 
* 왼쪽 Build Now 를 통해서 빌드를 시작한다. 
* 빌드가 수행이 되면 왼쪽 아래에 새로운 build history 가 나타난다. 
* 진행중인 빌드를 선택하여 빌드 페이지로 이동한다. 
* 왼쪽 Console Output 메뉴를 누르면 빌드 과정을 로그를 통해서 확인 할수 있다. 
* 빌드중 에러가 발생했을때 이를 확인한다. 


