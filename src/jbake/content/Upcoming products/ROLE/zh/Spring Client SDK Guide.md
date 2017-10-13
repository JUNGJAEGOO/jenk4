title=About
date=2013-09-24
type=page
status=published
big=
summary=
~~~~~~
## Upcoming Products > ROLE > Spring Client SDK Developer's Guide

> ※ 본 문서는 alpha 개발 단계의 문서입니다.
> 사용에 관심이 있으신 분은 **support@cloud.toast.com**으로 문의해 주시기 바랍니다.

<br/>

> Role 상품을 이용하여 권한을 체크하기 위해서는
> RESTFUL API 를 호출하거나, Client SDK 를 이용하여야 한다.
> Spring Framework 을 사용하는 경우, 좀더 편하게 JAVA Client SDK 를 사용할 수 있다.

## Spring Client SDK 란?

Spring Framework 을 이용한 MVC 프로젝트에서
JAVA Client SDK 를 좀 더 편하게 사용하기 위한 @Annotation 및 Interceptor 를 제공한다.
RESTFUL API 에 대한 접근 제어를 한다면 Spring Client SDK 를 사용 함으로서 손쉽게 접근 권한을 검사할 수 있다.
Spring Client SDK 에서 제공하는 @Annotation 과 @RequestMapping 같이 사용하게 되며,
@RequestMapping 의 value 가 Resource Path, method 가 Operation ID 로 각각 mapping 되게 되며,
@Annotation 의 설정에 따라 User ID 와 Scope ID 를 Path Variable, Query Parameter, Header 의 특정 값으로 mapping 할 수 있다.

## AppKey & SecretKey

RESTFUL API 와 Client SDK 를 사용하려면 AppKey 와 Secret Key 가 필요하다.
[CONSOLE] 의 좌측 상단에서 발급된 Key 정보를 확인 할 수 있다.

![[그림 1] AppKey & SecretKey 확인](http://static.toastoven.net/prod_role/role_17.png)
<center>[그림 1] AppKey & SecretKey 확인</center>

## Maven 을 이용한 JAVA Client SDK For Spring 사용

JAVA Client SDK For Spring 을 사용하기 위해선 pom.xml 에 maven repository 및 depencency 설정이 필요하다.

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
		<artifactId>role-client-spring</artifactId>
		<version>1.1.4</version>
	</dependency>
</dependencies>
```

## Spring Configuration

[applicationContext.xml] 에 TCRoleClientFactory 를 등록한다.

```xml
<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xsi:schemaLocation="http://www.springframework.org/schema/beans
                        http://www.springframework.org/schema/beans/spring-beans-3.0.xsd">
	<bean id="client" class="com.toast.cloud.tcrole.sdk.TCRoleClientFactory"
		factory-method="getClient">
		<!-- TOASTCloud console 에서 발급 받은 AppKey -->
		<constructor-arg name="appKey" value="CIxy8T4QdkxoH5wh" />
		<!-- TOASTCloud console 에서 발급 받은 SecretKey -->
		<constructor-arg name="secretKey" value="bX67pDaw" />
	</bean>
</beans>
```

[mvc-config.xml] 에 TCRoleControllerInterceptor 를 등록한다.

```xml
<?xml version="1.0" encoding="UTF-8" ?>
<beans
	xmlns="http://www.springframework.org/schema/beans"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xmlns:mvc="http://www.springframework.org/schema/mvc"
	xsi:schemaLocation="
		http://www.springframework.org/schema/mvc
		http://www.springframework.org/schema/mvc/spring-mvc-3.1.xsd
		http://www.springframework.org/schema/beans
		http://www.springframework.org/schema/beans/spring-beans-3.1.xsd">
	<mvc:interceptors>
		<bean class="com.toast.cloud.tcrole.sdk.TCRoleControllerInterceptor" />
	</mvc:interceptors>
</beans>
```

## @Annotation 을 이용한 권한 체크

Spring MVC 프로젝트의 @RequestMapping 의 권한을 체크 하기 위해서는 아래 예제와 같이 @Authorization 을 사용한다.
만약 권한 체크에 실패한다면, InvalidAuthInfoException 혹은 UnauthorizedException 을 throw 하게 된다.
Spring Framework 의 @ControllerAdvice 의 ExceptionHandler 를 등록하여 적절한 에러 체크를 구현해야 한다.

```java
@Controller
public Example {
    /**
     * Path         : '/secure'
     * User ID      : value of userId
     * Operation ID : 'GET'
     */
    @Authorization(userId = @AuthParam(type = AuthParamType.QUERY_PARAM, value = "userId"))
    @RequestMapping(value = "/secure", method = RequestMethod.GET)
    public String printSecureInformation(@RequestParam("userId") String userId) {
          return "This is a secure information. !!";
    }
}
```

|Annotation|	Parent Annotation|	Key|	Value|	Description|	Required|
|---|---|---|---|---|---|
|@Authorization|	없음|	userId|	@AuthParam|	권한 체크를 할 User ID를 정의한다.|	Yes|
|-|-|scopeId|	@AuthParam|	권한 체크를 할 Scope ID를 정의한다. 생략 시 기본값 ALL|	No|
|@AuthParam|	@Authorization|	type|	AuthParamType|	파라미터의 타입을 정의한다.|	Yes|
|-|-|value|	String|	파라미터의 타입의 값을 정의한다.|	No|

|Enum|	Value|	Description|
|---|---|---|
|AuthParamType|	AuthParamType.STATIC|	@AuthParam 의 value 를 직접 사용한다.|
|-|AuthParamType.PATH_VARIABLE|	@AuthParam 의 value 를 Path Variable 의 키로 사용하여 값을 얻어온다.|
|-|AuthParamType.HEADER_PARAM|	@AuthParam 의 value 를 Header 의 키로 사용하여 값을 얻어온다.|
|-|AuthParamType.QUERY_PARAM|	@AuthParam 의 value 를 Query Parameter 의 키로 사용하여 값을 얻어온다.|
