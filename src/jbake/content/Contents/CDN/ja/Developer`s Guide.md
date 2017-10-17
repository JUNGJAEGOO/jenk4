title=About
date=2013-09-24
type=page
status=published
big=TCcontents
summary=CDNDV's
~~~~~~
## Contents > CDN > Developer's Guide

> ※ 본 문서는 CDN에서 제공하는 Public API에 대한 명세입니다.

## CDN API

[API 도메인]

|환경|	도메인|
|---|---|
|Real|	https://api-gw.cloud.toast.com/tc-cdn|

### CDN 생성

#### 요청

[URL]

|Http method|	URI|
|---|---|
|POST|	/v1.0/appKeys/{appKey}/distributions|

[Header parameter]

|값|	타입|	설명|
|---|---|---|
|Authorization|	String|	secret key|

- secret key는 CDN Console 상단의 [URL & Appkey]을 클릭하여 확인하실 수 있습니다.

[Path parameter]

|값|	타입|	설명|
|---|---|---|
|appKey|	String|	appKey|

- appKey는 CDN Console 상단의 [URL & Appkey]을 클릭하여 확인하실 수 있습니다.

[Query parameter]

|값|	타입|	필수| 기본값 |	설명|
|---|---|---|---|---|
|distributions| List| O |   | 생성할 CDN의 오브젝트 리스트|
|- region|	String|	O| |서비스 지역 ("LOCAL": 대한민국, "GLOBAL" : 글로벌)|
|- description|	String|	X|   | 설명|
|- domainAlias|	String|	X|   | Domain alias (개인 혹은 회사가 소유한 도메인 사용)|
|- useOrigin|	String|	O| | Cache 만료 설정 ("Y": 원본 설정 사용, "N":사용자 설정 사용) |
|- maxAge|	Integer|	X|0| Cache 만료 시간(초) |
|- referrerType|	String|	O| |	Referrers 접근 관리 ("BLACKLIST": 블랙 리스트, "WHITELIST": 화이트 리스트) |
|- referrers|	String|	X| |	Referrers (여러 개 입력시 \\n 토큰으로 분리하여 입력해주세요. )|
|- origins|	List|	O | |	원본 서버 오브젝트 리스트 |
|-- origin|	String|	O | |	원본서버 (domain or ip)|
|-- originPath|	String|	X |	|원본서버 하위 경로 |
|-- port|	Integer|	O |	|원본서버 포트|

[Sample request json]

```
{
   "distributions":[
   {
		"region": "LOCAL",
		"description" : "sample-cdn",
		"useOrigin" : "N",
    "maxAge": 86400,
    "referrerType" : "BLACKLIST",
    "referrers" : "cloud.toast.com",
		"origins" : [
			{
				"origin" : "static.origin.com",
				"port" : 80,
				"originPath" : "/resources"
			}
		]
	}
	]
}
```

#### 응답

```
{
    "header": {
        "resultCode": Integer,
        "resultMessage": String,
        "isSuccessful": Boolean
    },
    "distributions": [
        {
            "domain": String,
            "domainAlias": String,
            "region": String,
            "description": String,
            "status": String,
            "createTime": Long,
            "useOrigin": String,
            "maxAge": String,
            "referrerType": String,
            "referrers": String,
            "origins": [
                {
                    "origin": String,
                    "originPath": String,
                    "port": Integer
                }
            ]
        }
    ]
}
```

|값|	타입|	설명|
|---|---|---|
|header|	Object|	헤더 영역|
|- isSuccessful|	Boolean|	성공여부|
|- resultCode|	Integer|	실패 코드|
|- resultMessage|	String|	실패 메시지|
|distributions|	List |	생성된 CDN 오브젝트 리스트|
|- domain|	String|	생성된 도메인(서비스) 이름 |
|- domainAlias|	String|	소유 도메인 |
|- region|  String| 서비스 지역 ("LOCAL": 대한민국, "GLOBAL" : 글로벌)|
|- description|  String| 설명 |
|- status| String| CDN 상태 ([표] CDN 상태 참고) |
|- createTime|  String| 생성일시 |
|- useOrigin| String| 원본 서버 설정 사용 여부("Y": 원본서버 설정 사용, "ㅜN": 사용자 설정) |
|- maxAge| String| Cache 만료시간(초) |
|- referrerType|  String| Referrers 접근 관리 ("BLACKLIST": 블랙 리스트, "WHITELIST": 화이트 리스트) |
|- referrers| String| referrers 리스트 |
|- origins|  List| 원본 서버 오브젝트 리스트 |
|-- origin|	String|	원본 서버(domain or ip) |
|-- originPath|	String|	원본서버 하위 경로 |
|-- port|	Integer| 원본서버 포트|

### CDN 조회

#### 요청

[URL]

|Http method|	URI|
|---|---|
|GET|	/v1.0/appKeys/{appKey}/distributions|

[Header parameter]

|값|	타입|	설명|
|---|---|---|
|Authorization|	String|	secret key|

- secret key는 CDN Console 상단의 [URL & Appkey]을 클릭하여 확인하실 수 있습니다.

[Path parameter]

|값|	타입|	설명|
|---|---|---|
|appKey|	String|	appKey|

- appKey는 CDN Console 상단의 [URL & Appkey]을 클릭하여 확인하실 수 있습니다.

[Query parameter]

|값|	타입|	필수| 기본값 |	설명|
|---|---|---|---|---|
|domain| String | O |  | 조회할 도메인(서비스 이름)|

#### 응답

```
{
    "header": {
        "resultCode": Integer,
        "resultMessage": String,
        "isSuccessful": Boolean
    },
    "distributions": [
        {
            "domain": String,
            "domainAlias": String,
            "region": String,
            "description": String,
            "status": String,
            "createTime": Long,
            "useOrigin": String,
            "maxAge": String,
            "referrerType": String,
            "referrers": String,
            "origins": [
                {
                    "origin": String,
                    "originPath": String,
                    "port": Integer,
                }
            ]
        }
    ]
}
```

|값|	타입|	설명|
|---|---|---|
|header|	Object|	헤더 영역|
|- isSuccessful|	Boolean|	성공여부|
|- resultCode|	Integer|	실패 코드|
|- resultMessage|	String|	실패 메시지|
|distributions|	List |	생성된 CDN 오브젝트 리스트|
|- domain|	String|	domain 이름(서비스 이름) |
|- domainAlias|	String|	소유 도메인 |
|- region|  String| 서비스 지역 ("LOCAL": 대한민국, "GLOBAL" : 글로벌)|
|- description|  String| 설명 |
|- status| String| CDN 상태 ([표] CDN 상태 참고) |
|- createTime|  String| 생성일시 |
|- useOrigin| String| 원본 서버 설정 사용 여부("Y": 원본서버 설정 사용, "ㅜN": 사용자 설정) |
|- maxAge| String| Cache 만료시간(초) |
|- referrerType|  String| Referrers 접근 관리 ("BLACKLIST": 블랙 리스트, "WHITELIST": 화이트 리스트) |
|- referrers| String| referrers 리스트 |
|- origins|  List| 원본 서버 오브젝트 리스트 |
|-- origin|	String|	원본 서버(domain or ip) |
|-- originPath|	String|	원본서버 하위 경로 |
|-- port|	Integer| 원본서버 포트|

### CDN 수정

#### 요청

[URL]

|Http method|	URI|
|---|---|
|PUT|	/v1.0/appKeys/{appKey}/distributions|

[Header parameter]

|값|	타입|	설명|
|---|---|---|
|Authorization|	String|	secret key|

- secret key는 CDN Console 상단의 [URL & Appkey]을 클릭하여 확인하실 수 있습니다.

[Path parameter]

|값|	타입|	설명|
|---|---|---|
|appKey|	String|	appKey|

- appKey는 CDN Console 상단의 [URL & Appkey]을 클릭하여 확인하실 수 있습니다.

[Query parameter]

|값|	타입|	필수| 기본값	| 설명|
|---|---|---|---|---|
|domain| String | O |  | 수정할 도메인(서비스 이름)|
|- description|	String|	X|  | 설명|
|- useOrigin|	String|	O|  | Cache 만료 설정 ("Y": 원본 설정 사용, "N":사용자 설정 사용) |
|- domainAlias|	String|	X | | Domain alias (개인 혹은 회사가 소유한 도메인 사용)
|- maxAge|	Integer|	X| 0 | Cache 만료 시간(초) |
|- referrerType|	String|	O|  |	Referrers 접근 관리 ("BLACKLIST": 블랙 리스트, "WHITELIST": 화이트 리스트) |
|- referrers|	String|	X |  |	Referrers (여러 개 입력시 \\n 토큰으로 분리하여 입력해주세요. )|
|- origins|	List|	O | |	원본서버|
|-- origin|	String|	O | |	원본서버 (domain or ip)|
|-- originPath|	String|	X | |	원본서버 하위 경로 |
|-- port|	Integer|	O | |	원본서버 포트|


[Sample request json]

```
{
		"domain" : "sample.cdn.toastcloud.com",
		"description" : "change contents",
		"useOrigin" : "N",
		"referrerType" : "BLACKLIST",
		"referrers" : "test.com",
		"maxAge": 86400,
		"origins" : [
			{
				"origin" : "static.resource.com",
				"port" : 80,
				"originPath" : "/latest/resources"
			}
		]
}
```

#### 응답

```
{
    "header": {
        "resultCode": Integer,
        "resultMessage": String,
        "isSuccessful": Boolean
    }
}
```
|값|	타입|	설명|
|---|---|---|
|header|	Object|	헤더 영역|
|- isSuccessful|	Boolean|	성공여부|
|- resultCode|	Integer|	실패 코드|
|- resultMessage|	String|	실패 메시지|


### Purge

#### 요청

[URL]

|Http method|	URI|
|---|---|
|POST|	/v1.0/appKeys/{appKey}/purges|

[Header parameter]

|값|	타입|	설명|
|---|---|---|
|Authorization|	String|	secret key|

- secret key는 CDN Console 상단의 [URL & Appkey]을 클릭하여 확인하실 수 있습니다.

[Path parameter]

|값|	타입|	설명|
|---|---|---|
|appKey|	String|	appKey|

- appKey는 CDN Console 상단의 [URL & Appkey]을 클릭하여 확인하실 수 있습니다.


[Query parameter]

|값|	타입|	필수|	기본값 |설명|
|---|---|---|---|---|
|domain|	String|	O|  | Purge할 도메인(서비스) 이름 |
|purgeType| List | O |  |Purge Type("ITEM", "WILDCARD", "ALL") |
|purgeList|	String|	X| | purge 항목 리스트 (여러 개를 입력할 경우 \\n 토큰으로 분리하여 입력해주세요, purgeType이 ALL인 경우 입력하지 않아도됩니다.) |

[Sample json request]
```
{
	"domain": "sample.cdn.toastcloud.com",
	"purgeType": "ITEM",
	"purgeList":"/img_01.png"
}
```
#### 응답

```
{
    "header": {
        "resultCode": Integer,
        "resultMessage": String,
        "isSuccessful": Boolean
    },
    "purgeSeq" : Integer
}
```
|값|	타입|	설명|
|---|---|---|
|header|	Object|	헤더 영역|
|- isSuccessful|	Boolean|	성공여부|
|- resultCode|	Integer|	실패 코드|
|- resultMessage|	String|	실패 메시지|
|purgeSeq|	String|	Purge 요청 번호|


### Purge 조회

#### 요청

[URL]

|Http method|	URI|
|---|---|
|GET|	/v1.0/appKeys/{appKey}/purges|

[Header parameter]

|값|	타입|	설명|
|---|---|---|
|Authorization|	String|	secret key|

- secret key는 CDN Console 상단의 [URL & Appkey]을 클릭하여 확인하실 수 있습니다.

[Path parameter]

|값|	타입|	설명|
|---|---|---|
|appKey|	String|	appKey|

- appKey는 CDN Console 상단의 [URL & Appkey]을 클릭하여 확인하실 수 있습니다.


[Query parameter]

|값|	타입|	필수| 기본값 |	설명|
|---|---|---|---|---|
|domain|String|	O| | Purge할 도메인(서비스) 이름 |


#### 응답

```
{
    "header": {
        "resultCode": Integer,
        "resultMessage": String,
        "isSuccessful": Boolean
    },
    "totalItems": Integer,
    "purges": [
        {
            "seq": Integer,
            "progress": Integer,
            "purgeTime": Long,
            "lastCheckTime": Long,
            "type": String,
            "path": String
        }
    ]
}
```
|값|	타입|	설명|
|---|---|---|
|header|	Object|	헤더 영역|
|- isSuccessful|	Boolean|	성공여부|
|- resultCode|	Integer|	실패 코드|
|- resultMessage|	String|	실패 메시지|
|purges|	List|	purge 리스트|
|- seq|	Integer|	purge 요청 번호 |
|- progress|	Integer|	purge 진행률|
|- purgeTime|	Long|	purge 요청 시간 |
|- lastCheckTime|	Long|	purge 수행 마지막 체크 시간 |
|- type|	String|	Purge Type("ITEM", "WILDCARD", "ALL") |
|- path|	String| purge 요청 항목 |

## CDN 코드

### CDN 상태 코드

|값|설명|
|---|---|
|OPENING|서비스 시작 중|
|OPEN | 서비스 중|
|MODIFYING| 수정중|
|RESUME | 시작|
|SUSPENDING | 정지 진행중|
|SUSPEND | 정지|
|CLOSING| 사용 종료중|
|CLOSE| 사용 종료|

[표1] CDN 상태 코드
