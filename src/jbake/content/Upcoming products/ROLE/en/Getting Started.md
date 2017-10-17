title=About
date=2013-09-24
type=page
status=published
big=TCUpcoming
summary=ROLEGetting
~~~~~~
## Upcoming Products > ROLE > Getting Started

> ※ 본 문서는 alpha 개발 단계의 문서입니다.
> 사용에 관심이 있으신 분은 **support@cloud.toast.com**으로 문의해 주시기 바랍니다.

## 게시판 예제

조그마한 게시판을 만든다고 가정해보자.
/board/v1.0/{boardId} API 를 호출하면 게시물을 반환하게 되고
해당 API 는 인증 된 회원만 호출할 수 있다고 가정하자.
먼저 인증 된 회원이라는 Role 을 만들어야 한다.

### Role 생성

**[CONSOLE 사용 시]**

![[그림 1.1] Role 탭으로 이동](http://static.toastoven.net/prod_role/role_03.png)
<center>[그림 1.1] Role 탭으로 이동</center>

![[그림 1.2] Role 추가](http://static.toastoven.net/prod_role/role_04.png)
<center>[그림 1.2] Role 추가</center>

**[RESTFUL API 호출 시]**

```bash
curl -X POST -H "Content-Type: application/json" -H "X-Secret-Key: KImfa21z" -d '{
  "description": "인증된 회원",
  "roleId": "MEMBER"
}' "https://api-role.cloud.toast.com/role/v1.0/appkeys/1fasfDas/roles"
```

**[Client SDK 이용 시]**

```java
// applicationContext.xml 에서 clientFactory 를 bean 으로 등록했다 가정한다.
TCRoleClient client = clientFactory.getClient();
client.createRole("MEMBER", "인증된 회원");
```

### Operation 생성

Role 을 만들었으면 Operation 을 만들어야 한다.

**[CONSOLE 사용 시]**

![[그림 2.1] Operation 탭으로 이동](http://static.toastoven.net/prod_role/role_05.png)
<center>[그림 2.1] Operation 탭으로 이동</center>

![[그림 2.2] Operation 추가](http://static.toastoven.net/prod_role/role_06.png)
<center>[그림 2.2] Operation 추가</center>

**[RESTFUL API 호출 시]**

```bash
curl -X POST -H "Content-Type: application/json" -H "X-Secret-Key: KImfa21z" -d '{
  "description": "HTTP GET",
  "operationId": "GET"
}' "https://api-role.cloud.toast.com/role/v1.0/appkeys/1fasfDas/operations"
```

**[Client SDK 이용 시]**

```java
client.createOperation("GET", "HTTP GET");
```

### Resource 생성

이제 /board/v1.0/{boardId} 를 Resource 로 등록해보자.
board, v1.0, {boardId} 로 나누어서 순차적으로 등록해야 한다.

**[CONSOLE 사용 시]**

![[그림 3.1] Resource 탭으로 이동](http://static.toastoven.net/prod_role/role_07.png)
<center>[그림 3.1] Resource 탭으로 이동</center>

![[그림 3.2] Resource 를 추가하고자하는 부모 Resource Tree 에서 마우스 우클릭](http://static.toastoven.net/prod_role/role_08.png)
<center>[그림 3.2] Resource 를 추가하고자하는 부모 Resource Tree 에서 마우스 우클릭</center>

![[그림 3.3] Resource #1 추가](http://static.toastoven.net/prod_role/role_09.png)
<center>[그림 3.3] Resource #1 추가</center>

![[그림 3.4] Resource #2 추가](http://static.toastoven.net/prod_role/role_10.png)
<center>[그림 3.4] Resource #2 추가</center>

![[그림 3.5] Resource #3 추가](http://static.toastoven.net/prod_role/role_11.png)
<center>[그림 3.5] Resource #3 추가</center>

![[그림 3.6] 모든 Resource 가 추가 된 모습](http://static.toastoven.net/prod_role/role_12.png)
<center>[그림 3.6] 모든 Resource 가 추가 된 모습</center>

**[RESTFUL API 호출 시]**

```bash
curl -X POST -H "Content-Type: application/json" -H "X-Secret-Key: KImfa21z" -d '{
  "description": "",
  "metadata": "",
  "name": "board",
  "path": "/board",
  "priority": 0,
  "resourceId": "API_BOARD"
}' "https://api-role.cloud.toast.com/role/v1.0/appkeys/1fasfDas/resources"

curl -X POST -H "Content-Type: application/json" -H "X-Secret-Key: KImfa21z" -d '{
  "description": "",
  "metadata": "",
  "name": "v1.0",
  "path": "/board/v1.0",
  "priority": 0,
  "resourceId": "API_BOARD_VERSION"
}' "https://api-role.cloud.toast.com/role/v1.0/appkeys/1fasfDas/resources"

curl -X POST -H "Content-Type: application/json" -H "X-Secret-Key: KImfa21z" -d '{
  "description": "",
  "metadata": "",
  "name": "{boardId}",
  "path": "/board/v1.0/{boardId}",
  "priority": 0,
  "resourceId": "API_BOARD_ID"
}' "https://api-role.cloud.toast.com/role/v1.0/appkeys/1fasfDas/resources"
```

**[Client SDK 이용 시]**

```java
client.createResource("API_BOARD", "", "board", "/board", 0, "");
client.createResource("API_BOARD_VERSION", "", "v1.0", "/board/v1.0", 0, "");
client.createResource("API_BOARD_ID", "", "{boardId}", "/board/v1.0/{boardId}", 0, "");
```

### Role - Resource 관계 생성

Resource 까지 등록했다면, Role 과 Resource 의 권한 관계를 설정해야 한다.
하위 Resource 에 권한을 부여하면, 모든 상위 Resource 에 자동으로 권한이 같이 부여되므로,
API_BOARD_ID 에만 권한을 부여해보자.

**[CONSOLE 사용 시]**

![[그림 4.1] Role - Resource 관계 추가](http://static.toastoven.net/prod_role/role_13.png)
<center>[그림 4.1] Role - Resource 관계 추가</center>

![[그림 4.2] Role - Resource 관계 추가 후 모습](http://static.toastoven.net/prod_role/role_14.png)
<center>[그림 4.2] Role - Resource 관계 추가 후 모습</center>

**[RESTFUL API 호출 시]**

```bash
curl -X POST -H "Content-Type: application/json" -H "X-Secret-Key: KImfa21z" -d '{
  "operationId": "GET",
  "roleId": "MEMBER"
}' "https://api-role.cloud.toast.com/role/v1.0/appkeys/1fasfDas/resources/API_BOARD_ID/authorizations"
```

**[Client SDK 이용 시]**

```java
client.addAuthorization("API_BOARD_ID", "GET", "MEMBER");
```

### User 생성

마지막으로 User 를 추가하고 Role 을 부여한다.

**[CONSOLE 사용 시]**

![[그림 5.1] User 탭으로 이동](http://static.toastoven.net/prod_role/role_15.png)
<center>[그림 5.1] User 탭으로 이동</center>

![[그림 5.2] User 추가](http://static.toastoven.net/prod_role/role_16.png)
<center>[그림 5.2] User 추가</center>

**[RESTFUL API 호출 시]**

```bash
curl -X POST -H "Content-Type: application/json" -H "X-Secret-Key: KImfa21z" -d '{
  "users": [
    {
      "description": "홍길동",
      "relations": [
        {
          "roleId": "MEMBER",
          "scopeId": "ALL"
        }
      ],
      "userId": "12345678-1234-5678-1234-567812345678"
    }
  ]
}' "https://api-role.cloud.toast.com/role/v1.0/appkeys/1fasfDas/users"
```

**[Client SDK 이용 시]**

```java
List<UserRoleRelation> relations = new ArrayList<UserRoleRelation>();
relations.add(new UserRoleRelation("MEMBER", "ALL"));
client.createUser("12345678-1234-5678-1234-567812345678", "홍길동", relations);
```

### 권한 체크

userId 가 Header 의 'uuid' 로 값이 넘어 온다고 가정해보자.
12345678-1234-5678-1234-567812345678 사용자가 /board/v1.0/1 API 를 호출하였을 때, 권한을 체크하면 아래와 같다.

**[RESTFUL API 호출 시]**

```bash
curl -X POST -H "Content-Type: application/json" -d '{
    "resources": [
        {
            "operationId": "GET",
            "resourceId": "",
            "resourcePath": "/board/v1.0/1",
            "scopeId": "ALL"
        }
    ]
}' "https://api-role.cloud.toast.com/role/v1.0/appkeys/1fasfDas/users/12345678-1234-5678-1234-567812345678/authorizations"
```

**[Spring Client SDK 이용 시]**

```java
public class BoardController {
	@Autowired
	private TCRoleClientFactory clientFactory;

	@RequestMapping(value = "/board/v1.0/{boardId}", method = RequestMethod.GET)
	@ResponseBody
	public ResponseEntity<String> getBoard(
		@RequestHeader("uuid") String uuid,
		@PathVariable("boardId") Integer boardId)
	{
		TCRoleClient client = clientFactory.getClient();

		// scopeId 는 생략 시 'ALL' 을 사용하게 된다.
		if (client.hasAuthorizationById(uuid, "/board/v1.0/{boardId}", "GET") == false) {
			return new ResponseEntity<String>(HttpStatus.UNAUTHORIZED);
		}
```

**[Spring Client SDK @Authorization 이용 시]**

```java
public class BoardController {
	@Autowired
	private TCRoleClientFactory clientFactory;

	// scopeId 는 생략 시 'ALL' 을 사용하게 된다.
	@Authorization(
		userId = @AuthParam(
			type = AuthParamType.HEADER_PARAM, value = "uuid"))
	@RequestMapping(value = "/board/v1.0/{boardId}", method = RequestMethod.GET)
	@ResponseBody
	public ResponseEntity<String> getBoard(
		@RequestHeader("uuid") String uuid,
		@PathVariable("boardId") Integer boardId)
	{
```

userId 가 Query Parameter 의 'uuid' 로 넘어온다고 가정하면 아래와 같다.

**[Spring Client SDK @Authorization 이용 시]**

```java
public class BoardController {
	@Autowired
	private TCRoleClientFactory clientFactory;

	// scopeId 는 생략 시 'ALL' 을 사용하게 된다.
	@Authorization(
		userId = @AuthParam(
			type = AuthParamType.QUERY_PARAM, value = "uuid"))
	@RequestMapping(value = "/board/v1.0/{boardId}", method = RequestMethod.GET)
	@ResponseBody
	public ResponseEntity<String> getBoard(
		@PathVariable("boardId") Integer boardId,
		@ModelAttribute("uuid") String uuid)
	{
```

userId 가 고정된 값이라고 가정하면 아래와 같다.

**[Spring Client SDK @Authorization 이용 시]**

```java
public class BoardController {
	@Autowired
	private TCRoleClientFactory clientFactory;

	// scopeId 는 생략 시 'ALL' 을 사용하게 된다.
	@Authorization(
		userId = @AuthParam(
			type = AuthParamType.STATIC, value = "12345678-1234-5678-1234-567812345678"))
	@RequestMapping(value = "/board/v1.0/{boardId}", method = RequestMethod.GET)
	@ResponseBody
	public ResponseEntity<String> getBoard(
		@PathVariable("boardId") Integer boardId,
		@ModelAttribute("uuid") String uuid)
	{
```

## Import / Export

ROLE 의 데이터를 한번에 다운받거나, 한꺼번에 업로드를 하려면 Import / Export 기능을 이용한다.

![[그림 6.1] Import / Export](http://static.toastoven.net/prod_role/role_18.png)
<center>[그림 6.1] Import / Export</center>

[Excel 다운로드] 를 클릭하면 ROLE 에 등록된 모든 Resource, Role, Operation, Scope, User 정보가 담긴 Excel 파일을 다운 받을 수 있다.
[Excel 업로드] 를 클릭하면 Excel 에 담긴 데이터를 ROLE 로 업로드 할 수 있다. 이때 사용되는 Excel 파일은 반드시 [Excel 다운로드] 를 클릭하여 다운받은 Excel 파일의 형식과 동일해야 한다.

### Resource 등록

[Excel 다운로드] 를 통해 받은 Excel 파일을 열고, Resource 시트로 이동 후, 필수 Cell 의 값을 채운다.

![[그림 6.2] Resource 시트](http://static.toastoven.net/prod_role/role_19.png)
<center>[그림 6.2] Resource 시트</center>

Resource 에 권한을 부여하고 싶다면 Operation ID, Role ID 항목을 작성한다.
동일 Resource 에 여러 권한을 한꺼번에 부여하고 싶다면, Operation ID 와 Role ID 를 제외한 나머지 항목은 모두 동일하게 작성한다.

![[그림 6.3] 동일 Resource 에 여러 권한 부여](http://static.toastoven.net/prod_role/role_20.png)
<center>[그림 6.3] 동일 Resource 에 여러 권한 부여</center>

### Role 등록

[Excel 다운로드] 를 통해 받은 Excel 파일을 열고, Role 시트로 이동 후, 필수 Cell 의 값을 채운다.

![[그림 6.4] Role 시트](http://static.toastoven.net/prod_role/role_21.png)
<center>[그림 6.4] Role 시트</center>

Role 의 연관 관계를 구성하려면 Related ID 를 작성한다.
하나의 Role 에 여러 연관 관계를 구성하려면, ID 와 Description 항목을 동일하게 작성한다.

![[그림 6.5] 하나의 Role 에 여러 연관 관계를 구성](http://static.toastoven.net/prod_role/role_22.png)
<center>[그림 6.5] 하나의 Role 에 여러 연관 관계를 구성</center>

### Operation & Scope 등록

[Excel 다운로드] 를 통해 받은 Excel 파일을 열고, Role 혹은 Scope 시트로 이동 후, 필수 Cell 의 값을 채운다.

![[그림 6.6] Role / Scope 시트](http://static.toastoven.net/prod_role/role_23.png)
<center>[그림 6.4] Role / Scope 시트</center>

### User 등록

[Excel 다운로드] 를 통해 받은 Excel 파일을 열고, User 시트로 이동 후, 필수 Cell 의 값을 채운다.

![[그림 6.7] User 시트](http://static.toastoven.net/prod_role/role_24.png)
<center>[그림 6.7] User 시트</center>

User 에 Role 을 부여 하고 싶다면, Scope ID 와 Role ID 항목을 작성한다.
하나의 User 에 여러 Role 을 부여하고 싶다면, ID 와 Description 항목을 동일하게 작성한다.

![[그림 6.8] 하나의 User 에 여러 Role 부여](http://static.toastoven.net/prod_role/role_25.png)
<center>[그림 6.8] 하나의 User 에 여러 Role 부여</center>

## 데이터 이관

ROLE 을 사용하는 다른 프로젝트가 있다면, 데이터 이관 기능을 이용해서 편리하게 데이터를 동기화 시킬 수 있다.
데이터 동기화의 대상은 Resource, Role, Operation 이며 Scope 과 User 는 동기화 되지 않는다.

우측 상단의 데이터 이관 버튼을 누르면 데이터를 이관 할 프로젝트 혹은 AppKey 를 입력하는 팝업이 노출된다.

![[그림 7.1] 데이터 이관 버튼](http://static.toastoven.net/prod_role/role_28.png)
<center>[그림 7.1] 데이터 이관 버튼</center>

![[그림 7.2] 데이터 이관 팝업](http://static.toastoven.net/prod_role/role_33.png)
<center>[그림 7.2] 데이터 이관 팝업</center>

데이터를 이관 할 프로젝트를 선택하거나, 직접 AppKey 를 입력 할 수 있다.

![[그림 7.3] 프로젝트 선택](http://static.toastoven.net/prod_role/role_34.png)
<center>[그림 7.3] 프로젝트 선택</center>

![[그림 7.4] AppKey 입력](http://static.toastoven.net/prod_role/role_35.png)
<center>[그림 7.4] AppKey 입력</center>

## 캐쉬 삭제

Client SDK 와 서버의 Cache 때문에 변경된 Resource 에 대한 권한 체크 결과가 즉시 반영이 안될 수 있다.
그럴 경우 우측 상단의 서버 설정 파업에서 명시적으로 캐쉬를 삭제 하여 해결 할 수 있다.
![[그림 8.1] 캐쉬 삭제](http://static.toastoven.net/prod_role/role_32.png)