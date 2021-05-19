# 프로그램 설치 

## Yum
* Yum은 Yellow dog Updater, Modified의 약자로 RPM 기반의 시스템을 위한 자동 업데이터 겸 패키지 설치/제거 도구
* 프로그램을 설치하고 관리하는 명령어 기반 도구 

## Java 설치 

```
yum list java*jdk-devel


yum install java-11-openjdk-devel.x86_64
```

## 리눅스 디렉토리 구조 

| 디렉토리 명 |	설명 |
|---|---|
| `home` |	사용자 홈 디렉토리가 생성되는 곳 |
| media	| CD_ROM이나 USB같은 외부 장치를 연결하는 디렉토리 |
| opt |	추가 패키지가 설치되는 디렉토리 |
| dev |	장치파일들이 저장되어 있는 디렉토리 |
| root | root계정의 홈 디렉토리 |
| sys | 리눅스 커널관련 정보가 있는 디렉토리|
| `usr` | 기본 실행파일과 라이브러리 파일, 헤더 파일등의 파일이 저장되어있는 디렉토리 |
| boot | 부팅에 필요한 정보를 가진 파일들이 있는 디렉토리 |
| var |	시스템 운영중에 발생한 데이터와 로그가 저장되는 디렉토리 |
| tmp | 시스템 사용중에 발생한 임시데이터가 저장 (부팅 시 초기화) |
| srv | FTP나 Web등 시스템에서 제공하는 서비스의 데이터가 저장되는 디릭토리 |
| run |	실행중인 서비스와 관련된 파일이 저장되는 디렉토리 |
| proc |	프로세스 정보 등 커널 관련 정보가 저장되는 디렉토리 |
| mnt |	파일 시스템을 임시로 연결하는 디렉토리 |
| `etc` |	리눅스 설정을 위한 각종 파일들을 가지고 있는 디렉토리 |

## tomcat 설치 

* tomcat 은 직접 다운로드 받아서 실행하는 형태로 설치한다. 
* `tomcat 9 download` 로 검색해서 tar.gz 파일의 링크를 복사한다. 

* wget 이라는 명령어를 통해서 파일을 다운로드 한다. 
```
yum install wget
wget https://mirror.navercorp.com/apache/tomcat/tomcat-9/v9.0.45/bin/apache-tomcat-9.0.45.tar.gz 
```

* tar 명령어를 통해서 압출을 푼다 

```
tar -xvf apache-tomcat-9.0.45.tar.gz
```

* 디렉토리 이름을 tomcat으로 변경하고 /usr/local 위치로 이동시킨다. 

```
mv apache-tomcat-9.0.45 tomcat
mv tomcat/ /usr/local/
```

* 톰캣을 위한 방화벽 설정 

```
firewall-cmd --zone=public --permanent --add-port=8080/tcp
firewall-cmd --reload
```

* 포트포워드에 8080 추가 

## mysql 8 설치 

*  최신 버젼 설치 패키지를 내려 받는다. (rpm)

```
yum install https://dev.mysql.com/get/mysql80-community-release-el8-1.noarch.rpm
```

* install 주소는 `mysql 8 yum install` 로 검색하여 최신 버젼 링크 확인

https://dev.mysql.com/downloads/repo/yum/


* mysql server 설치 

```
yum install mysql-community-server
```

* 서버 시작 

```
systemctl start mysqld.service
systemctl enable mysqld.service
```

* mysql 실행 
    * -u : 사용자 id 
    * -p : password 를 통한 인증

```
mysql -u root -p
```

* 최초 비밀번호는 아래 파일에서 cat 명령어를 통해서 확인한다. 

```
cat /var/log/mysqld.log
```

* 최초 접속 후에 비밀번호를 아래 명령어로 셋팅한다. 
* 간단한 비밀번호 사용시에 에러가 발생하므로 복잡한 비밀번호 (대문자, 숫자, 특수문자)로 만든다. 

```
ALTER USER 'root'@'localhost' identified by 'dulumarY!';
```

* 이후 간단한 비밀 번호로 수정을 원하면 아래 명령어를 통해서 비밀번호 검증 레벨을 낮춘다. 
* 첫 비밀번호 셋팅 전까지는 아래 명령어가 사용이 안되므로 일단 복잡한 비밀번호로 셋팅후 다시 바꾸는 과정을 거쳐야 한다. 

```
SET GLOBAL validate_password_policy=LOW;
```

* create database 명령어를 통해서 필요한 database 를 만든다. 

```
CREATE DATABASE testdata;
```

## Jenkins 설치 

* yum jenkins repository 추가 
    * yum repository는 Package 를 모아 놓은 저장소 
    * 기본으로 포함된 저장소가 없을 경우 인터넷에서 다운 받아서 추가해준다. 
* 아래 명령어로 yum jenkins repository 추가 

```
wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
```

* GPG key 등록 
    * GPG key는 yum 통해 다운되는 내용이 해킹등에 의해서 변조 되었는지 검증해주는 기능
* 인터넷에서 위와 같이 yum repository를 추가해서 사용할경우 이에 매칭되는 key도 등록해주어야 한다. 
* 아래 명령어로 jenkins 키 등록

```
rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
```

* 설치 진행 
```
yum install jenkins
```

* Jenkins port 변경
    * 기본 port가 tomcat과 동일한 8080이기 때문에 바꾸어 주어야 한다. 

* 아래 경로의 설정 파일을 수정한다. 

```
vi /etc/sysconfig/jenkins
```

* 설정파일의 vi 검색기능을 통해서 아래 키워드를 검색하여 내용을 수정한다. 

```
JENKINS_PORT="9090"
```

* Jenkins 재시작

```
service jenkins stop
service jenkins start
```

* jenkins 을 위한 방화벽 설정 

```
firewall-cmd --zone=public --permanent --add-port=9090/tcp
firewall-cmd --reload
```

