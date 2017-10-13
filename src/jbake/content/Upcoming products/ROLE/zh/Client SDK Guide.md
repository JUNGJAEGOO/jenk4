title=About
date=2013-09-24
type=page
status=published
big=
summary=
~~~~~~
## Upcoming Products > ROLE > Client SDK Developer's Guide

> ※ 본 문서는 alpha 개발 단계의 문서입니다.
> 사용에 관심이 있으신 분은 **support@cloud.toast.com**으로 문의해 주시기 바랍니다.

<br/>

> Role 상품을 이용하여 권한을 체크하기 위해서는
> RESTFUL API 를 호출하거나, Client SDK 를 이용하여야 한다.

## Client SDK 란?

RESTFUL API를 손쉽게 호출하기 위한 Role 전용 Client SDK 이다.
자체 Cache 기능을 가지고 있기 때문에, 좀더 효율적으로 Role 상품을 이용 할 수 있다.
현재는 JAVA 언어에 대해서만 지원을 하고 있다.

## AppKey & SecretKey

RESTFUL API 와 Client SDK 를 사용하려면 AppKey 와 Secret Key 가 필요하다.
[CONSOLE] 의 좌측 상단에서 발급된 Key 정보를 확인 할 수 있다.

![[그림 1] AppKey & SecretKey 확인](http://static.toastoven.net/prod_role/role_17.png)
<center>[그림 1] AppKey & SecretKey 확인</center>

## Maven 을 이용한 JAVA Client SDK 사용

JAVA Client SDK 를 사용하기 위해선 pom.xml 에 maven repository 및 depencency 설정이 필요하다.

**[Maven Repository]**

```xml
<repositories>
	<repository>
		<id>com.toast.cloud</id>
		<name>TOAST Cloud Repository</name>
		<url>http://nexus.nhnent.com/content/repositories/releases</url>
	</repository>
</repositories>
```

**[Maven Dependency]**

```xml
<dependencies>
	<dependency>
		<groupId>com.toast.cloud</groupId>
		<artifactId>role-client</artifactId>
		<version>1.1.4</version>
	</dependency>
</dependencies>
```

## JAVA Client SDK 사용법

JAVA Client SDK 를 사용하기 위해선 먼저 TCRoleClientFactory 객체를 이용하여 TCRoleClient 객체의 instance 를 생성해야 한다.
TCRoleClient 객체를 생성하였으면, 해당 객체에서 제공하는 method 를 호출하여 여러 작업들을 처리하면 된다.
TCRoleClient 객체가 제공하는 상세한 API 는 다음 링크에서 확인 할 수 있다.
https://api-role.cloud.toast.com//doc/index.html

```java
// TCRoleClient 객체를 생성하는 올바른 방법
TCRoleClient client = TCRoleClientFactory.getClient("TEST_APPKEY", "TEST_SECRETKEY");

// 아래처럼 직접 생성자를 호출하면 안된다.
TCRoleClient client = new TCRoleClient("TEST_APPKEY", "TEST_SECRETKEY");
```

> TCRoleClient 의 생성자를 직접 호출하지 않도록 주의한다.

## Client SDK Cache

Client SDK 에서는 아래 3가지 경우에 대해서 각각 Client 단의 Cache 를 사용한다.

- Resource ID 를 이용한 권한 체크
- Resource Path 를 이용한 권한 체크
- Resource Hierarchy 조회

LRU 로 관리를 하고 있으며, Cache 의 기본값은 300초의 TTL (Time To Live) 과 1,000,000 개 Size 이다.
해당 값을 수정 하려면 [CONSOLE] 에 접속하여 변경할 수 있다.
[CONSOLE] 에서 변경한 설정은 변경 즉시 반영되며, 변경되는 즉시 기존 Cache 는 모두 삭제된다.

![[그림 2] Client SDK Cache 설정](http://static.toastoven.net/prod_role/role_27.png)
<center>[그림 2] Client SDK Cache 설정</center>

## Transaction 지원

ROLE 의 데이터를 Atomic 하게 추가 / 변경 / 삭제 하고 싶을 경우에는 TCRoleClient 객체의 beginTransaction() 을 호출하여 TCRole Session 객체를 얻어와 사용하면된다.

예를 들어, 아래와 같이 여러개의 Role 동시에 등록할 경우 중간에 에러 발생 시 몇개는 등록이 되고, 몇개는 등록이 안될 수 있다.

```java
TCRoleClient client = TCRoleClientFactory.getClient("TEST_APPKEY", "TEST_SECRETKEY");

try {
	client.createUser("U1", "Example User 1);

	client.assignRoleToUser("U1", "ALL", "R1");
	// 만약 여기서 Exception 이 발생한다면
	// U1 은 R1 권한만 가지고, R2 권한은 부여되지 않는다.
	client.assignRoleToUser("U1", "ALL", "R2");
} catch (Exception e) {
	// 에러시 자체 Rollback 로직을 구현해야 한다.
	client.removeUser("U1");
}
```

TCRoleSession 객체를 사용한다면, 위와 같은 상황에서 부분 실패를 없앨 수 있다.

```java
TCRoleClient client = TCRoleClientFactory.getClient("TEST_APPKEY", "TEST_SECRETKEY");
TCRoleSession session = client.beginTransaction();

try {
	session.createUser("U1", "Example User 1);

	session.assignRoleToUser("U1", "ALL", "R1");
	// 만약 여기서 Exception 이 발생한다 하여도, 부분 실패는 발생하지 않는다.
	session.assignRoleToUser("U1", "ALL", "R2");

	// 에러가 발생하지 않았다면, 서버에 변경사항을 반영한다.
	session.commit();
} catch (Exception e) {
	// 에러 시, rollback 한다.
	session.rollback();
}
```

TCRoleSession 객체를 사용 시 commit() method 를 호출하기 전까지는 어떠한 추가 / 수정 / 변경사항도 서버에 반영되지 않기 때문에, commit() 하기 전 변경한 데이터를 읽지 않도록 주의해야한다.

TCRoleSession 객체를 commit() 하거나 rollback() 한 다음 다시 재사용 할 수 있다.
