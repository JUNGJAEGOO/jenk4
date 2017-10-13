title=About
date=2013-09-24
type=page
status=published
big=
summary=
~~~~~~
## Upcoming Products > ROLE > Overview 

> ※ 본 문서는 alpha 개발 단계의 문서입니다.
> 사용에 관심이 있으신 분은 **support@cloud.toast.com**으로 문의해 주시기 바랍니다.

## Role 상품은?

Role Based Access Control 을 할수 있게 API 및 UI를 제공하는 TOAST Cloud 상품이다.  
Role 을 정의하고 Role 에 따라 접근할 수 있는 Resource 를 설정한 후, User 에게 Role 을 할당하면, 손쉽게 User 가 Resource 에 접근 할 수 있는지를 검사할 수 있다.  
Resource 를 계층적으로 저장하기 때문에, Role 에 따라 접근 가능한 메뉴를 손쉽게 구할 수 있다.  

## 전체 구조

![[그림 1] RBAC 시스템](http://static.toastoven.net/prod_role/role_01.png)
<center>[그림 1] RBAC 시스템</center>

![[그림 2] 시스템 구성도](http://static.toastoven.net/prod_role/role_02.png)
<center>[그림 2] 시스템 구성도</center>

## 특장점

역할 기반의 접근 제어를 손쉽게 사용할 수 있다.  
역할 상속 기능을 제공한다.  
RESTFUL API 의 Path Variable 이 포함된 Resource 를 지원한다.  
역할에 따른 메뉴를 손쉽게 구성 할 수 있다.  

## 주요기능

역할 기반의 권한 체크  
역할에 따른 메뉴 구성  

## 서비스 용어

|용어|	설명|
|---|---|
|User|	권한을 가지는 주체|
|Role|	역할|
|Scope|	역할의 범위|
|Operation|	Resource 에 행할 수 있는 행위|
|Resource|	역할이 접근할 수 있는 모든 대상|
