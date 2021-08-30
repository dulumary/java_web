# 배포하기 

## 방화벽 설정
 
* 서버에서는 일반적으로 특정 port 만 접속 가능하도록 설정해서 보안을 관리 한다. 
* 일반적으로 리눅스 서버 셋팅이 필요 하지만, AWS의 경우 간단하게 웹 콘솔을 통해서 셋팅 가능하다. 
* 톰켓 접속을 위한 8080포트를 열어 준다. 

1) 인스턴스 세부 화면에서 아래 보안을 선택하고 스크롤을 내린다. 
![firewall](firewall_1.jpg)


2) 보안 그룹의 링크를 선택한다. 
![firewall](firewall_2.jpg)


3) Edit inbound rules 버튼을 클릭한다. 
![firewall](firewall_3.jpg)


4) 규칙 추가를 누르고 추가된 입력창에 아래 내용을 선택, 입력 한다. 

* 유형 : 사용자 지정 TCP
  * 포트범위 : 8080
  * 소스 : anywhere ipv4 

![firewall](firewall_4.jpg)


  
5) 모두 작성한 후 규칙 저장을 누른다. 

6) putty 를 통해서 tomcat 서버를 켠다 

```
sudo /usr/local/tomcat/bin/catalina.sh start
```

7) 접속 ip혹은 도메인으로 페이지에 접속해서 설정이 적용 되었는지 확인한다. 

```
http://3.123.212.211:8080
```

### tomcat manager 설정

* tomcat의 관리를 웹페이지를 통해서 하도록 해주는 tomcat 애플리케이션

```
http://3.123.212.211:8080/manager
```
* 위와 같은 주소로 접속이 가능하지만, tomcat 에 추가 설정이 필요하다.

1) tomcat 설치 디렉토리로 이동한다. 

```
cd /usr/local/tomcat
```

2) conf/tomcat-users.xml 파일을 vim을 통해서 열고 아래 내용을 추가 한다.  

* user 태그의  username 과 password 부분은 실제 접속에 사용할 아이디와 비번이다. 


```
<role rolename="manager-gui"/>    
<role rolename="manager-script"/>  
<role rolename="manager-status"/>
<user username="admin" password="admin" roles="manager-gui,manager-script,manager-status"/>

```

3) webapps/manager/META-INF/context.xml 파일을 vim으로 열고 아래 내용을 주석 처리 한다. 
* manager 페이지를 로컬환경에서만 열도록 해주는 설정으로, 이를 해지해서 어디서든 접속할 수 있도록 한다. 

```
<!--
 <Valve className="org.apache.catalina.valves.RemoteAddrValve"
         allow="127\.\d+\.\d+\.\d+|::1|0:0:0:0:0:0:0:1" />

         -->
```

4) tomcat 서버를 껏다 켜고 아래 주소로 접속하여 id password 를 입력하고 설정이 완료된것을 확인한다.

```
sudo bin/catalina.sh stop
sudo bin/catalina.sh start
```

> 접속 주소 예 
```
http://3.123.212.211:8080/manager
```

![manager](manager_1.jpg)


## war export

1) 프로젝트에 build.gradle에 war 빌드 속성을 추가 한다. 
* plugins 항목에 id 'war` 을 추가한다. 
* gradle refresh를 통해서 해당 항목을 적용한다. 

```
plugins {
	...

	id 'war'
}

```

2) 프로젝트이름Applicaton.java 에서 `SpringBootServletInitializer` 클래스를 extends 한다. 
 * spring boot 에서 tomcat sevlet 연동을 위한 설정이다. 

 ```
@SpringBootApplication
public class MarondalgramApplication extends SpringBootServletInitializer {

	public static void main(String[] args) {
		SpringApplication.run(MarondalgramApplication.class, args);
	}
}

 ```

3) 서버 환경에 맞춰서 파일 저장 경로와 데이터베이스 설정을 조정해준다. 

4) 프로젝트에서 오른클릭을 하고 export를 선택한다. 

![war](export_war_1.jpg)

5) war을 검색하고 항목을 선택한다. 

![war](export_war_2.jpg)

6) 해당하는 프로젝트를 선택하고 저장할 경로와 파일이름을 지정한다. 
* 파일이름은 'ROOT.war' 로 만든다. 

![war](export_war_3.jpg)


## 배포

1) tomcat manager page 에서 war 배포가 보이도록 스크롤을 내린다. 

![publish](publish_1.jpg)

2) war 배로 항목에서 저장한 ROOT.war 파일을 선택하고 배포 버튼을 누른다. 

![publish](publish_2.jpg)

3) 배포 시간이 좀 걸리고 에러가 없이 배포가 완료되면 해당 페이지가 새로고침 된다. 

4) 접속가능한 path를 포함하여 배포한 서비스를 확인한다. 